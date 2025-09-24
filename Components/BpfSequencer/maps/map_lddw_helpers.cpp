#include "maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/bpf.hpp"

namespace Components {

U64 maps::map_by_fd(U32 fd) noexcept {
    if (BpfSequencer::maps.map_instances.find(fd) == BpfSequencer::maps.map_instances.end())
        return 0;
    
    auto map = BpfSequencer::maps.map_instances[fd];
    return reinterpret_cast<U64>(map); 
}

U64 maps::map_by_idx(U32 idx) noexcept {
    return map_by_fd(idx);
}

U64 maps::map_val(U64 map_ptr) noexcept {
    auto map = reinterpret_cast<Components::map *>(map_ptr);
    return reinterpret_cast<U64>(map->get_addr_of_first_val());
}

}
