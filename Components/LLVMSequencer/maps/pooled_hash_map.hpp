#include <memory>

#pragma once

namespace Components {

class pooled_hash_map {
    private:
        struct node {
            std::unique_ptr<uint8_t[]> key;
            std::unique_ptr<uint8_t[]> value;
            node *next = nullptr;
        };

        size_t bucket_count;
        std::unique_ptr<node*[]> buckets;
        std::unique_ptr<node[]> node_pool;
        node *free_list = nullptr;

        uint32_t key_size, value_size, max_entries;

        void mark_free(node *node);
        size_t next_power_of_two(uint32_t n);
        size_t hash(const uint8_t *key);
        bool key_equal(const uint8_t *key_a, const uint8_t *key_b);

    public:
        pooled_hash_map(uint32_t max_entries, uint32_t key_size, uint32_t value_size);

        uint8_t *first_element_value();

        uint8_t *lookup(const uint8_t *key);
        int insert(const uint8_t *key, const uint8_t *value);
        int remove(const uint8_t *key);
        bool exists(const uint8_t *key);

};

}
