#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

namespace Components {

namespace LowPassFilter {

int main() {
    void *in_map = (void*)maps::map_by_fd(2), *out_map = (void*)maps::map_by_fd(4);
    const int N_SAMPLES = 7;
    float samples[N_SAMPLES];
    float y = 0.0f;
    const float alpha = 0.2f;

    for (int i = 0; i < N_SAMPLES; i++) {
        void *result = maps::bpf_map_lookup_elem(in_map, &i);
        samples[i] = *((float *)result);
    }

    // Single-pole IIR low-pass filter: y[n] = alpha*x[n] + (1-alpha)*y[n-1]
    for (int i = 0; i < N_SAMPLES; i++) {
        y = alpha * samples[i] + (1.0f - alpha) * y;
        maps::bpf_map_update_elem(out_map, &i, &y, 0);
    }

    return 0;
}

} // namespace LowPassFilter

} // namespace Components
