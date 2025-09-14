// ======================================================================
// \title  Tests.cpp
// \author ezrak
// \brief  cpp file for Tests component implementation class
// ======================================================================

#include "Components/Tests/Tests.hpp"
#include "Kalman.hpp"
#include "LowPassFilter.hpp"
#include "Matmul.hpp"

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

Tests ::Tests(const char* const compName) : TestsComponentBase(compName) {}

Tests ::~Tests() {}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

Fw::CmdResponse Tests::test_status_to_response(const char *test_name, I32 result) {
    if (result != 0) {
        this->log_WARNING_HI_TestFailed(Fw::LogStringArg(test_name), result);
        return Fw::CmdResponse::EXECUTION_ERROR;
    }
    return Fw::CmdResponse::OK;
}

void Tests ::KALMAN_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    I32 exit_status = Kalman::main();
    auto response = test_status_to_response("Kalman", exit_status);
    this->cmdResponse_out(opCode, cmdSeq, response);
}

void Tests ::LOW_PASS_FILTER_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    I32 exit_status = LowPassFilter::main();
    auto response = test_status_to_response("Low Pass Filter", exit_status);
    this->cmdResponse_out(opCode, cmdSeq, response);
}

void Tests ::MATMUL_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    I32 exit_status = Matmul::main();
    auto response = test_status_to_response("Matmul", exit_status);
    this->cmdResponse_out(opCode, cmdSeq, response);
}

}  // namespace Components
