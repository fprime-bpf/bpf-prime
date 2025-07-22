//! @file maps.hpp

#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"
#include "Components/LLVMSequencer/bpf.hpp"
#include <Fw/Types/BasicTypes.hpp>
#include <cstddef>
#include "shared_mutex.hpp"

#pragma once

namespace Components {

/**
 * @brief Abstract base class of all BPF map types
 * 
 */
class map {
    public:
        const U32 key_size, value_size, max_entries;
        shared_mutex mutex;

        /**
         * @brief Construct a new map object
         * 
         * @param key_size Size of keys (in bytes)
         * @param value_size Size of values (in bytes)
         * @param max_entries Maximum amount of entries
         */
        map(U32 key_size, U32 value_size, U32 max_entries);
        virtual ~map() {}
        /**
         * @brief Lookup an element
         * 
         * @param key Pointer to key data
         * @return Pointer to specified element
         */
        virtual void *lookup_elem(const void *key) noexcept = 0;
        /**
         * @brief Update an element
         * 
         * @param key Pointer to key data
         * @param value Pointer to value data
         * @param flags Map-specific flags
         * @return Negative errno status on failure (0 on success)
         */
        virtual long update_elem(const void *key, const void *value, U64 flags) noexcept = 0;
        /**
         * @brief Delete an element
         * 
         * @param key Pointer to key data
         * @return Negative errno status on failure (0 on success)
         */
        virtual long delete_elem(const void *key) noexcept = 0;
        /**
         * @brief Get the address of the first element
         * 
         * @return Pointer to first element in map
         */
        virtual void *get_addr_of_first_val() noexcept = 0;
};

/**
 * @brief Handler class for BPF maps
 * 
 */
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

        /**
         * @brief Create and allocate map based on specified map definition
         * 
         * @param map_def Map definition to be created
         * @param[out] fd Assigned the file descriptor of the created map
         * @return Negative errno status on failure (0 on success)
         */
        I32 create_map(const bpf_map_def& map_def, U32& fd) noexcept;
        /**
         * @brief Set the LDDW helpers and register the BPF helpers in the vm
         * 
         * This function should not be called by the user. It will be called automatically after the llvmbpf vm's initialization
         * 
         * @param vm llvmbpf vm instance
         * @return Errno status from vm
         */
        I32 register_functions(bpftime::llvmbpf_vm& vm) noexcept;
        /**
         * @brief Close and free all maps
         * 
         */
        void close_all_maps() noexcept;
        
        /**
         * @brief Get BPF map from its file descriptor
         * 
         * @param fd File descriptor
         * @return Address of specified map
         */
        STATIC U64 map_by_fd(U32 fd) noexcept;
        /**
         * @brief Get BPF map from its index
         * 
         * @param idx Index
         * @return Address of specified map 
         */
        STATIC U64 map_by_idx(U32 idx) noexcept;
        /**
         * @brief Get the address of the first element of a BPF map
         * 
         * @param map_ptr Address of map
         * @return Address of first element of map 
         */
        STATIC U64 map_val(U64 map_ptr) noexcept;

        /**
         * @brief Lookup an element in a BPF map
         * 
         * @param map_ptr Pointer to map
         * @param key Pointer to key data
         * @return Pointer to specified element
         */
        STATIC void *bpf_map_lookup_elem(void *map_ptr, const void *key) noexcept;
        /**
         * @brief Update an element in a BPF map
         * 
         * @param map_ptr Pointer to map
         * @param key Pointer to key data
         * @param value Pointer to value data
         * @param flags Map-specific flags
         * @return Negative errno status on failure (0 on success)
         */
        STATIC long bpf_map_update_elem(void *map_ptr, const void *key, const void *value, U64 flags) noexcept;
        /**
         * @brief Delete an element in a BPF map
         * 
         * @param map_ptr Pointer to map
         * @param key Pointer to key data
         * @return Negative errno status on failure (0 on success)
         */
        STATIC long bpf_map_delete_elem(void *map_ptr, const void *key) noexcept;
};

}
