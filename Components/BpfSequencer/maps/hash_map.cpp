#include <cstdint>
#include <cassert>
#include "hash_map.hpp"
#include "Components/BpfSequencer/bpf.hpp"
#include <cerrno>

namespace Components {

hash_map::hash_map(const bpf_map_def& map_def, I32& res) noexcept :
    map(map_def.key_size, map_def.value_size, map_def.max_entries),
    mem(pooled_hash_map(key_size, value_size, max_entries, res)) { }

void *hash_map::lookup_elem(const void *key) noexcept {
    return mem.lookup(static_cast<const U8 *>(key), key_size);
}

long hash_map::update_elem(const void *key, const void *value, U64 flags) noexcept {
    
    auto map_key = static_cast<const U8 *>(key);
    auto map_value = static_cast<const U8 *>(value);

    switch (flags) {
        case BPF_ANY:
            break;
        case BPF_NOEXIST: 
            if (mem.exists(map_key, key_size)) return -EEXIST;
            break;
        case BPF_EXIST: 
            if (!mem.exists(map_key, key_size)) return -ENOENT;
            break;
        default:
            return -EINVAL;
    }

    return mem.insert(map_key, key_size, map_value, value_size);
}

long hash_map::delete_elem(const void *key) noexcept {
    return mem.remove(static_cast<const U8 *>(key), key_size);
}

void *hash_map::get_addr_of_first_val() noexcept {
    return static_cast<void *>(mem.first_element_value());
}

}
