#include "maps.hpp"

namespace Components {

void *maps::bpf_map_lookup_elem(void *map_ptr, const void *key) noexcept {

    auto map = static_cast<Components::map *>(map_ptr);
    
    if (map) {
        return map->lookup_elem(key);
    }
    return nullptr;
}

long maps::bpf_map_update_elem(void *map_ptr, const void *key, const void *value, U64 flags) noexcept {

    auto map = static_cast<Components::map *>(map_ptr);
    
    if (map) {
        return map->update_elem(key, value, flags);
    }
    return -EBADF;
}

long maps::bpf_map_delete_elem(void *map_ptr, const void *key) noexcept {

    auto map = static_cast<Components::map *>(map_ptr);
    
    if (map) {
        return map->delete_elem(key);
    }
    return -EBADF;
}

}
