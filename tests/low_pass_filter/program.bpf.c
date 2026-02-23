#if __wasm__
    #include "../wasm_shim.h"
#else
    #include "../bpf_shim.h"
#endif

int main() {
    BpfMapType in_map = MAP_BY_FD(2), out_map = MAP_BY_FD(4);
    int key = 0;

    void *input_result = bpf_map_lookup_elem(in_map, &key);
    float value = *((float *)input_result);

    key = 1;
    void *min_result = bpf_map_lookup_elem(in_map, &key);
    float min = *((float *) min_result);

    if (value > min)
        bpf_map_update_elem(out_map, &key, &value, 0);

    return 0;
}
