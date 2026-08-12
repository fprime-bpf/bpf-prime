#include "../bpf_shim.h"

#define N_SAMPLES 7

int main() {
    void *in_map = MAP_BY_FD(2), *out_map = MAP_BY_FD(4), *result;
    struct bpf_iter_num it;
    float samples[N_SAMPLES];
    float y = 0.0f;
    const float alpha = 0.2f;
    long long* i;

    // Read in samples
    bpf_iter_num_new(&it, 0, N_SAMPLES);
    while ((i = bpf_iter_num_next(&it))) {
        result = bpf_map_lookup_elem(in_map, i);
        samples[*i] = *(float*)result;
    }
    bpf_iter_num_destroy(&it);

    // Single-pole IIR low-pass filter: y[n] = alpha*x[n] + (1-alpha)*y[n-1]
    bpf_iter_num_new(&it, 0, N_SAMPLES);
    while ((i = bpf_iter_num_next(&it))) {
        y = alpha * samples[*i] + (1.0f - alpha) * y;
        bpf_map_update_elem(out_map, i, &y, 0);
    }
    bpf_iter_num_destroy(&it);

    return 0;
}
