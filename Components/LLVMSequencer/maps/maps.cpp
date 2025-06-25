#include <memory>
#include <stdexcept>
#include "maps.hpp"
#include "Components/LLVMSequencer/bpf.hpp"
#include "Components/LLVMSequencer/LLVMSequencer.hpp"

namespace Components {

void maps::load_maps(const void *maps, size_t maps_len) {

    auto map_def_size = sizeof(bpf_map_def);

    size_t count = maps_len / map_def_size;
    auto buffer = reinterpret_cast<const bpf_map_def*>(maps);

    for (size_t i = 0; i < count; i++) {
        auto map_def = std::make_unique<bpf_map_def>();

        std::memcpy(map_def.get(), &buffer[i], map_def_size);
        this->map_defs.push_back(std::move(map_def));
    }
}

void maps::create_maps() {
	for (const auto& map_def : map_defs) {

        std::unique_ptr<map> map;
        switch (map_def->type) {
            default:
                throw std::invalid_argument("Failed to create maps: unsupported BPF map type " + std::to_string(map_def->type));
        }

        this->map_instances.push_back(std::move(map));
	}
}

}
