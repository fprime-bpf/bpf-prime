#include <cstring>
#include "maps.hpp"
#include "Components/LLVMSequencer/bpf.hpp"
#include "pooled_hash_map.hpp"

#pragma once

namespace Components {

class hash_map : public map {
    PRIVATE:
        pooled_hash_map mem;
    public:
        hash_map(const bpf_map_def& map_def, I32& res) noexcept;
        void *lookup_elem(const void *key) noexcept override;
        long update_elem(const void *key, const void *value, U64 flags) noexcept override;
        long delete_elem(const void *key) noexcept override;
        
        void *get_addr_of_first_val() noexcept override;
};

}
