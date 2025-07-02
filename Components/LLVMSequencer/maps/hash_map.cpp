#include <cstdint>
#include <cassert>
#include <memory>
#include "hash_map.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

namespace Components {

hash_map::hash_map(bpf_map_def map_def) :
    max_entries(map_def.max_entries), key_size(map_def.key_size), value_size(map_def.value_size) {

    this->mem.reserve(max_entries);
    this->keys = std::make_unique<uint8_t[]>(key_size * max_entries);
    this->values = std::make_unique<uint8_t[]>(value_size * max_entries);
}

void *hash_map::lookup_elem(const void *key) {
    auto map_key = hash_map_key(key, key_size);
    
    if (!mem.count(map_key)) {
        return nullptr;
    }

    return mem[map_key];
}

long hash_map::update_elem(const void *key, const void *value, uint64_t flags) {

    auto map_key = hash_map_key(key, key_size);
    bool exists = mem.count(map_key);

    switch (flags) {
        case BPF_ANY:
            break;
        case BPF_NOEXIST: 
            if (exists) return 0;
            break;
        case BPF_EXIST: 
            if (!exists) return 0;
            break;
        default:
            return -1;
    }

    uint8_t *value_buffer;

    if (!exists) {
        size_t map_size = mem.size();

        if (map_size >= max_entries) {
            return -1;
        }
        
        auto key_buffer = &keys[key_size * map_size];
        std::memcpy(key_buffer, key, key_size);
        map_key = hash_map_key(key_buffer, key_size);

        value_buffer = &values[value_size * map_size];
        mem[map_key] = value_buffer;
    }
    else {
        value_buffer = mem[map_key];
    }
    std::memcpy(value_buffer, value, value_size);

    return 0;
}

long hash_map::delete_elem(const void *key) {
    auto map_key = hash_map_key(key, key_size);
    mem.erase(map_key);
    return 0;
}

void *hash_map::get_addr_of_first_val() {
    auto elem = this->mem.empty() ? nullptr : &this->mem.begin()->second;
    return static_cast<void *>(elem);
}

}
