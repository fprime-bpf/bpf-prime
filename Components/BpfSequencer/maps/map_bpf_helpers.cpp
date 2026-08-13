#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "maps.hpp"
#include "shared_mutex.hpp"
#include <type_traits>

namespace Components {

constexpr bool kMapsAllowRaces = true;

struct no_lock {
    explicit no_lock(shared_mutex&) {}
};
using bpf_map_read_lock = std::conditional_t<kMapsAllowRaces, no_lock, shared_lock>;
using bpf_map_write_lock = std::conditional_t<kMapsAllowRaces, no_lock, unique_lock>;

void* maps::bpf_map_lookup_elem(void* map_ptr, const void* key) noexcept {
    auto map = static_cast<Components::map*>(map_ptr);

    if (map) {
        bpf_map_read_lock lock(map->mutex);
        return map->lookup_elem(key);
    }
    return nullptr;
}

long maps::bpf_map_update_elem(void* map_ptr, const void* key, const void* value, U64 flags) noexcept {
    auto map = static_cast<Components::map*>(map_ptr);

    if (map) {
        bpf_map_write_lock lock(map->mutex);
        return map->update_elem(key, value, flags);
    }
    return -EBADF;
}

long maps::bpf_map_delete_elem(void* map_ptr, const void* key) noexcept {
    auto map = static_cast<Components::map*>(map_ptr);

    if (map) {
        bpf_map_write_lock lock(map->mutex);
        return map->delete_elem(key);
    }
    return -EBADF;
}

}  // namespace Components
