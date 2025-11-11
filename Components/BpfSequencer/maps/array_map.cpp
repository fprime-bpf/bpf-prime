#include "array_map.hpp"
#include <cassert>
#include <cerrno>
#include <cstdint>
#include <cstring>
#include <new>
#include "Components/BpfSequencer/bpf.hpp"

namespace Components {

array_map::array_map(const bpf_map_def& map_def, I32& res) noexcept
    : map(map_def.key_size, map_def.value_size, map_def.max_entries) {
    if (key_size != sizeof(U32)) {
        res = -EINVAL;
        return;
    }

    this->mem = new (std::nothrow) U8[value_size * max_entries]();
    if (!mem) {
        res = -ENOMEM;
        return;
    }
}

array_map::~array_map() {
    delete[] mem;
}

void* array_map::lookup_elem(const void* key) noexcept {
    U32 map_key = *static_cast<const U32*>(key);

    if (map_key >= max_entries)
        return nullptr;

    return &mem[map_key * value_size];
}

long array_map::update_elem(const void* key, const void* value, U64 flags) noexcept {
    auto elem = lookup_elem(key);

    if (!elem)
        return -E2BIG;

    std::memcpy(elem, value, value_size);
    return 0;
}

long array_map::delete_elem(const void* key) noexcept {
    return -EINVAL;
}

void* array_map::get_addr_of_first_val() noexcept {
    return static_cast<void*>(mem);
}

}  // namespace Components
