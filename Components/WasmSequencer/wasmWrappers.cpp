#include "wasm_export.h"
#include <vector>
#include <new>
#include "Components/WasmSequencer/WasmSequencer.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Os/File.hpp"

namespace Components {

uint32_t WasmSequencer::bpf_map_lookup_elem(wasm_exec_env_t exec_env, uint64_t map_ptr, uint32_t key) {
    return *(U32*)maps::bpf_map_lookup_elem(reinterpret_cast<void*>(map_ptr), &key);
}

uint32_t WasmSequencer::bpf_map_update_elem(wasm_exec_env_t exec_env, uint64_t map_ptr, uint32_t key, uint32_t value, uint64_t flags) {
    return maps::bpf_map_update_elem(reinterpret_cast<void*>(map_ptr), &key, &value, flags);
}

uint32_t WasmSequencer::bpf_map_delete_elem(wasm_exec_env_t exec_env, uint64_t map_ptr, uint32_t key) {
    return maps::bpf_map_delete_elem(reinterpret_cast<void*>(map_ptr), &key);
}

int32_t WasmSequencer::bpf_rand_int(wasm_exec_env_t exec_env, int32_t min, int32_t max) {
    return BpfSequencer::bpf_rand_int(min, max);
}

uint64_t WasmSequencer::MAP_BY_FD(wasm_exec_env_t exec_env, uint32_t fd) {
    return maps::map_by_fd(fd);
}

Fw::Success WasmSequencer::load(const char* sequenceFilePath) {
    Fw::LogStringArg loggerFilePath(sequenceFilePath);

    const char *err_msg;
    FwSizeType buffer_size;
    auto buffer = BpfSequencer::read_from_file(sequenceFilePath, buffer_size, err_msg);
    if (!buffer) {
        this->log_ACTIVITY_HI_WasmLoadFailed(
            loggerFilePath,
            Fw::LogStringArg(err_msg)
        );
        return Fw::Success::FAILURE;
    }

    char error_buf[128];
    const uint32_t stack_size = 8092, heap_size = 8092;

    module = wasm_runtime_load(
        reinterpret_cast<uint8_t*>(buffer),
        static_cast<uint32_t>(buffer_size),
        error_buf,
        sizeof(error_buf)
    );
    if (!module) {
        Fw::LogStringArg errMsg(error_buf);
        this->log_ACTIVITY_HI_WasmLoadFailed(loggerFilePath, errMsg);
        delete[] buffer;
        return Fw::Success::FAILURE;
    }
    
    module_inst = wasm_runtime_instantiate(module, stack_size, heap_size, error_buf, sizeof(error_buf));
    if (!module_inst) {
        Fw::LogStringArg errMsg(error_buf);
        this->log_ACTIVITY_HI_WasmLoadFailed(loggerFilePath, errMsg);
        delete[] buffer;
        return Fw::Success::FAILURE;
    }

    const char *exported_func_name = "run";
    wasm_function_inst_t exported_func = wasm_runtime_lookup_function(module_inst, exported_func_name);
    if (!exported_func) {
        Fw::LogStringArg errMsg("Export not found");
        this->log_ACTIVITY_HI_WasmLoadFailed(loggerFilePath, errMsg);
        delete[] buffer;
        return Fw::Success::FAILURE;
    }

    exec_env = wasm_runtime_create_exec_env(module_inst, stack_size);
    if (!exec_env) {
        Fw::LogStringArg errMsg("Failed to create exec env");
        this->log_ACTIVITY_HI_WasmLoadFailed(loggerFilePath, errMsg);
        delete[] buffer;
        return Fw::Success::FAILURE;
    }

    func = exported_func;

    delete[] buffer;
    return Fw::Success::SUCCESS;
}

Fw::Success WasmSequencer::run() {
    if (!func.has_value()) {
        Fw::LogStringArg errMsg("Could not find WASM function! Try loading VM first");
        this->log_ACTIVITY_HI_WasmRunFailed(errMsg);
        return Fw::Success::FAILURE;
    }

    if (!this->wamr_register_thread()) {
        Fw::LogStringArg errMsg("Failed to initialize WAMR for this thread");
        this->log_ACTIVITY_HI_WasmRunFailed(errMsg);
        return Fw::Success::FAILURE;
    }

    uint32_t argv[1] = {0};
    bool run_res = wasm_runtime_call_wasm(exec_env, func.value(), 0, argv);

    if (!run_res) {
        Fw::LogStringArg errMsg(wasm_runtime_get_exception(module_inst));
        this->log_ACTIVITY_HI_WasmRunFailed(errMsg);
        return Fw::Success::FAILURE;
    }

    return Fw::Success::SUCCESS;
}

bool WasmSequencer::wamr_register_thread() {
    static thread_local bool thread_env_init = false;
    if (!thread_env_init) {
        if (!wasm_runtime_init_thread_env()) {
            return false;
        }
        thread_env_init = true;
    }
    return true;
}

} // namespace Components
