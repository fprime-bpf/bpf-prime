#include "maps.hpp"
#include <llvmbpf.hpp>
#include <new>
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/bpf.hpp"
#include "array_map.hpp"
#include "hash_map.hpp"

namespace Components {

map::map(U32 key_size, U32 value_size, U32 max_entries)
    : key_size(key_size), value_size(value_size), max_entries(max_entries) {}

maps::maps() {
    map_instances.reserve(Max_Map_Instances);
}

I32 maps::create_map(const bpf_map_def& map_def, U32 fd) noexcept {
    I32 res = 0;

    if (map_instances.size() >= Max_Map_Instances)
        return -ENOSPC;
    if (map_instances.find(fd) != map_instances.end())
        return -EEXIST;

    map* map;

    switch (map_def.type) {
        case Components::BpfSequencer_BPF_MAP_TYPE::BPF_MAP_TYPE_ARRAY:
            map = new (std::nothrow) array_map(map_def, res);
            break;
        case Components::BpfSequencer_BPF_MAP_TYPE::BPF_MAP_TYPE_HASH:
            map = new (std::nothrow) hash_map(map_def, res);
            break;
        default:
            return -EINVAL;
    }

    if (!map)
        return -ENOMEM;
    if (res)
        return res;

    map_instances[fd] = map;
    return 0;
}

I32 maps::register_functions(bpftime::llvmbpf_vm& vm) noexcept {
    I32 res;

    // Register lddw helpers
    vm.set_lddw_helpers(map_by_fd, map_by_idx, map_val, nullptr, nullptr);

    // Register BPF functions
    bpf_external_function external_functions[] = {
        {1, "bpf_map_lookup_elem", reinterpret_cast<void*>(bpf_map_lookup_elem)},
        {2, "bpf_map_update_elem", reinterpret_cast<void*>(bpf_map_update_elem)},
        {3, "bpf_map_delete_elem", reinterpret_cast<void*>(bpf_map_delete_elem)}};

    size_t count = sizeof(external_functions) / sizeof(bpf_external_function);

    for (size_t i = 0; i < count; i++) {
        const auto& bpf_func = external_functions[i];
        res = vm.register_external_function(bpf_func.index, bpf_func.name, bpf_func.fn);
        if (res)
            return res;
    }

    return 0;
}

void maps::close_all_maps() noexcept {
    for (auto& [fd, map] : map_instances) {
        delete map;
    }
    map_instances.clear();
}

maps::~maps() {
    close_all_maps();
}

}  // namespace Components
