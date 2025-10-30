#include "../bpf_shim.h"

#define MAT_DIM  16
#define MAT_SIZE 256
#define BLOCK 4

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
    for (int ii = 0; ii < MAT_DIM; ii += BLOCK) {
        for (int kk = 0; kk < MAT_DIM; kk += BLOCK) {
            for (int j = 0; j < MAT_DIM; j += 2) {
                for (int i = ii; i < ii + BLOCK; i += 2) {
                    float acc00 = 0, acc01 = 0, acc10 = 0, acc11 = 0;
                    if (kk != 0) {
                        acc00 = mat_res[i * MAT_DIM + j];
                        acc01 = mat_res[i * MAT_DIM + j + 1];
                        acc10 = mat_res[(i + 1) * MAT_DIM + j];
                        acc11 = mat_res[(i + 1) * MAT_DIM + j + 1];
                    }

                    for (int k = kk; k < MAT_DIM; k++) {
                        acc00 += mat_1[i * MAT_DIM + k] * mat_2[k * MAT_DIM + j];
                        acc01 += mat_1[i * MAT_DIM + k] * mat_2[k * MAT_DIM + j + 1];
                        acc10 += mat_1[(i + 1) * MAT_DIM + k] * mat_2[k * MAT_DIM + j];
                        acc11 += mat_1[(i + 1) * MAT_DIM + k] * mat_2[k * MAT_DIM + j + 1];
                    }

                    mat_res[i * MAT_DIM + j] = acc00;
                    mat_res[i * MAT_DIM + j + 1] = acc01;
                    mat_res[(i + 1) * MAT_DIM + j] = acc10;
                    mat_res[(i + 1) * MAT_DIM + j + 1] = acc11;
                }
            }
        }
    }

    // Write back to map
    for (int i = 0; i < MAT_SIZE; i++) {
        bpf_map_update_elem(mat_map_res, &i, &mat_res[i], 0);
    }

    return 0;
}
