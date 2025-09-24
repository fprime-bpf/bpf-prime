//! @file array_map.hpp

#include "maps.hpp"
#include "Components/BpfSequencer/bpf.hpp"
#include <Fw/Types/BasicTypes.hpp>

#pragma once

namespace Components {

/**
 * @brief BPF array map implementation
 * 
 */
class array_map : public map {
    private:
        U8 *mem;
    public:
        array_map(const bpf_map_def& map_def, I32& res) noexcept;
        ~array_map();

        void *lookup_elem(const void *key) noexcept override;
        long update_elem(const void *key, const void *value, U64 flags) noexcept override;
        long delete_elem(const void *key) noexcept override;

        void *get_addr_of_first_val() noexcept override;
};

}
