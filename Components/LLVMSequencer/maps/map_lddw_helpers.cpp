#include "maps.hpp"
#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

namespace Components {

U64 maps::map_by_fd(U32 fd) noexcept {
    auto map = LLVMSequencer::maps.map_instances[fd];
    return reinterpret_cast<U64>(map); 
}

U64 maps::map_by_idx(U32 idx) noexcept {
    auto map = LLVMSequencer::maps.map_instances[idx];
    return reinterpret_cast<U64>(map); 
}

U64 maps::map_val(U64 map_ptr) noexcept {
    auto map = reinterpret_cast<Components::map *>(map_ptr);
    return reinterpret_cast<U64>(map->get_addr_of_first_val());
}

}
