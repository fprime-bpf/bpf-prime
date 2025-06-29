#include <cstring>
#include <string_view>
#include "hash_map.hpp"

namespace Components {

hash_map_key::hash_map_key(const void *value_ptr, unsigned int size, bool copy) {
    
    if (copy) {
        auto value = new uint8_t[size];
        std::memcpy(value, value_ptr, size);
        this->value = value;
    }
    else {
        this->value = static_cast<const uint8_t *>(value_ptr);
    }
    
    this->size = size;
}

std::size_t key_hash::operator()(const hash_map_key& key) const {
    return std::hash<std::string_view>{}({reinterpret_cast<const char*>(key.value), key.size});
}

bool key_equality::operator()(const hash_map_key& a, const hash_map_key& b) const {
    if (a.value == nullptr || b.value == nullptr) {
        return a.value == b.value;
    }
    return std::memcmp(a.value, b.value, a.size) == 0;
}

}
