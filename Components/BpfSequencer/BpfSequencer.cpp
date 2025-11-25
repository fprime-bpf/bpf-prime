// ======================================================================
// \title  BpfSequencer.cpp
// \author ezrak, pendergrast
// \brief  cpp file for BpfSequencer component implementation class
// ======================================================================

#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include <cstring>
#include <thread>
#include <chrono>
#include <stdio.h>

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

BpfSequencer ::BpfSequencer(const char* const compName) : 
BpfSequencerComponentBase(compName),
bpf_mem(nullptr),
bpf_mem_size(0) { }

BpfSequencer ::~BpfSequencer() {
    // Get rid of workers at destruction
    for (auto& thread: workers) {
        if (thread.joinable()) {
            thread.join();
        }
    }
}

void BpfSequencer ::run_worker(U32 id){
    // Look through the job buffers for the specific worker index and then execute the jobs

    // Place a lock on the the job buffer
    std::unique_lock<std::mutex> lock(buffer_mutex[id]);

    // Wait for the interrupt from the sequencer thread to tell us that we have jobs

    // Steal all the jobs and then unlock the resource
    auto jobs = std::move(job_buffers[id]);
    job_buffers[id].clear();
    lock.unlock();

    // Now we just run all the jobs
    for(auto& job : jobs){
        if(job){
            this->run(job);
        }
    }
}

void BpfSequencer ::configure(U32 rate_groups[5], U32 timer_freq_hz, U32 num_workers) {
    for (int i = 0; i < this->k_max_rate_groups; i++) {
        this->rate_group_intervals[i] = rate_groups[i];
        if (rate_groups[i] != 0) {
            this->num_rate_groups++;
        }
        this->last_run_vm[i] = -1;
    }

    for (int i = 0; i < this->k_num_vms; i++){ // Initially set vm_to_rgId to -1, indicating that the vm is not a part of a rg
        vm_to_rgId[i] = -1;
    }

    this->timer_freq_hz = timer_freq_hz;

    // Initialize worker threads and job buffers
    this->num_workers = num_workers;
    this->job_buffers.resize(this->num_workers); // We want a job buffer per worker. Job buffer holds vmID

    // We want each job buffer to be able to hold num_vms / num_workers jobs
    U32 jobs_per_worker = (this->k_num_vms + this->num_workers - 1) / this->num_workers; // Ceiling division so that we don't overflow
    for (U32 i = 0; i < this->num_workers; i++) {
        this->job_buffers[i].reserve(jobs_per_worker); // Preallocates memory
    }

    // Initialize Threads
    this->workers.reserve(this->num_workers); // This gives us num_workers theads
    for (U32 i = 0; i< this->num_workers; i++) {
        this->workers.emplace_back([this, i](){
            this->run_worker(i); 
        });
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

    // Iterate over all the vms, check if the job needs to be run
    for (int i = 0; i < this->k_num_vms; i++){
        int rgId = this->vm_to_rgId[i]; // -1 means we don't run
        if (rgId != -1 && this->ticks % this->rate_group_intervals[rgId] == 0){
            // This means we have to assign this job to a job buffer!
            
            // First lock the buffer mutex
            std::lock_guard<std::mutex> lock(buffer_mutex[current_buffer]);

            // Now we can add job buffers
            job_buffers[current_buffer].push_back(i);
            
            // Increment the buffer index and wrap around
            current_buffer = (current_buffer + 1) % job_buffers.size();
        }
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

// Set VM Rate Groups
void BpfSequencer ::SetVMRateGroup_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vm_id, F32 rate_group_hz) {

    if (!vms[vm_id]){ // If we don't have a vm loaded vm
        return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::FORMAT_ERROR);
    }
    if (rate_group_hz == 0) {
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::INVALID_OPCODE);
        return;
    }

    U32 expected_interval = U32 (this->timer_freq_hz / rate_group_hz);

    bool found = false;

    for(int i = 0; i<this->k_max_rate_groups; i++){
        if(this->rate_group_intervals[i] == expected_interval){
            found = true; 
            
            this->vm_to_rgId[vm_id] = i; // Set the vm rgId to id

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
void BpfSequencer ::StopRateGroup_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vm_id) {
    // We want to stop a command from running at any rate group.
    
    if (!vms[vm_id]){ // If we don't have a vm loaded vm
        return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::FORMAT_ERROR);
    } else {
        // Remove this vm from all rate groups
        this->vm_to_rgId[vm_id] = -1;

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

}  // namespace Components
