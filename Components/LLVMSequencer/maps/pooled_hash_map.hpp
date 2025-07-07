#include <Fw/Types/BasicTypes.hpp>
#include <cstddef>

#pragma once

namespace Components {

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

        U32 key_size, value_size, max_entries;
        size_t next_power_of_two(U32 n) noexcept;
        size_t hash(const U8 *key) noexcept;
        bool key_equal(const U8 *key_a, const U8 *key_b) noexcept;
        void cleanup() noexcept;

    public:
        pooled_hash_map(U32 max_entries, U32 key_size, U32 value_size, I32& res) noexcept;
        ~pooled_hash_map();

        U8 *first_element_value() noexcept;

        U8 *lookup(const U8 *key) noexcept;
        I32 insert(const U8 *key, const U8 *value) noexcept;
        I32 remove(const U8 *key) noexcept;
        bool exists(const U8 *key) noexcept;

};

}
