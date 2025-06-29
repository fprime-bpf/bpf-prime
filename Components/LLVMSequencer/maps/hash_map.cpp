#include <cstdint>
#include <cassert>
#include <memory>
#include "hash_map.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

namespace Components {

hash_map::hash_map(bpf_map_def map_def) {
    this->mem.reserve(map_def.max_entries);
    this->key_size = map_def.key_size;
    this->value_size = map_def.value_size;
}

hash_map::~hash_map() {
    for (auto it = mem.begin(); it != mem.end(); it++) {
        delete[] it->first.value;
    }
    mem.clear();
}

void *hash_map::lookup_elem(const void *key) {
    auto map_key = hash_map_key(key, key_size, false);
    
    if (!mem.count(map_key)) {
        return nullptr;
    }

    return mem[map_key].get();
}

long hash_map::update_elem(const void *key, const void *value, uint64_t flags) {

    auto map_key = hash_map_key(key, key_size, true);

    switch (flags) {
        case BPF_ANY:
            break;
        case BPF_NOEXIST: 
            if (mem.count(map_key)) return 0;
            break;
        case BPF_EXIST: 
            if (!mem.count(map_key)) return 0;
            break;
        default:
            return -1;
    }
    
    auto map_value = std::make_unique<uint8_t[]>(value_size);
    std::memcpy(map_value.get(), value, value_size);

    mem[map_key] = std::move(map_value);
    return 0;
}

long hash_map::delete_elem(const void *key) {
    auto map_key = hash_map_key(key, key_size, false);

    auto itr = mem.find(map_key);

    if (itr == mem.end()) {
        return -1;
    }

    delete[] itr->first.value;
    mem.erase(itr);

    return 0;
}

void *hash_map::get_addr_of_first_val() {
    auto elem = this->mem.empty() ? nullptr : &this->mem.begin()->second;
    return static_cast<void *>(elem);
}

}
