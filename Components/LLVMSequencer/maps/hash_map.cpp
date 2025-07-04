#include <cstdint>
#include <cassert>
#include <memory>
#include "hash_map.hpp"
#include "Components/LLVMSequencer/bpf.hpp"
#include <cerrno>

namespace Components {

hash_map::hash_map(bpf_map_def map_def, int& res) :
    mem(pooled_hash_map(map_def.max_entries, map_def.key_size, map_def.value_size)) { }

void *hash_map::lookup_elem(const void *key) {
    return mem.lookup(static_cast<const uint8_t *>(key));
}

long hash_map::update_elem(const void *key, const void *value, uint64_t flags) {
    
    auto map_key = static_cast<const uint8_t *>(key);
    auto map_value = static_cast<const uint8_t *>(value);

    switch (flags) {
        case BPF_ANY:
            break;
        case BPF_NOEXIST: 
            if (mem.exists(map_key)) return -EEXIST;
            break;
        case BPF_EXIST: 
            if (!mem.exists(map_key)) return -ENOENT;
            break;
        default:
            return -EINVAL;
    }

    return mem.insert(map_key, map_value);
}

long hash_map::delete_elem(const void *key) {
    return mem.remove(static_cast<const uint8_t *>(key));
}

void *hash_map::get_addr_of_first_val() {
    return static_cast<void *>(mem.first_element_value());
}

}
