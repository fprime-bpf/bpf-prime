#include <memory>
#include <unordered_map>
#include <cstring>
#include "maps.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

#pragma once

namespace Components {

struct hash_map_key {
    const uint8_t *value;
    unsigned int size;
    
    hash_map_key(const void *value_ptr, unsigned int size);
};

struct key_hash {
    std::size_t operator()(const hash_map_key& key) const;
};

struct key_equality {
    bool operator()(const hash_map_key& a, const hash_map_key& b) const;
};

class hash_map : public map {
    private:
        std::unordered_map<hash_map_key, uint8_t*, key_hash, key_equality> mem;
        std::unique_ptr<uint8_t[]> keys, values;
        unsigned int max_entries, key_size, value_size;
    public:
        hash_map(bpf_map_def map_def);
        void *lookup_elem(const void *key) override;
        long update_elem(const void *key, const void *value, uint64_t flags) override;
        long delete_elem(const void *key) override;
        
        void *get_addr_of_first_val() override;
};

}
