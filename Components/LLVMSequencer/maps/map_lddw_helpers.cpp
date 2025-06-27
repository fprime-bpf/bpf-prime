#include "maps.hpp"
#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include "Components/LLVMSequencer/bpf.hpp"

namespace Components {

uint64_t maps::map_by_fd(uint32_t fd) {
    // TODO: 
    return 0;
}

uint64_t maps::map_by_idx(uint32_t idx) {
    auto map = LLVMSequencer::maps.map_instances[idx].get();
    return reinterpret_cast<uint64_t>(map); 
}

uint64_t maps::map_val(uint64_t map_ptr) {
    auto map = get_map_from_ptr((bpf_map_def *)map_ptr);
    return reinterpret_cast<uint64_t>(map->get_addr_of_first_val());
}

}
