// ======================================================================
// \title  BpfSequencer.cpp
// \author ezrak, pendergrast
// \brief  cpp file for BpfSequencer component implementation class
// ======================================================================

#include "Components/BpfSequencer/BpfSequencer.hpp"
#include <cstring>
#include "BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include <thread>
#include <chrono>
#include <stdio.h>
#include <stdexcept>
#include <pthread.h>
#include <sched.h>

namespace Components {

BpfSequencerVM::~BpfSequencerVM() {
    bpf_mem = nullptr;
}

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

BpfSequencer ::BpfSequencer(const char* const compName) : 
BpfSequencerComponentBase(compName),
bpf_mem(nullptr),
bpf_mem_size(0) { 
    running = true;

    // Initialize the job queue
    const FwSizeType queue_depth = MAX_JOBS;
    const FwSizeType message_size = sizeof(ScheduledJob);
    const Fw::String queue_name("BPFSequencerJobQueue");
    const auto status = job_queue.create(QUEUE_MAGIC_NUMBER, queue_name, queue_depth, message_size);
    FW_ASSERT(status == Os::QueueInterface::Status::OP_OK);

    this->register_bpf_helpers({
        { 1, { reinterpret_cast<void*>(maps::bpf_map_lookup_elem), "bpf_map_lookup_elem" } },
        { 2, { reinterpret_cast<void*>(maps::bpf_map_update_elem), "bpf_map_update_elem" } },
        { 3, { reinterpret_cast<void*>(maps::bpf_map_delete_elem), "bpf_map_delete_elem" } },
    });
}

BpfSequencer ::~BpfSequencer() {
    // Signal workers to stop
    running = false;
    
    // Join all worker threads
    for (auto& thread : workers) {
        if (thread.joinable()) {
            thread.join();
        }
    }
}

// Worker function - pops jobs from shared queue and executes them
void BpfSequencer::run_worker() {

    #ifdef __linux__
    // NOTE: We cannot use standard fprime threads/thread priority because the fprime tasks 
    // are meant to run on non-looping routines
    struct sched_param p; 
    p.sched_priority = 20; 
    if(pthread_setschedparam(pthread_self(), SCHED_RR, &p) != 0) { 
        this->log_WARNING_HI_WorkerPrioritySetFailed();
    } 
    #endif

    while (running) {
        ScheduledJob job;
        FwSizeType size = 0;
        FwQueuePriorityType priority = 0;

        auto status = job_queue.receive(
            reinterpret_cast<U8*>(&job),
            sizeof(ScheduledJob),
            Os::QueueInterface::BlockingType::BLOCKING,
            size,
            priority
        );

        if (status != Os::QueueInterface::Status::OP_OK) {
            continue;  // Queue empty or error
        }

        if (!running) {
            return;
        }
        
        // Execute the VM outside the lock
        run(job.vm_id);
    }
}

// Rebuild the deadline schedule based on all VMs' rate groups and runtimes
void BpfSequencer::rebuild_deadline_schedule() {
    for (auto& tick_jobs : schedule) {
        tick_jobs.clear();
    }
    
    // For each VM, if it's assigned to a rate group, calculate its deadlines
    for (U32 vm_id = 0; vm_id < k_num_vms; vm_id++) {
        if (!vms[vm_id]) continue;
        
        auto& vm = vms[vm_id];
        U32 rg_id = vm->rate_group_id;
        
        if (rg_id >= k_max_rate_groups) continue;  // Not assigned to a rate group
        
        U32 interval = rate_group_intervals[rg_id]; // Number of ticks between each run
        if (interval == 0) continue;
        
        // Calculate the period in ms
        // Example 1000hz rg: 1 tick * (1000 / 1000) = 1
        // Period is 1 tick
        F32 period_ms = interval * (1000.0f / timer_freq_hz);
        if (period_ms <= 0.0f) continue; 

        // Calculate how many times we run this per cycle
        U32 runs_per_cycle = static_cast<U32>(k_cycle_period_ms / period_ms); 
        
        // For each run, calculate the scheduled_time = deadline - runtime
        for (U32 i = 1; i <= runs_per_cycle; i++) {
            F32 deadline = i * period_ms; // When this task needs to be done
            F32 scheduled_time = deadline - vm->runtime_ms;
            
            // Clamp schedule_time to valid range [0, 1000]
            if (scheduled_time < 0.0f) scheduled_time = 0.0f;
            if (scheduled_time > k_cycle_period_ms) scheduled_time = k_cycle_period_ms;

            U32 schedule_time_tick = static_cast<U32>(scheduled_time);
            
            schedule[schedule_time_tick].push_back(vm_id);
        }
    }
}

// Push jobs for the current tick into the shared queue
void BpfSequencer::schedule_jobs_for_tick(U32 tick) {
    auto& jobs = schedule[tick];
    if (jobs.empty()){
        return;
    }

    {        
        for (auto vm_id : jobs) {
            ScheduledJob job;
            job.deadline = tick;
            job.vm_id = vm_id;;
            
            FwSizeType size = sizeof(ScheduledJob);
            FwQueuePriorityType priority = static_cast<FwQueuePriorityType>(job.deadline);
            auto status = job_queue.send(
                reinterpret_cast<const U8*>(&job),
                size,
                priority,
                Os::QueueInterface::BlockingType::BLOCKING
            );
            
            if (status == Os::QueueInterface::Status::FULL) {
                // Queue full - log warning and drop job
                this->log_WARNING_HI_SchedulerQueueFull(vm_id);
            }
        }
    }
}

/*
Configure the sequencer. Call in Topology.cpp during topology setup.
Arguments:
    rate_groups[] - An array of tick intervals for rate groups
    timer_freq_hz - The frequency of the base input clock frequency
*/
void BpfSequencer::configure(U32 rate_groups[5], U32 timer_freq_hz) {
    for (int i = 0; i < k_max_rate_groups; i++) {
        this->rate_group_intervals[i] = rate_groups[i];
        if (rate_groups[i] != 0) {
            this->num_rate_groups++;
        }
    }

    this->timer_freq_hz = timer_freq_hz;
    this->num_workers = this->num_rate_groups > 0 ? this->num_rate_groups : 2;

    // Initialize worker threads
    workers.reserve(num_workers);
    for (U32 i = 0; i < num_workers; i++) {
        workers.emplace_back([this]() {
            this->run_worker();
        });
    }

    this->configured = true;
}

void BpfSequencer::register_bpf_helper(U32 index, const VmExternalFunction& helper) {
    if (!bpf_helpers.emplace(index, helper).second) {
        throw std::runtime_error("BPF helper already registered for index " + std::to_string(index));
    }
}

void BpfSequencer::register_bpf_helpers(const std::vector<std::pair<U32, VmExternalFunction>>& helpers) {
    for (const auto& [index, helper] : helpers) {
        register_bpf_helper(index, helper);
    }
}

U32 BpfSequencer::register_external_functions(bpftime::llvmbpf_vm& vm) {

    // Register lddw helpers
    vm.set_lddw_helpers(maps::map_by_fd, maps::map_by_idx, maps::map_val, nullptr, nullptr);

    // Register external functions
    for (const auto& [index, helper] : bpf_helpers) {

        U32 result = vm.register_external_function(index, helper.name, helper.fn);

        if (result)
            return result;
    }

    return 0;
}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

// Port for handling rate groups - implements EDF scheduling
void BpfSequencer::schedIn_handler(FwIndexType portNum, U32 context) {
    if (job_queue.getMessagesAvailable() > 0){
        // Slip - log error
        this->log_WARNING_HI_SchedulerSlip(this->ticks);
        return;
    }

    this->ticks++;
    
    // Calculate position in scheduling cycle
    U32 cycle_length_ticks = timer_freq_hz;  // Ticks per 1-second cycle
    cycle_tick = (ticks - 1) % cycle_length_ticks;
    
    // Push jobs for this tick into the shared queue
    schedule_jobs_for_tick(cycle_tick);
}

F64 BpfSequencer::getVmBenchmark_handler(FwIndexType portNum, const Components::BENCHMARK_TEST& test, bool compile) {
    return get_benchmark_vm(test, compile);
}

// Ping in and out
void BpfSequencer::pingIn_handler(FwIndexType portNum, U32 key) {
    this->pingOut_out(0, key);
}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

Fw::CmdResponse BpfSequencer::result_to_response(Fw::Success result) {
    return (result == Fw::Success::SUCCESS) ? Fw::CmdResponse::OK : Fw::CmdResponse::EXECUTION_ERROR;
}

void BpfSequencer::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,
                                            U32 cmdSeq,
                                            U32 vmId,
                                            const Fw::CmdStringArg& sequenceFilePath) {
    // Load the sequence
    Fw::Success result = this->load(vmId, sequenceFilePath.toChar());

    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

void BpfSequencer::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vmId) {
    // The sequence is compiled, so we can run it
    Fw::Success result = this->run(vmId, true);  // Now we run the sequence!
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

// Set VM Rate Groups - deadline is calculated as: interval - runtime
void BpfSequencer::SetVMRateGroup_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vm_id, F32 rate_group_hz, F32 runtime_ms) {
    if (!vms[vm_id]) {  // If we don't have a VM loaded
        return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::FORMAT_ERROR);
    }
    if (rate_group_hz == 0) {
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::INVALID_OPCODE);
        return;
    }

    U32 expected_interval = U32(this->timer_freq_hz / rate_group_hz);

    bool found = false;

    for (int i = 0; i < k_max_rate_groups; i++) {
        if (this->rate_group_intervals[i] == expected_interval) {
            found = true;

            // Store scheduling info in the VM struct
            vms[vm_id]->rate_group_id = i;
            vms[vm_id]->runtime_ms = runtime_ms;

            // Rebuild the schedule with the new VM
            rebuild_deadline_schedule();
            
            this->log_ACTIVITY_LO_RateGroupSet(vm_id, rate_group_hz);
            break;
        }
    }

    if (!found) {
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }

    return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

