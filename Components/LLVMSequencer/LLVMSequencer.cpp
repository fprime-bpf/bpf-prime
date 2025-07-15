// ======================================================================
// \title  LLVMSequencer.cpp
// \author rpendergrast
// \brief  cpp file for LLVMSequencer component implementation class
// ======================================================================

#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"
#include <cstring>

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

LLVMSequencer ::LLVMSequencer(const char* const compName) : 
LLVMSequencerComponentBase(compName), 
vm(),
bpf_mem(nullptr),
bpf_mem_size(0) {
    
    I32 res = maps.register_functions(vm);
    if (res) {
        this->log_WARNING_HI_RegisterFunctionsFailed(
            Fw::LogStringArg(std::strerror(-res))
        );
    }
}

LLVMSequencer ::~LLVMSequencer() {}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

void LLVMSequencer ::checkTimers_handler(FwIndexType portNum, U32 context) {
    // Not yet needed 
}

void LLVMSequencer ::cmdResponseIn_handler(FwIndexType portNum,
                                           FwOpcodeType opCode,
                                           U32 cmdSeq,
                                           const Fw::CmdResponse& response) {
    // Not going to worry about his for now 
    // Port handles the command response - mainly for error checking
    // Will implement when the statemachine is implemented. 
}

//Just ping in and out
void LLVMSequencer ::pingIn_handler(FwIndexType portNum, U32 key) {
    this->pingOut_out(0, key);
}

void LLVMSequencer ::writeTlm_handler(FwIndexType portNum, U32 context) {
    // Telemetry currently not implemented, but this will just write telemetry
    // to the port
}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

void LLVMSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,
                                              U32 cmdSeq,
                                              const Fw::CmdStringArg& sequenceFilePath) {
    /*
    if (sequencer_getState() != State::IDLE) {
        // If the sequencer is not in the IDLE state, command response out and error
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }
    */

    // We are in the IDLE state, so we can load the sequence
    Fw::Success result = this->load(sequenceFilePath.toChar()); //TODO - Implement compile function
    this->sequenceFilePath = sequenceFilePath.toChar();

    if (result == Fw::Success::SUCCESS) {
        this->sequencer_sendSignal_load_success();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
    } else {
        this->sequencer_sendSignal_load_failure();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }
}

void LLVMSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    if (sequencer_getState() != State::READY){
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }

    // The sequence is compiled, so we can run it
    Fw::Success result = this->run(); //Now we run the sequence!
    if (result == Fw::Success::SUCCESS) {
        this->sequencer_sendSignal_run_success();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
    } else {
        this->sequencer_sendSignal_run_failure();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }
}

void LLVMSequencer ::BPF_MAP_CREATE_cmdHandler(FwOpcodeType opCode,
                                               U32 cmdSeq,
                                               Components::LLVMSequencer_BPF_MAP_TYPE type,
                                               U32 key_size,
                                               U32 value_size,
                                               U32 max_entries,
                                               U32 map_flags) {
    
    // Ensure the key and value can fit in a Components::LLVMSequencer_Bytes array
    const auto max_bytes_size = LLVMSequencer_Bytes::SIZE;
    if (key_size > max_bytes_size || value_size > max_bytes_size) {
        Fw::LogStringArg commandName = "BPF_MAP_CREATE";
        Fw::LogStringArg errMsg((key_size > max_bytes_size)? "Invalid key size" : "Invalid value size");
        this->log_ACTIVITY_HI_MapCommandFailed(commandName, errMsg);
        this->sequencer_sendSignal_run_failure();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }

    // Set the map definition
    bpf_map_def map_def {
        .type = type,
        .key_size = key_size,
        .value_size = value_size,
        .max_entries = max_entries,
        .map_flags = map_flags
    };

    // Create the map
    Fw::Success result = this->map_create(map_def);
    if (result == Fw::Success::SUCCESS) {
        this->sequencer_sendSignal_run_success();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
    } else {
        this->sequencer_sendSignal_run_failure();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }
}

void LLVMSequencer ::BPF_MAP_LOOKUP_ELEM_cmdHandler(FwOpcodeType opCode,
                                                    U32 cmdSeq,
                                                    U32 fd,
                                                    Components::LLVMSequencer_Bytes key,
                                                    const Fw::CmdStringArg& output_path) {
    
    // Serialize buffers
    Fw::CmdArgBuffer key_buffer;
    key.serialize(key_buffer);
    
    // Lookup an element in the map
    Fw::Success result = this->map_lookup_elem(fd, key_buffer.getBuffAddr(), output_path.toChar());
    if (result == Fw::Success::SUCCESS) {
        this->sequencer_sendSignal_run_success();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
    } else {
        this->sequencer_sendSignal_run_failure();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }
}

void LLVMSequencer ::BPF_MAP_UPDATE_ELEM_cmdHandler(FwOpcodeType opCode,
                                                    U32 cmdSeq,
                                                    U32 fd,
                                                    Components::LLVMSequencer_Bytes key,
                                                    Components::LLVMSequencer_Bytes value,
                                                    U64 flags) {

    // Serialize buffers
    Fw::CmdArgBuffer key_buffer, value_buffer;
    key.serialize(key_buffer);
    value.serialize(value_buffer);

    // Update an element in the map
    Fw::Success result = this->map_update_elem(fd, key_buffer.getBuffAddr(), value_buffer.getBuffAddr(), flags);
    if (result == Fw::Success::SUCCESS) {
        this->sequencer_sendSignal_run_success();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
    } else {
        this->sequencer_sendSignal_run_failure();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }
}

void LLVMSequencer ::BPF_MAP_DELETE_ELEM_cmdHandler(FwOpcodeType opCode,
                                                    U32 cmdSeq,
                                                    U32 fd,
                                                    Components::LLVMSequencer_Bytes key) {
    // Serialize buffers
    Fw::CmdArgBuffer key_buffer;
    key.serialize(key_buffer);
    
    // Delete an element in the map
    Fw::Success result = this->map_delete_elem(fd, key_buffer.getBuffAddr());
    if (result == Fw::Success::SUCCESS) {
        this->sequencer_sendSignal_run_success();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
    } else {
        this->sequencer_sendSignal_run_failure();
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
    }
}

}  // namespace Components
