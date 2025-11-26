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
