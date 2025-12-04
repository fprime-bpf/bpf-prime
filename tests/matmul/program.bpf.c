#include "../bpf_shim.h"

#define MAT_DIM  10
#define MAT_SIZE (MAT_DIM * MAT_DIM)

int main() {
    void *mat_map_1 = MAP_BY_FD(0), *mat_map_2 = MAP_BY_FD(1), *mat_map_res = MAP_BY_FD(2), *result;
    float mat_1[MAT_SIZE], mat_2[MAT_SIZE], mat_res[MAT_SIZE];

    // Read in 2 matrices
    for (int i = 0; i < MAT_SIZE; i++) {
        result = bpf_map_lookup_elem(mat_map_1, &i);
        mat_1[i] = *(float *)result;

        result = bpf_map_lookup_elem(mat_map_2, &i);
        mat_2[i] = *(float *)result;
    }

    // Do multiplication
    for (int i = 0; i < MAT_DIM; i++) {
        for (int j = 0; j < MAT_DIM; j++) {
            mat_res[i * MAT_DIM + j] = 0.0f;
            for (int k = 0; k < MAT_DIM; k++) {
                mat_res[i * MAT_DIM + j] += mat_1[i * MAT_DIM + k] * mat_2[k * MAT_DIM + j];
            }
        }
    }

    // Write back to map
    for (int i = 0; i < MAT_SIZE; i++) {
        bpf_map_update_elem(mat_map_res, &i, &mat_res[i], 0);
    }

    return 0;
}
