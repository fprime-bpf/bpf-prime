#include <memory>
#include "maps.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

#pragma once

namespace Components {

class array_map : public map {
    private:
        std::unique_ptr<uint8_t[]> mem;
        uint32_t size;
        uint32_t value_size;
    public:
        array_map(bpf_map_def map_def, int& res);
        void *lookup_elem(const void *key) override;
        long update_elem(const void *key, const void *value, uint64_t flags) override;
        long delete_elem(const void *key) override;

        void *get_addr_of_first_val() override;
};

}
