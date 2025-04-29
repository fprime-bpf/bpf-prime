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

void LLVMSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, const char* sequenceFilePath) {
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
    
}

void LLVMSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, const Fw::CmdStringArg& fileName) {

}

// ----------------------------------------------------------------------
// OLD HANDLERS - Keeping for reference
// ----------------------------------------------------------------------

void LLVMSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, const char* sequenceFilePath) {
    // Open the sequence file
    Os::File file;
    Os::File::Status status = file.open(sequenceFilePath, Os::File::OPEN_READ, Os::File::NO_OVERWRITE);
    if (status != Os::File::OP_OK) {
        // File open failed, return error
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }

    // Get the file size
    FwSignedSizeType size_result;
    Os::File::Status sizeStatus = file.size(size_result);
    if (sizeStatus != Os::File::OP_OK) {
        // File size failed, return error
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        file.close();
        return;
    }

    //Create a buffer to hold the file contents
    U8* buffer = new U8[size_result];
    if (buffer == nullptr) {
        // Memory allocation failed, return error
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        file.close();
        return;
    }

    // Read the sequence file into memeory
    Os::File::Status readStatus = file.read(buffer, size_result, Os::File::WAIT);
    if (readStatus != Os::File::OP_OK) {
        // File read failed, return error
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        delete[] buffer;
        file.close();
        return;
    }
    file.flush();
    file.close();

    bpf_mem_size = size_result;
    bpf_mem = std::make_unique<uint8_t[]>(bpf_mem_size);
    std:memcpy(bpf_mem.get(),buffer,bpf_mem_size);

    // Load the binary into the VM
    uint64_t res = 0;
    res = vm.load_code(buffer,size_result);
    if (res) {
		this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        
        return;
	}
    //Close the file, return successful command response
    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

void LLVMSequencer ::COMPILE_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    //Need to include register external functions? Not entirely sure how to do that...
    auto func = vm.compile();
	if (!func) {
        // Compilation failed, return error
		this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
	}
    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

void LLVMSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, const Fw::CmdStringArg& fileName) {

    int err = vm.exec(bpf_mem.get(), bpf_mem_size, res);
	if (err != 0) {
		 // Execution failed, return error
         this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
         return;
	}
    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

}  // namespace Components
