#include "../wasm_shim.h"

int main() {
    uint64_t in_map = MAP_BY_FD(2), out_map = MAP_BY_FD(4);
    uint32_t result;
    float samples[7];
    float y = 0.0f;
    const float alpha = 0.2f;

    for (int i = 0; i < 7; i++) {
        result = bpf_map_lookup_elem(in_map, i);
        samples[i] = *(float *)&result;
    }

    // Single-pole IIR low-pass filter: y[n] = alpha*x[n] + (1-alpha)*y[n-1]
    for (int i = 0; i < 7; i++) {
        y = alpha * samples[i] + (1.0f - alpha) * y;
        bpf_map_update_elem(out_map, i, y, 0);
    }

    return 0;
}
