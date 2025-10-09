#include "../bpf_shim.h"

int main() {
    void *mat_map_1 = MAP_BY_FD(0), *mat_map_2 = MAP_BY_FD(1), *mat_map_res = MAP_BY_FD(2), *result;
    float mat_1[100], mat_2[100], mat_res[100];

    // Read in 2 matrices
    for (int i = 0; i < 100; i++) {
        result = bpf_map_lookup_elem(mat_map_1, &i);
        mat_1[i] = *(float *)result;

        result = bpf_map_lookup_elem(mat_map_2, &i);
        mat_2[i] = *(float *)result;
    }

    // Do multiplication
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            mat_res[i * 10 + j] = 0.0f;
            for (int k = 0; k < 10; k++) {
                mat_res[i * 10 + j] += mat_1[i * 10 + k] * mat_2[k * 10 + j];
            }
        }
    }

    // Write back to map
    for (int i = 0; i < 100; i++) {
        bpf_map_update_elem(mat_map_res, &i, &mat_res[i], 0);
    }

    return 0;
}
