#include <memory>
#include <unordered_map>
#include <cstring>
#include "maps.hpp"
#include "Components/LLVMSequencer/bpf.hpp"
#include "pooled_hash_map.hpp"

#pragma once

namespace Components {

class hash_map : public map {
    private:
        pooled_hash_map mem;
    public:
        hash_map(bpf_map_def map_def);
        void *lookup_elem(const void *key) override;
        long update_elem(const void *key, const void *value, uint64_t flags) override;
        long delete_elem(const void *key) override;
        
        void *get_addr_of_first_val() override;
};

}
