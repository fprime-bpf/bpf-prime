// ======================================================================
// \title  BpfSequencer.cpp
// \author ezrak, pendergrast
// \brief  cpp file for BpfSequencer component implementation class
// ======================================================================

#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include <cstring>
#include <algorithm>

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

BpfSequencer ::BpfSequencer(const char* const compName) : 
BpfSequencerComponentBase(compName),
bpf_mem(nullptr),
bpf_mem_size(0) { }

BpfSequencer ::~BpfSequencer() {
    // Signal shutdown and wake up all workers
    shutdown_flag.store(true);
    for (U32 i = 0; i < buffer_condition_vars.size(); i++) {
        pthread_cond_broadcast(&buffer_condition_vars[i]);
    }
    
    // Wait for all worker threads to finish
    for (pthread_t& thread : worker_threads) {
        pthread_join(thread, nullptr);
    }
    
    // Clean up pthread resources
    for (U32 i = 0; i < buffer_mutexes.size(); i++) {
        pthread_mutex_destroy(&buffer_mutexes[i]);
        pthread_cond_destroy(&buffer_condition_vars[i]);
    }
}

void BpfSequencer ::configure(U32 rate_groups[5], U32 timer_freq_hz) {
    for (int i = 0; i < this->k_max_rate_groups; i++) {
        this->rate_group_intervals[i] = rate_groups[i];
        if (rate_groups[i] != 0) {
            this->num_rate_groups++;
        }
    }
    this->timer_freq_hz = timer_freq_hz;
    
    // Initialize worker threads (only once)
    if (!configured) {
        // Resize vectors for pthread types
        job_buffers.resize(k_num_workers);
        buffer_mutexes.resize(k_num_workers);
        buffer_condition_vars.resize(k_num_workers);
        worker_threads.resize(k_num_workers);
        
        // Initialize mutexes and condition variables
        for (U32 i = 0; i < k_num_workers; i++) {
            pthread_mutex_init(&buffer_mutexes[i], nullptr);
            pthread_cond_init(&buffer_condition_vars[i], nullptr);
        }
        
        // Start worker threads
        for (U32 i = 0; i < k_num_workers; i++) {
            // Create a struct to pass both 'this' and worker_id to the thread
            struct WorkerArg {
                BpfSequencer* sequencer;
                U32 worker_id;
            };
            WorkerArg* arg = new WorkerArg{this, i};
            pthread_create(&worker_threads[i], nullptr, worker_thread_wrapper, arg);
        }
    }
    
    this->configured = true;
}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

// Port for handling rate groups
void BpfSequencer ::schedIn_handler(FwIndexType portNum, U32 context) {
    this->ticks++;
    this->tlmWrite_ticks(this->ticks);

    // Step 1: Collect VMs that need to run at this tick (sorted by priority: 0 = highest)
    std::vector<U32> active_vms;
    bool vm_active[k_max_vms] = {false};  // Track which VMs are active to avoid duplicates
    
    for(int i = 0; i < this->num_rate_groups; i++){
        if (this->ticks % this->rate_group_intervals[i] == 0){
            for(int j = 0; j < k_max_vms; j++){
                if(this->rate_group_map[i][j] && !vm_active[j]){
                    active_vms.push_back(static_cast<U32>(j));
                    vm_active[j] = true;
                }
            }
        }
    }
    
    if (active_vms.empty()) {
        return;  // Nothing to do
    }
    
    // Step 2: Clear job buffers and distribute VMs to workers in round-robin fashion
    // VM 0 -> worker 0, VM 1 -> worker 1, VM 2 -> worker 0, VM 3 -> worker 1, etc.
    for (U32 i = 0; i < k_num_workers; i++) {
        pthread_mutex_lock(&buffer_mutexes[i]);
        job_buffers[i].clear();
        pthread_mutex_unlock(&buffer_mutexes[i]);
    }
    
    for (size_t idx = 0; idx < active_vms.size(); idx++) {
        U32 worker_id = idx % k_num_workers;
        pthread_mutex_lock(&buffer_mutexes[worker_id]);
        job_buffers[worker_id].push_back(active_vms[idx]);
        pthread_mutex_unlock(&buffer_mutexes[worker_id]);
    }
    
    // Step 3: Wake up workers to process their jobs
    for (U32 i = 0; i < k_num_workers; i++) {
        pthread_cond_signal(&buffer_condition_vars[i]);
    }
}

// Ping in and out
void BpfSequencer ::pingIn_handler(FwIndexType portNum, U32 key) {
    this->pingOut_out(0, key);
}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

namespace { 
    Fw::CmdResponse result_to_response(Fw::Success result) {
        return  (result == Fw::Success::SUCCESS) ? 
            Fw::CmdResponse::OK : 
            Fw::CmdResponse::EXECUTION_ERROR;
    }
}

void BpfSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,
                                              U32 cmdSeq,
                                              U32 vmId,
                                              const Fw::CmdStringArg& sequenceFilePath) {

    // Load the sequence
    Fw::Success result = this->load(vmId, sequenceFilePath.toChar());
    this->sequenceFilePath = sequenceFilePath.toChar();

    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

void BpfSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vmId) {
    // The sequence is compiled, so we can run it
    Fw::Success result = this->run(vmId); //Now we run the sequence!
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

void BpfSequencer ::SetVMRateGroup_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vm_id, U32 rate_group_hz) {

    if (!vms[vm_id]){ // If we don't have a vm loaded vm
        return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }
    
    if (rate_group_hz == 0) {
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }

    U32 expected_interval = this->timer_freq_hz / rate_group_hz;

    bool found = false;

    for(int i = 0; i<this->k_max_rate_groups; i++){
        if(this->rate_group_intervals[i] == expected_interval){
            found = true; 
            
            for (int j = 0; j < this->k_max_rate_groups; j++) {
                this->rate_group_map[j][vm_id] = false;
            }

            // Assign to this rate group
            this->rate_group_map[i][vm_id] = true;

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

void BpfSequencer ::StopRateGroup_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vm_id) {
    // We want to stop a command from running at any rate group.
    
    if (!vms[vm_id]){ // If we don't have a vm loaded vm
        return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::FORMAT_ERROR);
    } else {
        // Remove this vm from all rate groups
        for(int i = 0; i<this->k_max_rate_groups; i++){
            this->rate_group_map[i][vm_id] = false;
        }
        this->log_ACTIVITY_LO_RateGroupStopped(vm_id);
    }
    
    return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

void BpfSequencer ::BPF_MAP_CREATE_cmdHandler(FwOpcodeType opCode,
                                               U32 cmdSeq,
                                               U32 fd,
                                               Components::BpfSequencer_BPF_MAP_TYPE type,
                                               U32 key_size,
                                               U32 value_size,
                                               U32 max_entries,
                                               U32 map_flags) {

    // Set the map definition
    bpf_map_def map_def {
        .type = type,
        .key_size = key_size,
        .value_size = value_size,
        .max_entries = max_entries,
        .map_flags = map_flags
    };

    // Create the map
    Fw::Success result = this->map_create(map_def, fd);
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

namespace {
    U32 escape_hex_str(const char *str, U8 buffer[]) {
        U32 size = 0;
        while (*str && size++ < Fw::CmdStringArg::STRING_SIZE) {
            *(buffer++) = static_cast<U8>(std::strtol(str, const_cast<char**>(&str), 16));
        }
        return size;
    }
}

void BpfSequencer ::BPF_MAP_LOOKUP_ELEM_cmdHandler(FwOpcodeType opCode,
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

void BpfSequencer ::BPF_MAP_UPDATE_ELEM_cmdHandler(FwOpcodeType opCode,
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

void BpfSequencer ::BPF_MAP_DELETE_ELEM_cmdHandler(FwOpcodeType opCode,
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

// ----------------------------------------------------------------------
// Worker thread implementation
// ----------------------------------------------------------------------

// Static wrapper function for pthread_create (needs C-style function pointer)
void* BpfSequencer::worker_thread_wrapper(void* arg) {
    struct WorkerArg {
        BpfSequencer* sequencer;
        U32 worker_id;
    };
    WorkerArg* worker_arg = static_cast<WorkerArg*>(arg);
    worker_arg->sequencer->worker_thread_function(worker_arg->worker_id);
    delete worker_arg;
    return nullptr;
}

void BpfSequencer::worker_thread_function(U32 worker_id) {
    while (!shutdown_flag.load()) {
        pthread_mutex_lock(&buffer_mutexes[worker_id]);
        
        // Wait until there are jobs or shutdown is signaled
        while (job_buffers[worker_id].empty() && !shutdown_flag.load()) {
            pthread_cond_wait(&buffer_condition_vars[worker_id], &buffer_mutexes[worker_id]);
        }
        
        if (shutdown_flag.load()) {
            pthread_mutex_unlock(&buffer_mutexes[worker_id]);
            break;  // Exit on shutdown
        }
        
        // Copy jobs and release lock (so scheduler can add more jobs next tick)
        std::vector<U32> jobs = job_buffers[worker_id];
        job_buffers[worker_id].clear();
        pthread_mutex_unlock(&buffer_mutexes[worker_id]);
        
        // Execute all VMs assigned to this worker (already sorted by priority)
        for (U32 vm_id : jobs) {
            if (vms[vm_id] != nullptr) {
                this->run(vm_id);
            }
        }
    }
}

}  // namespace Components

