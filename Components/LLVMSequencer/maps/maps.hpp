#include <vector>
#include <memory>
#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

#pragma once

namespace Components {

class map {
    public:
        virtual ~map() {}
};

class maps {
    private:
        std::vector<std::unique_ptr<bpf_map_def>> map_defs;
        std::vector<std::unique_ptr<map>> map_instances;

    public:
        // Load BPF map definitions
        void load_maps(const void *maps, size_t maps_len);
        // Parse BPF map definitions and allocate maps
        void create_maps();
};

}
