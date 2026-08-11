#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "maps.hpp"
#include "shared_mutex.hpp"

namespace Components {

#ifdef BPF_MAPS_ALLOW_RACES
// Deliberately unsynchronized map access. Opt-in only (BPF_MAPS_ALLOW_RACES),
// for characterizing what real hardware does when two BpfSequencer rate-group
// members share a map fd and get dispatched to different worker cores at
// overlapping times -- the normal shared_mutex below serializes that access
// and hides the race; this variant removes the lock so the race can actually
// happen and be observed. Not for any non-experimental build.
struct no_lock {
    explicit no_lock(shared_mutex&) {}
};
using bpf_map_read_lock = no_lock;
using bpf_map_write_lock = no_lock;
#else
using bpf_map_read_lock = shared_lock;
using bpf_map_write_lock = unique_lock;
#endif

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
