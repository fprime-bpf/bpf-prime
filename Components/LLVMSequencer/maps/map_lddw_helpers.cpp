#include "maps.hpp"
#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

namespace Components {

U64 maps::map_by_fd(U32 fd) noexcept {
    auto map = LLVMSequencer::maps.map_instances[fd];
    return reinterpret_cast<U64>(map); 
}

U64 maps::map_by_idx(U32 idx) noexcept {
    auto& maps = LLVMSequencer::maps;

    U32 count = 0, map_idx = -1;
    while (count != (idx + 1)) {
        map_idx++;
        if (map_idx >= maps.Map_Instances_Max_Size) return 0;
        count += (maps.map_instances_bitmask >> map_idx) & (U32)1;
    }

    auto map = LLVMSequencer::maps.map_instances[map_idx];
    return reinterpret_cast<U64>(map); 
}

U64 maps::map_val(U64 map_ptr) noexcept {
    auto map = reinterpret_cast<Components::map *>(map_ptr);
    return reinterpret_cast<U64>(map->get_addr_of_first_val());
}

}
