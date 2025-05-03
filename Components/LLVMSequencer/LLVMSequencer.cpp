// ======================================================================
// \title  LLVMSequencer.cpp
// \author rpendergrast
// \brief  cpp file for LLVMSequencer component implementation class
// ======================================================================

#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"


namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

LLVMSequencer ::LLVMSequencer(const char* const compName) : 
LLVMSequencerComponentBase(compName), 
vm(),
bpf_mem(nullptr),
bpf_mem_size(0) {}

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

void LLVMSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, const Fw::CmdStringArg& sequenceFilePath) {
    if (sequencer_getState() != State::IDLE) {
        // If the sequencer is not in the IDLE state, command response out and error
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }

    // We are in the IDLE state, so we can load the sequence
    // Pass in the sequence file path to the sequencer state machine so that it can load the sequence
    this->sequencer_sendSignal_cmd_LOAD(sequenceFilePath);
}

void LLVMSequencer ::COMPILE_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    if (sequencer_getState() != State::LOADING){
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }

    this->sequencer_sendSignal_cmd_COMPILE(); //The sequence is loaded, so we can compile it 
}

void LLVMSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    if (sequencer_getState() != State::COMPILING){
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }
    // The sequence is compiled, so we can run it
    this->sequencer_sendSignal_cmd_RUN(); //Now we run the sequence!
}

}  // namespace Components
