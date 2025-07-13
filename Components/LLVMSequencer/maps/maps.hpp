#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"
#include "Components/LLVMSequencer/bpf.hpp"
#include <Fw/Types/BasicTypes.hpp>
#include <cstddef>

#pragma once

namespace Components {

class map {
    public:
        const U32 key_size, value_size, max_entries;

        map(U32 key_size, U32 value_size, U32 max_entries);
        virtual ~map() {}
        virtual void *lookup_elem(const void *key) noexcept = 0;
        virtual long update_elem(const void *key, const void *value, U64 flags) noexcept = 0;
        virtual long delete_elem(const void *key) noexcept = 0;
        virtual void *get_addr_of_first_val() noexcept = 0;
};

class maps {
    PRIVATE:
        struct bpf_external_function {
            size_t index;
            const char *name;
            void *fn;
        };

        size_t maps_count;
        bpf_map_def *map_defs = nullptr;
        map **map_instances;
        
        void free_map_instances(size_t count) noexcept;
        STATIC map *get_map_from_ptr(bpf_map_def *map) noexcept;

    public:
        // Load BPF map definitions
        I32 load_maps(const void *maps, size_t maps_len) noexcept;
        // Parse BPF map definitions and allocate maps
        I32 create_maps() noexcept;
        // Set the LDDW helpers and register the BPF helpers in the vm
        I32 register_functions(bpftime::llvmbpf_vm& vm) noexcept;
        // Free all maps
        void free_maps() noexcept;
        // Return the number of loaded map definitions
        size_t size() noexcept;
        
        STATIC U64 map_by_fd(U32 fd) noexcept;
        STATIC U64 map_by_idx(U32 idx) noexcept;
        STATIC U64 map_val(U64 map_ptr) noexcept;

        STATIC void *bpf_map_lookup_elem(void *map_ptr, const void *key) noexcept;
        STATIC long bpf_map_update_elem(void *map_ptr, const void *key, const void *value, U64 flags) noexcept;
        STATIC long bpf_map_delete_elem(void *map_ptr, const void *key) noexcept;
};

}
