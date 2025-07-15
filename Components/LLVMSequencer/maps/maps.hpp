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

        const U8 Map_Instances_Defualt_Size = 4;

        U32 map_instances_size = Map_Instances_Defualt_Size / 2;
        U32 maps_count = 0;
        map **map_instances = nullptr;
        
        I32 resize_map_instances() noexcept;

    public:
        ~maps();

        // Parse BPF map definition and allocate map
        I32 create_map(const bpf_map_def& map_def, U32& fd) noexcept;
        // Set the LDDW helpers and register the BPF helpers in the vm
        I32 register_functions(bpftime::llvmbpf_vm& vm) noexcept;
        // Free all maps
        void close_all_maps() noexcept;
        
        STATIC U64 map_by_fd(U32 fd) noexcept;
        STATIC U64 map_by_idx(U32 idx) noexcept;
        STATIC U64 map_val(U64 map_ptr) noexcept;

        STATIC void *bpf_map_lookup_elem(void *map_ptr, const void *key) noexcept;
        STATIC long bpf_map_update_elem(void *map_ptr, const void *key, const void *value, U64 flags) noexcept;
        STATIC long bpf_map_delete_elem(void *map_ptr, const void *key) noexcept;
};

}
