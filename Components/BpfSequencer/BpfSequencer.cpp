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
BpfSequencerComponentBase(compName),
bpf_mem(nullptr),
bpf_mem_size(0) { }

BpfSequencer ::~BpfSequencer() {}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

void BpfSequencer ::cmdResponseIn_handler(FwIndexType portNum,
                                           FwOpcodeType opCode,
                                           U32 cmdSeq,
                                           const Fw::CmdResponse& response) {
    // Not going to worry about his for now 
    // Port handles the command response - mainly for error checking
    // Will implement when the statemachine is implemented. 
}

void BpfSequencer ::writeTlm_handler(FwIndexType portNum, U32 context) {
    // Telemetry currently not implemented, but this will just write telemetry
    // to the port
}

void BpfSequencer ::checkTimers_handler(FwIndexType portNum, U32 context) {
    // Not yet needed 
}

// Port for handling rate groups
void BpfSequencer ::schedIn100Hz_handler(FwIndexType portNum, U32 context) {
    this->ticks++;

    for(int i = 0; i<64; i++){
        if(this->rg_100hz[i]){ // 1 indicates on 
            Fw::Success result = this->run(i);
        }
    }

    if(((this->ticks)%10)==0){
        for(int i = 0; i<64; i++){
            if(this->rg_10hz[i]){ // 1 indicates on 
                Fw::Success result = this->run(i);
            }
        }
    }

    if(((this->ticks)%100)==0){
        for(int i = 0; i<64; i++){
            if(this->rg_1hz[i]){ // 1 indicates on 
                Fw::Success result = this->run(i);
            }
        }
        this->ticks = 0;
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
    // We want to set a command to a certain rate group.
    // TODO: Do we want to have commands running at multiple rate groups - NO
    
    if (rate_group_hz != 100 || rate_group_hz != 10 || rate_group_hz != 1){
        return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    } else { 
        if (!vms[vm_id]){ // If we don't have a vm loaded vm
            return this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        } else {
            // Remove this vm from all other rate groups
            this->rg_100hz[vm_id] = 0;
            this->rg_10hz[vm_id] = 0;
            this->rg_1hz[vm_id] = 0;     
            
            // Set the rate group on 
            if(rate_group_hz == 100) {
                this->rg_100hz[vm_id] = 1;
            } else if (rate_group_hz == 10){
                this->rg_10hz[vm_id] = 1;
            } else if (rate_group_hz == 1){
                this->rg_1hz[vm_id] = 1;
            }
            this->log_ACTIVITY_LO_RateGroupSet(vm_id, rate_group_hz);
        }
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
