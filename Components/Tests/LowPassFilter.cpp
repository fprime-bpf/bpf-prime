#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

namespace Components {

namespace LowPassFilter {

int main() {
    void *in_map = (void*)maps::map_by_fd(2), *out_map = (void*)maps::map_by_fd(4);
    int key = 0;

    void *input_result = maps::bpf_map_lookup_elem(in_map, &key);
    float value = *((float *)input_result);

    key = 1;
    void *min_result = maps::bpf_map_lookup_elem(in_map, &key);
    float min = *((float *) min_result);

    if (value > min)
        maps::bpf_map_update_elem(out_map, &key, &value, 0);

    return 0;
}

} // namespace LowPassFilter

} // namespace Components
