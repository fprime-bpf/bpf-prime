#include "pooled_hash_map.hpp"
#include <cmath>
#include <bit>
#include <memory>
#include <cstring>
#include <string_view>
#include <cerrno>

namespace Components {

pooled_hash_map::pooled_hash_map(uint32_t max_entries, uint32_t key_size, uint32_t value_size) : 
    max_entries(max_entries), key_size(key_size), value_size(value_size) {

    float load_factor = 1.0f;
    this->bucket_count = next_power_of_two((uint32_t)std::ceil(max_entries / load_factor));

    this->buckets = std::make_unique<node*[]>(bucket_count);
    this->node_pool = std::make_unique<node[]>(max_entries);

    for (int i = 0; i < max_entries; i++) {
        node *node = &node_pool[i];
        node->key = std::make_unique<uint8_t[]>(key_size);
        node->value = std::make_unique<uint8_t[]>(value_size);
        
        node->next = free_list;
        free_list = node;
    }
}

size_t pooled_hash_map::next_power_of_two(uint32_t n) {
    return (n == 0) ? 1 : 1UL << (32 - __builtin_clz(n - 1));
}

uint8_t *pooled_hash_map::first_element_value() {
    auto node = buckets[0];
    return node ? node->value.get() : nullptr;
}

bool pooled_hash_map::key_equal(const uint8_t *key_a, const uint8_t *key_b) {
    if (key_a == nullptr || key_b == nullptr) {
        return key_a == key_b;
    }
    return std::memcmp(key_a, key_b, key_size) == 0;
}

size_t pooled_hash_map::hash(const uint8_t *key) {
    return std::hash<std::string_view>{}({reinterpret_cast<const char*>(key), key_size}) & (bucket_count - 1);
}

uint8_t *pooled_hash_map::lookup(const uint8_t *key) {
    node *node = buckets[hash(key)];
    while (node) {
        if (key_equal(node->key.get(), key)) {
            return node->value.get();
        }
        node = node->next;
    }
    return nullptr;
}

int pooled_hash_map::insert(const uint8_t *key, const uint8_t *value) {
    node **bucket = &buckets[hash(key)];

    node *cur_node = *bucket;
    while (cur_node) {
        if (key_equal(cur_node->key.get(), key)) {
            memcpy(cur_node->value.get(), value, value_size);
            return 0;
        }
        cur_node = cur_node->next;
    }

    if (!free_list) return -E2BIG;

    node *new_node = free_list;
    free_list = free_list->next;
    new_node->next = *bucket;
    (*bucket) = new_node;
    
    memcpy(new_node->key.get(), key, key_size);
    memcpy(new_node->value.get(), value, value_size);

    return 0;
}

int pooled_hash_map::remove(const uint8_t *key) {
    node **ptr = &buckets[hash(key)];

    while (*ptr) {
        if (key_equal((*ptr)->key.get(), key)) {
            node *to_remove = *ptr;
            *ptr = to_remove->next;
            to_remove->next = free_list;
            free_list = to_remove;
            return 0;
        }
        ptr = &(*ptr)->next;
    }
    return -ENOENT;
}

bool pooled_hash_map::exists(const uint8_t *key) {
    return lookup(key) != nullptr;
}

}
