#include "maps.hpp"

namespace Components {

void *maps::bpf_map_lookup_elem(void *map_ptr, const void *key) {

    auto map = get_map_from_ptr(static_cast<bpf_map_def *>(map_ptr));
    
    if (map) {
        return map->lookup_elem(key);
    }
    return nullptr;
}

long maps::bpf_map_update_elem(void *map_ptr, const void *key, const void *value, uint64_t flags) {

    auto map = get_map_from_ptr(static_cast<bpf_map_def *>(map_ptr));
    
    if (map) {
        return map->update_elem(key, value, flags);
    }
    return -1;
}

long maps::bpf_map_delete_elem(void *map_ptr, const void *key) {

    auto map = get_map_from_ptr(static_cast<bpf_map_def *>(map_ptr));
    
    if (map) {
        return map->delete_elem(key);
    }
    return -1;
}

}
