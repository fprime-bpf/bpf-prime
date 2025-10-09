// ======================================================================
// \title  Tests.cpp
// \author ezrak
// \brief  cpp file for Tests component implementation class
// ======================================================================

#include "Components/Tests/Tests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Kalman.hpp"
#include "LowPassFilter.hpp"
#include "Matmul.hpp"
#include <random>
#include <climits>
#include <algorithm>

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

void Tests ::POPULATE_MAP_RANDOM_cmdHandler(FwOpcodeType opCode, U32 cmdSeq, U32 fd, U32 start, U32 length) {

    auto map = reinterpret_cast<Components::map*>(maps::map_by_fd(fd));
    if (!map) {
        Fw::LogStringArg errMsg(("Could not find map with fd " + std::to_string(fd)).c_str());
        this->log_WARNING_LO_FailedToPopulateMap(errMsg);
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }

    const auto max_key_size = sizeof(size_t);
    if (map->key_size > max_key_size) {
        Fw::LogStringArg errMsg(("Map keys may not be greater than " + std::to_string(max_key_size) + " bytes").c_str());
        this->log_WARNING_LO_FailedToPopulateMap(errMsg);
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }
    if (map->max_entries < start + length) {
        Fw::LogStringArg errMsg("Requested range exceeds map bounds");
        this->log_WARNING_LO_FailedToPopulateMap(errMsg);
        this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
        return;
    }
    
    const size_t totalBytes = map->value_size * length;
    U8 values[totalBytes];

    std::independent_bits_engine<std::mt19937, CHAR_BIT, U8> engine(std::random_device{}());
    
    std::generate(values, values + totalBytes, std::ref(engine));

    for (size_t i = 0; i < length; ++i) {
        size_t key = start + i;
        U8 *value = &values[i * map->value_size];
        map->update_elem(&key, value, 0);
    }

    this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
}

}  // namespace Components
