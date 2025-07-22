//! @file pooled_hash_map.hpp

#include <Fw/Types/BasicTypes.hpp>
#include <cstddef>

#pragma once

namespace Components {

/**
 * @brief Hash map from a preallocated memory pool
 * 
 * Used as internal structure in hash_map to represent a preallocated hash map
 * 
 */
class pooled_hash_map {
    PRIVATE:
        struct node {
            U8 *key;
            U8 *value;
            node *next;
        };
        
        U8 *keys, *values;
        
        size_t bucket_count;
        node **buckets;
        node *node_pool;
        node *free_list = nullptr;

        size_t next_power_of_two(U32 n) noexcept;
        size_t hash(const U8 *key, U32 key_size, size_t seed) noexcept;
        size_t hash(const U8 *key, U32 key_size) noexcept;
        bool key_equal(const U8 *key_a, const U8 *key_b, U32 key_size) noexcept;
        void cleanup() noexcept;

    public:
        /**
         * @brief Construct a new pooled_hash_map object
         * 
         * @param key_size Size of keys (in bytes)
         * @param value_size Size of values (in bytes)
         * @param max_entries Maximum amount of entries 
         * @param[out] res Result status. Negative errno on failure (0 on success) 
         */
        pooled_hash_map(U32 key_size, U32 value_size, U32 max_entries, I32& res) noexcept;
        ~pooled_hash_map();

        /**
         * @brief Get a pointer to the first value
         * 
         * @return Pointer to first value
         */
        U8 *first_element_value() noexcept;

        /**
         * @brief Lookup an element
         * 
         * @param key Key data
         * @param key_size Size of key (in bytes)
         * @return Data of value. nullptr if key does not exist
         */
        U8 *lookup(const U8 *key, U32 key_size) noexcept;
        /**
         * @brief Insert an element
         * 
         * @param key Key data
         * @param key_size Size of key (in bytes)
         * @param value Value data 
         * @param value_size Size of value (in bytes)
         * @return Negative errno on failure (0 on success)
         */
        I32 insert(const U8 *key, U32 key_size, const U8 *value, U32 value_size) noexcept;
        /**
         * @brief Remove an element
         * 
         * @param key Key data
         * @param key_size Size of key (in bytes)
         * @return Negative errno on failure (0 on success)
         */
        I32 remove(const U8 *key, U32 key_size) noexcept;
        /**
         * @brief Check if key exists
         * 
         * @param key Key data
         * @param key_size Size of key (in bytes)
         * @return true if element exists
         * @return false if element does not exist
         */
        bool exists(const U8 *key, U32 key_size) noexcept;

};

}
