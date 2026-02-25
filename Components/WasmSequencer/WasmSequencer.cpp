// ======================================================================
// \title  WasmSequencer.cpp
// \author ezrak
// \brief  cpp file for WasmSequencer component implementation class
// ======================================================================

#include <wasmtime.hh>
#include "Components/WasmSequencer/WasmSequencer.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

namespace Components {

// ----------------------------------------------------------------------
// Component construction and destruction
// ----------------------------------------------------------------------

WasmSequencer ::WasmSequencer(const char* const compName) 
    : WasmSequencerComponentBase(compName), engine(), store(engine), linker(engine) {
    
    const std::pair<const char*, const wasmtime::Extern> bpf_helpers[] = {
        {"bpf_map_lookup_elem", wasmtime::Func::wrap(store, WasmSequencer::bpf_map_lookup_elem)},
        {"bpf_map_update_elem", wasmtime::Func::wrap(store, WasmSequencer::bpf_map_update_elem)},
        {"bpf_map_delete_elem", wasmtime::Func::wrap(store, WasmSequencer::bpf_map_delete_elem)},
        {"MAP_BY_FD", wasmtime::Func::wrap(store, WasmSequencer::MAP_BY_FD)},
    };
    
    const char *moduleName = "env";
    for (const auto& [name, func] : bpf_helpers) {
        auto res = linker.define(store, moduleName, name, func);
        if (!res) {
            Fw::LogStringArg errMsg(res.err().message().c_str());
            this->log_WARNING_HI_WasmRegisterFunctionsFailed(errMsg);
        }
    }

    linker.define_wasi();
}

WasmSequencer ::~WasmSequencer() {}

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
