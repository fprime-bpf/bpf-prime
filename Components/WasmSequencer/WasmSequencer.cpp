// ======================================================================
// \title  WasmSequencer.cpp
// \author ezrak
// \brief  cpp file for WasmSequencer component implementation class
// ======================================================================

#include "Components/WasmSequencer/WasmSequencer.hpp"

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

WasmSequencer ::WasmSequencer(const char* const compName) : WasmSequencerComponentBase(compName) {}

WasmSequencer ::~WasmSequencer() {}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------


namespace {
Fw::CmdResponse result_to_response(Fw::Success result) {
    return (result == Fw::Success::SUCCESS) ? Fw::CmdResponse::OK : Fw::CmdResponse::EXECUTION_ERROR;
}
}

void WasmSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,
                                              U32 cmdSeq,
                                              const Fw::CmdStringArg& sequenceFilePath) {

    Fw::Success result = this->load(sequenceFilePath.toChar());
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

void WasmSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    
    Fw::Success result = this->run();
    return this->cmdResponse_out(opCode, cmdSeq, result_to_response(result));
}

}  // namespace Components
