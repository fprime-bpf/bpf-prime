// ======================================================================
// \title  Tests.cpp
// \author ezrak
// \brief  cpp file for Tests component implementation class
// ======================================================================

#include "Components/Tests/Tests.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "NCCScore.hpp"

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

Tests ::Tests(const char* const compName) : TestsComponentBase(compName) {}

Tests ::~Tests() {}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

Fw::CmdResponse Tests::test_status_to_response(const char* test_name, I32 result) {
    if (result != 0) {
        this->log_WARNING_HI_TestFailed(Fw::LogStringArg(test_name), result);
        return Fw::CmdResponse::EXECUTION_ERROR;
    }
    return Fw::CmdResponse::OK;
}

void Tests ::NCCScore_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    I32 exit_status = NCCScore::main();
    auto response = test_status_to_response("NCCScore", exit_status);
    this->cmdResponse_out(opCode, cmdSeq, response);
    this->log_ACTIVITY_LO_NCCScoreTestPassed();
}

void Tests ::POPULATE_MAP_RANDOM_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 fd, U32 start, U32 length) {
    auto result = populate_map_random(fd, start, length);
    return this->cmdResponse_out(opCode, cmdSeq, BpfSequencer::result_to_response(result));
}

void Tests ::BENCHMARK_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    auto result = benchmark();
    return this->cmdResponse_out(opCode, cmdSeq, BpfSequencer::result_to_response(result));
}

}  // namespace Components