// Stop VM Rate Group
void BpfSequencer::StopRateGroup_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vm_id) {
    if (!vms[vm_id]) {
        return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::FORMAT_ERROR);
    }
    
    // Remove VM from its rate group
    vms[vm_id]->rate_group_id = static_cast<U32>(-1);
    vms[vm_id]->runtime_ms = 0.0f;
    
    // Rebuild schedule without this VM
    rebuild_deadline_schedule();

    this->log_ACTIVITY_LO_RateGroupStopped(vm_id);
    return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

void BpfSequencer::BPF_MAP_CREATE_cmdHandler(FwOpcodeType opCode,
                                             U32 cmdSeq,
                                             U32 fd,
                                             Components::BpfSequencer_BPF_MAP_TYPE type,
                                             U32 key_size,
                                             U32 value_size,
                                             U32 max_entries,
                                             U32 map_flags) {
    // Set the map definition
    bpf_map_def map_def{.type = type,
                        .key_size = key_size,
                        .value_size = value_size,
                        .max_entries = max_entries,
                        .map_flags = map_flags};

    // Create the map
    Fw::Success result = this->map_create(map_def, fd);
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

namespace {
U32 escape_hex_str(const char* str, U8 buffer[]) {
    U32 size = 0;
    while (*str && size++ < Fw::CmdStringArg::STRING_SIZE) {
        *(buffer++) = static_cast<U8>(std::strtol(str, const_cast<char**>(&str), 16));
    }
    return size;
}
}  // namespace

void BpfSequencer::BPF_MAP_LOOKUP_ELEM_cmdHandler(FwOpcodeType opCode,
                                                  U32 cmdSeq,
                                                  U32 fd,
                                                  const Fw::CmdStringArg& key,
                                                  const Fw::CmdStringArg& output_path) {
    // Serialize buffers
    U8 key_buffer[Fw::CmdStringArg::STRING_SIZE];
    U32 key_size = escape_hex_str(key.toChar(), key_buffer);

    // Lookup an element in the map
    Fw::Success result = this->map_lookup_elem(fd, key_buffer, key_size, output_path.toChar());
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

void BpfSequencer::BPF_MAP_UPDATE_ELEM_cmdHandler(FwOpcodeType opCode,
                                                  U32 cmdSeq,
                                                  U32 fd,
                                                  const Fw::CmdStringArg& key,
                                                  const Fw::CmdStringArg& value,
                                                  U64 flags) {
    // Serialize buffers
    U8 key_buffer[Fw::CmdStringArg::STRING_SIZE];
    U32 key_size = escape_hex_str(key.toChar(), key_buffer);
    U8 value_buffer[Fw::CmdStringArg::STRING_SIZE];
    U32 value_size = escape_hex_str(value.toChar(), value_buffer);

    // Update an element in the map
    Fw::Success result = this->map_update_elem(fd, key_buffer, key_size, value_buffer, value_size, flags);
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

void BpfSequencer::BPF_MAP_DELETE_ELEM_cmdHandler(FwOpcodeType opCode,
                                                  U32 cmdSeq,
                                                  U32 fd,
                                                  const Fw::CmdStringArg& key) {
    // Serialize buffers
    U8 key_buffer[Fw::CmdStringArg::STRING_SIZE];
    U32 key_size = escape_hex_str(key.toChar(), key_buffer);

    // Delete an element in the map
    Fw::Success result = this->map_delete_elem(fd, key_buffer, key_size);
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

}  // namespace Components
