// ======================================================================
// \title  BpfSequencer.cpp
// \author ezrak, pendergrast
// \brief  cpp file for BpfSequencer component implementation class
// ======================================================================

#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include <cstring>

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

BpfSequencer ::BpfSequencer(const char* const compName) : 
BpfSequencerComponentBase(compName) { }

BpfSequencer ::~BpfSequencer() {}

void BpfSequencer ::configure(U32 rate_groups[5], U32 timer_freq_hz) {
    for (int i = 0; i < this->k_max_rate_groups; i++) {
        this->rate_group_intervals[i] = rate_groups[i];
        if (rate_groups[i] != 0) {
            this->num_rate_groups++;
        }
    }
    this->timer_freq_hz = timer_freq_hz;
    this->configured = true;
}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

// Port for handling rate groups
void BpfSequencer ::schedIn_handler(FwIndexType portNum, U32 context) {
    this->ticks++;
    this->tlmWrite_ticks(this->ticks);

    for(int i = 0; i<this->num_rate_groups; i++){
        if (this->ticks % this->rate_group_intervals[i] == 0){
            for(int j = 0; j<64; j++){
                if(this->rate_group_map[i][j]){ // 1 indicates on 
                    uint64_t res = 0, err = 0;
                    auto vm = this->vms[j];
                    err = vm->bpf_vm.exec(&vm->bpf_mem, vm->bpf_mem_size, vm->res);
                }
            }
        }
    }
}

F64 BpfSequencer ::getVmBenchmark_handler(FwIndexType portNum, const Components::BENCHMARK_TEST& test, bool compile) {
    return get_benchmark_vm(test, compile);
}

//Just ping in and out
void BpfSequencer ::pingIn_handler(FwIndexType portNum, U32 key) {
    this->pingOut_out(0, key);
}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

Fw::CmdResponse BpfSequencer::result_to_response(Fw::Success result) {
    return  (result == Fw::Success::SUCCESS) ? 
        Fw::CmdResponse::OK : 
        Fw::CmdResponse::EXECUTION_ERROR;
}

void BpfSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,
                                              U32 cmdSeq,
                                              U32 vmId,
                                              const Fw::CmdStringArg& sequenceFilePath) {

    // Load the sequence
    Fw::Success result = this->load(vmId, sequenceFilePath.toChar());

    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

void BpfSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 vmId) {
    // The sequence is compiled, so we can run it
    Fw::Success result = this->run(vmId, true); //Now we run the sequence!
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

}  // namespace Components
