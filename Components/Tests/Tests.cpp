// ======================================================================
// \title  Tests.cpp
// \author ezrak
// \brief  cpp file for Tests component implementation class
// ======================================================================

#include "Components/Tests/Tests.hpp"

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

Tests ::Tests(const char* const compName) : TestsComponentBase(compName) {}

Tests ::~Tests() {}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

void Tests ::COMMAND_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    // TODO
    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

}  // namespace Components
