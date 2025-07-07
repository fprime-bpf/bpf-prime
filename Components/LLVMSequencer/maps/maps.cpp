#include "maps.hpp"
#include "array_map.hpp"
#include "hash_map.hpp"
#include <llvmbpf.hpp>
#include "Components/LLVMSequencer/bpf.hpp"
#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include <new>

namespace Components {

I32 maps::load_maps(const void *maps, size_t maps_len) noexcept {
    auto map_def_size = sizeof(bpf_map_def);

    maps_count = maps_len / map_def_size;
    map_defs = new bpf_map_def[maps_count];

    if (!map_defs) return -ENOMEM;

    auto buffer = reinterpret_cast<const bpf_map_def*>(maps);

    for (size_t i = 0; i < maps_count; i++) {
        std::memcpy(&map_defs[i], &buffer[i], map_def_size);
    }
    
    return 0;
}

I32 maps::create_maps() noexcept {
    if (!map_defs) return -EINVAL;

    map_instances = new(std::nothrow) map*[maps_count]; 
    if (!map_instances) return -ENOMEM;

	for (size_t i = 0; i < maps_count; i++) {
        const auto& map_def = map_defs[i];

        I32 res = 0;
        map *map;

        switch (map_def.type) {
            case bpf_map_type::BPF_MAP_TYPE_ARRAY:
                map = new(std::nothrow) array_map(map_def, res);
            break;
            case bpf_map_type::BPF_MAP_TYPE_HASH:
                map = new(std::nothrow) hash_map(map_def, res);
            break;
            default:
                free_map_instances(i);
                return -EINVAL;
        }

        if (!map || res) {
            free_map_instances(i);
            delete map;
            return res;
        }

        map_instances[i] = map;
	}

    delete[] map_defs;
    map_defs = nullptr;
    return 0;
}

map *maps::get_map_from_ptr(bpf_map_def *map) noexcept {
    auto map_value = reinterpret_cast<uint64_t>(map);
    auto idx = map_value / sizeof(bpf_map_def);
    
    if (map_value % sizeof(bpf_map_def) != 0 || idx >= LLVMSequencer::maps.size()) {
        return nullptr;
    }

    return LLVMSequencer::maps.map_instances[idx];
}

I32 maps::register_functions(bpftime::llvmbpf_vm *vm) noexcept {
    I32 res;

    // Register lddw helpers
    vm->set_lddw_helpers(map_by_fd, map_by_idx, map_val, nullptr, nullptr);

    // Register BPF functions
    bpf_external_function external_functions[] = {
        { 1, "bpf_map_lookup_elem", reinterpret_cast<void*>(bpf_map_lookup_elem) },
        { 2, "bpf_map_update_elem", reinterpret_cast<void*>(bpf_map_update_elem) },
        { 3, "bpf_map_delete_elem", reinterpret_cast<void*>(bpf_map_delete_elem) }
    };
    
    size_t count = sizeof(external_functions) / sizeof(bpf_external_function);

    for (size_t i = 0; i < count; i++) {
        const auto& bpf_func = external_functions[i];
        res = vm->register_external_function(bpf_func.index, bpf_func.name, bpf_func.fn);
        if (res) return res;
    }

    return 0;
}

void maps::free_map_instances(size_t count) noexcept {
    for (size_t i = 0; i < count; i++) {
        delete map_instances[i];
    }
    delete[] map_instances;
}

void maps::free_maps() noexcept {
    delete[] map_defs;
    free_map_instances(maps_count);
}

size_t maps::size() noexcept {
    return maps_count;
}

}
