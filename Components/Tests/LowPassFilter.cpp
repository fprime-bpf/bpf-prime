#include "LowPassFilter.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"

namespace Components {

namespace LowPassFilter {

int main() {
    void* map = (void*)maps::map_by_fd(2);
    int key = 0;

    void* result = maps::bpf_map_lookup_elem(map, &key);

    if (result == 0) {
        return -1;
    }

    map = (void*)maps::map_by_fd(4);
    key = 0;
    float value = (*(float*)result);
    if (value >= 0.05f)
        maps::bpf_map_update_elem(map, &key, &value, 0);

    return 0;
}

}  // namespace LowPassFilter

}  // namespace Components
