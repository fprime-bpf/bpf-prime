#include <cstdint>
#include <cassert>
#include <cstring>
#include <memory>
#include "array_map.hpp"
#include "Components/LLVMSequencer/bpf.hpp"
#include <cerrno>

namespace Components {
    
array_map::array_map(bpf_map_def map_def, int& res) {
    if (map_def.key_size != sizeof(uint32_t)) {
        res = -EINVAL;
        return;
    }
    
    this->mem = std::make_unique<uint8_t[]>(map_def.key_size * map_def.max_entries);
    this->size = map_def.max_entries;
    this->value_size = map_def.value_size;
}

void *array_map::lookup_elem(const void *key) {
    uint32_t map_key = *static_cast<const uint32_t *>(key);

    if (map_key >= size) 
        return nullptr;

    return &mem[map_key * value_size];
}

long array_map::update_elem(const void *key, const void *value, uint64_t flags) {
    auto elem = lookup_elem(key);

    if (!elem)
        return -E2BIG;

    std::memcpy(elem, value, value_size);
    return 0;
}

long array_map::delete_elem(const void *key) {
    return -EINVAL;
}

void *array_map::get_addr_of_first_val() {
    return static_cast<void *>(mem.get());
}

}
