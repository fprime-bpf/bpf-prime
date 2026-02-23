#include <wasmtime.hh>
#include <vector>
#include <new>
#include "Components/WasmSequencer/WasmSequencer.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Os/File.hpp"

namespace Components {

uint32_t WasmSequencer::bpf_map_lookup_elem(uint64_t map_ptr, uint32_t key) {
    return *(U32*)maps::bpf_map_lookup_elem(reinterpret_cast<void*>(map_ptr), &key);
}

uint32_t WasmSequencer::bpf_map_update_elem(uint64_t map_ptr, uint32_t key, uint32_t value, uint64_t flags) {
    return maps::bpf_map_update_elem(reinterpret_cast<void*>(map_ptr), &key, &value, flags);
}

uint32_t WasmSequencer::bpf_map_delete_elem(uint64_t map_ptr, uint32_t key) {
    return maps::bpf_map_delete_elem(reinterpret_cast<void*>(map_ptr), &key);
}

uint64_t WasmSequencer::MAP_BY_FD(uint32_t fd) {
    return maps::map_by_fd(fd);
}

U32 WasmSequencer::bpf_iter_num_new(wasmtime::Caller caller, int32_t it_ptr, int32_t start, int32_t end) {
    auto *it = get_iter(caller, it_ptr);
    return BpfSequencer::bpf_iter_num_new(it, start, end);
}

I32 WasmSequencer::bpf_iter_num_next(wasmtime::Caller caller, int32_t it_ptr) {
    uint8_t *data_ptr;
    auto* it = get_iter(caller, it_ptr, data_ptr);

    if (auto *res = BpfSequencer::bpf_iter_num_next(it))
    {
        auto res_ptr = reinterpret_cast<uint8_t*>(res);
        return static_cast<uint32_t>(res_ptr - data_ptr);
    }
    return 0;
}

void WasmSequencer::bpf_iter_num_destroy(wasmtime::Caller caller, int32_t it_ptr) {
    auto *it = get_iter(caller, it_ptr);
    BpfSequencer::bpf_iter_num_destroy(it);
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
    
    wasmtime::Span<uint8_t> wasm_span(
        reinterpret_cast<uint8_t*>(buffer),
        static_cast<size_t>(buffer_size)
    );

    auto module_res = wasmtime::Module::compile(engine, wasm_span);
    if (!module_res) {
        Fw::LogStringArg errMsg(module_res.err().message().c_str());
        this->log_ACTIVITY_HI_WasmLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }
    auto module = module_res.ok();

    auto instance_res = linker.instantiate(store, module);
    if (!instance_res) {
        Fw::LogStringArg errMsg(instance_res.err().message().c_str());
        this->log_ACTIVITY_HI_WasmLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }
    auto instance = instance_res.ok();
    
    const char *exported_func_name = "run";
    func = std::get<wasmtime::Func>(*instance.get(store, exported_func_name));
    
    delete[] buffer;
    return Fw::Success::SUCCESS;
}

Fw::Success WasmSequencer::run() {
    if (!func.has_value()) {
        Fw::LogStringArg errMsg("Could not find WASM function! Try loading VM first");
        this->log_ACTIVITY_HI_WasmRunFailed(errMsg);
        return Fw::Success::FAILURE;
    }
    
    auto run_res = func.value().call(store, {});

    if (!run_res) {
        Fw::LogStringArg errMsg(run_res.err().message().c_str());
        this->log_ACTIVITY_HI_WasmRunFailed(errMsg);
        return Fw::Success::FAILURE;
    }

    return Fw::Success::SUCCESS;
}

BpfSequencer::bpf_iter_num *WasmSequencer::get_iter(wasmtime::Caller& caller, int32_t it_ptr, uint8_t*& data_ptr) {
    auto export_opt = caller.get_export("memory");
    if (!export_opt)
        return nullptr;

    auto* mem = std::get_if<wasmtime::Memory>(&*export_opt);
    if (!mem)
        return nullptr;

    auto span = mem->data(caller);
    data_ptr = span.data();

    auto *it = reinterpret_cast<BpfSequencer::bpf_iter_num*>(data_ptr + it_ptr);
    return it;
}

BpfSequencer::bpf_iter_num *WasmSequencer::get_iter(wasmtime::Caller& caller, int32_t it_ptr) {
    uint8_t *data_ptr;
    return get_iter(caller, it_ptr, data_ptr);
}

} // namespace Components
