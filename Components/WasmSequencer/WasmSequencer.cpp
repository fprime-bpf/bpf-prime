// ======================================================================
// \title  WasmSequencer.cpp
// \author ezrak
// \brief  cpp file for WasmSequencer component implementation class
// ======================================================================

#include "wasm_export.h"
#include "Components/WasmSequencer/WasmSequencer.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

WasmSequencer ::WasmSequencer(const char* const compName)
    : WasmSequencerComponentBase(compName), buffer(nullptr), module(nullptr), module_inst(nullptr), exec_env(nullptr) {

    static NativeSymbol bpf_helpers[] = {
        {"bpf_map_lookup_elem", (void*)WasmSequencer::bpf_map_lookup_elem, "(Ii)i", nullptr},
        {"bpf_map_update_elem", (void*)WasmSequencer::bpf_map_update_elem, "(IiiI)i", nullptr},
        {"bpf_map_delete_elem", (void*)WasmSequencer::bpf_map_delete_elem, "(Ii)i", nullptr},
        {"bpf_rand_int", (void*)WasmSequencer::bpf_rand_int, "(ii)i", nullptr},
        {"MAP_BY_FD", (void*)WasmSequencer::MAP_BY_FD, "(i)I", nullptr},
        {"bpf_math_sqrt", (void*)WasmSequencer::bpf_math_sqrt, "(f)f", nullptr},
        {"bpf_math_sin", (void*)WasmSequencer::bpf_math_sin, "(f)f", nullptr},
        {"bpf_math_cos", (void*)WasmSequencer::bpf_math_cos, "(f)f", nullptr},
        {"bpf_math_atan2", (void*)WasmSequencer::bpf_math_atan2, "(ff)f", nullptr},
    };

    if (!wasm_runtime_init()) {
        Fw::LogStringArg errMsg("Failed to initialize WAMR runtime");
        this->log_WARNING_HI_WasmRegisterFunctionsFailed(errMsg);
        return;
    }

    const char *moduleName = "env";
    uint32_t num_helpers = sizeof(bpf_helpers) / sizeof(NativeSymbol);

    if (!wasm_runtime_register_natives(moduleName, bpf_helpers, num_helpers)) {
        Fw::LogStringArg errMsg("Failed to register bpf helpers");
        this->log_WARNING_HI_WasmRegisterFunctionsFailed(errMsg);
    }
}

WasmSequencer ::~WasmSequencer() {
    cleanup_wasm();
}

// ----------------------------------------------------------------------
// Handler implementations for typed input ports
// ----------------------------------------------------------------------

F64 WasmSequencer ::getBenchmark_handler(FwIndexType portNum, const Components::BENCHMARK_TEST& test, bool compile) {
    return get_benchmark_wasm(test, compile);
}

// ----------------------------------------------------------------------
// Handler implementations for commands
// ----------------------------------------------------------------------

void WasmSequencer ::LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,
                                              U32 cmdSeq,
                                              const Fw::CmdStringArg& sequenceFilePath) {

    Fw::Success result = this->load(sequenceFilePath.toChar());
    return this->cmdResponse_out(opCode, cmdSeq, BpfSequencer::result_to_response(result));
}

void WasmSequencer ::RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode, U32 cmdSeq) {
    
    Fw::Success result = this->run();
    return this->cmdResponse_out(opCode, cmdSeq, BpfSequencer::result_to_response(result));
}

}  // namespace Components
