#include "pooled_hash_map.hpp"
#include <cmath>
#include <bit>
#include <cstring>
#include <string_view>
#include <cerrno>
#include <new>

namespace Components {

pooled_hash_map::pooled_hash_map(U32 max_entries, U32 key_size, U32 value_size, I32& res) noexcept :
    max_entries(max_entries), key_size(key_size), value_size(value_size) {

    float load_factor = 1.0f;
    this->bucket_count = next_power_of_two((U32)std::ceil(max_entries / load_factor));

    this->buckets = new(std::nothrow) node*[bucket_count]();
    this->node_pool = new(std::nothrow) node[max_entries];
    this->keys = new(std::nothrow) U8[key_size * max_entries];
    this->values = new(std::nothrow) U8[value_size * max_entries];

    if (!buckets || !node_pool || !keys || !values) {
        res = -ENOMEM;
        cleanup();
        return;
    }

    for (int i = 0; i < max_entries; i++) {
        node *node = &node_pool[i];

        node->key = &keys[i * key_size];
        node->value = &values[i * value_size];

        node->next = free_list;
        free_list = node;
    }
}

void pooled_hash_map::cleanup() noexcept {
    delete[] keys;
    delete[] values;
    delete[] node_pool;
    delete[] buckets;
}

pooled_hash_map::~pooled_hash_map() {    
    cleanup();
}

size_t pooled_hash_map::next_power_of_two(U32 n) noexcept {
    return (n == 0) ? 1 : 1UL << (32 - __builtin_clz(n - 1));
}

U8 *pooled_hash_map::first_element_value() noexcept {
    const auto node = buckets[0];
    return node ? node->value : nullptr;
}

bool pooled_hash_map::key_equal(const U8 *key_a, const U8 *key_b) noexcept {
    if (key_a == nullptr || key_b == nullptr) {
        return key_a == key_b;
    }
    return std::memcmp(key_a, key_b, key_size) == 0;
}

size_t pooled_hash_map::hash(const U8 *key) noexcept {
    return std::hash<std::string_view>{}({reinterpret_cast<const char*>(key), key_size}) & (bucket_count - 1);
}

U8 *pooled_hash_map::lookup(const U8 *key) noexcept {
    node *node = buckets[hash(key)];
    while (node) {
        if (key_equal(node->key, key)) {
            return node->value;
        }
        node = node->next;
    }
    return nullptr;
}

I32 pooled_hash_map::insert(const U8 *key, const U8 *value) noexcept {
    node **bucket = &buckets[hash(key)];

    node *current = *bucket;
    while (current) {
        if (key_equal(current->key, key)) {
            std::memcpy(current->value, value, value_size);
            return 0;
        }
        current = current->next;
    }

    if (!free_list) return -E2BIG;

    node *new_node = free_list;
    free_list = free_list->next;
    new_node->next = *bucket;
    (*bucket) = new_node;
    
    std::memcpy(new_node->key, key, key_size);
    std::memcpy(new_node->value, value, value_size);

    return 0;
}

I32 pooled_hash_map::remove(const U8 *key) noexcept {
    node **ptr = &buckets[hash(key)];

    while (*ptr) {
        if (key_equal((*ptr)->key, key)) {
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

bool pooled_hash_map::exists(const U8 *key) noexcept {
    return lookup(key) != nullptr;
}

}
