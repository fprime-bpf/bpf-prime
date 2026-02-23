#if __wasm__
    #include "../wasm_shim.h"
#else
    #include "../bpf_shim.h"
#endif

int main() {
    BpfMapType in_map = MAP_BY_FD(0), out_map = MAP_BY_FD(1);
    void *result;
    struct bpf_iter_num it;
    float ins[7], preds[7];
    int *i;

    // Read in position and attitude
    bpf_iter_num_new(&it, 0, 7);
    while ((i = bpf_iter_num_next(&it))) {
        result = bpf_map_lookup_elem(in_map, i);
        ins[*i] = *(float *)result;
        preds[*i] = ins[*i];
    }
    bpf_iter_num_destroy(&it);

    // Get predictions
    bpf_iter_num_new(&it, 0, 7);
    while ((i = bpf_iter_num_next(&it))) {
        if (*i != 6)
            preds[*i] = preds[*i + 1] / 1.5f;
        else
            preds[*i] = preds[0] / 1.5f;
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, 0, 7);
    while ((i = bpf_iter_num_next(&it))) {
        // Diff with actual and multiply with factor
        ins[*i] = ins[*i] - preds[*i];
        ins[*i] *= 0.05f;

        // Write out estimate to BPF map
        preds[*i] = preds[*i] - ins[*i];
        bpf_map_update_elem(out_map, i, &preds[*i], 0);
    }
    bpf_iter_num_destroy(&it);

    return 0;
}
