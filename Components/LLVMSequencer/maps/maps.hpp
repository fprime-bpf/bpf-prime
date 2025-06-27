#include <vector>
#include <memory>
#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

#pragma once

namespace Components {

class map {
    public:
        virtual ~map() {}
        virtual void *lookup_elem(const void *key) = 0;
        virtual long update_elem(const void *key, const void *value, uint64_t flags) = 0;
        virtual long delete_elem(const void *key) = 0;
        virtual void *get_addr_of_first_val() = 0;
};

class maps {
    private:
        std::vector<std::unique_ptr<bpf_map_def>> map_defs;
        std::vector<std::unique_ptr<map>> map_instances;

        static map *get_map_from_ptr(bpf_map_def *map);

    public:
        // Load BPF map definitions
        void load_maps(const void *maps, size_t maps_len);
        // Parse BPF map definitions and allocate maps
        void create_maps();
        // Set the LDDW helpers and register the BPF helpers in the vm
        void register_functions(bpftime::llvmbpf_vm *vm);
        
        static uint64_t map_by_fd(uint32_t fd);
        static uint64_t map_by_idx(uint32_t idx);
        static uint64_t map_val(uint64_t map_ptr);

        static void *bpf_map_lookup_elem(void *map_ptr, const void *key);
        static long bpf_map_update_elem(void *map_ptr, const void *key, const void *value, uint64_t flags);
        static long bpf_map_delete_elem(void *map_ptr, const void *key);
};

}
