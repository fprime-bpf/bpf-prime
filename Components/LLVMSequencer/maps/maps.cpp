#include <memory>
#include <stdexcept>
#include "maps.hpp"
#include <llvmbpf.hpp>
#include "Components/LLVMSequencer/bpf.hpp"
#include "Components/LLVMSequencer/LLVMSequencer.hpp"

namespace Components {

void maps::load_maps(const void *maps, size_t maps_len) {

    auto map_def_size = sizeof(bpf_map_def);

    size_t count = maps_len / map_def_size;
    auto buffer = reinterpret_cast<const bpf_map_def*>(maps);

    for (size_t i = 0; i < count; i++) {
        auto map_def = std::make_unique<bpf_map_def>();

        std::memcpy(map_def.get(), &buffer[i], map_def_size);
        this->map_defs.push_back(std::move(map_def));
    }
}

void maps::create_maps() {
	for (const auto& map_def : map_defs) {

        std::unique_ptr<map> map;
        switch (map_def->type) {
            default:
                throw std::invalid_argument("Failed to create maps: unsupported BPF map type " + std::to_string(map_def->type));
        }

        this->map_instances.push_back(std::move(map));
	}
}

map *maps::get_map_from_ptr(bpf_map_def *map) {
    auto map_value = reinterpret_cast<uint64_t>(map);
    auto idx = map_value / sizeof(bpf_map_def);
    
    if (map_value % sizeof(bpf_map_def) != 0 || idx >= LLVMSequencer::maps.map_instances.size()) {
        return nullptr;
    }

    return LLVMSequencer::maps.map_instances[idx].get();
}

void maps::register_functions(bpftime::llvmbpf_vm *vm) {
    int res;

    // Register lddw helpers
    vm->set_lddw_helpers(map_by_fd, map_by_idx, map_val, nullptr, nullptr);

    // Register BPF functions
    std::vector<std::tuple<int, const char *, void *>> external_functions = {
        { 1, "bpf_map_lookup_elem", reinterpret_cast<void*>(bpf_map_lookup_elem) },
        { 2, "bpf_map_update_elem", reinterpret_cast<void*>(bpf_map_update_elem) },
        { 3, "bpf_map_delete_elem", reinterpret_cast<void*>(bpf_map_delete_elem) }
    };
    
    for (const auto& external_function : external_functions) {

        auto index = std::get<0>(external_function);
        auto name = std::get<1>(external_function);
        auto fn = std::get<2>(external_function);

        res = vm->register_external_function(index, name, fn);

        if (res) {
            throw std::runtime_error("Failed to register functions (vm error): " + vm->get_error_message());
        }
    }

}

}
