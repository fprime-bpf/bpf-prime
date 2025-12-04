#include "Matmul.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"

namespace Components {

namespace Matmul {

const int MAT_DIM = 10, MAT_SIZE = 100;

int main() {
    void *mat_map_1 = (void*)maps::map_by_fd(0), *mat_map_2 = (void*)maps::map_by_fd(1),
         *mat_map_res = (void*)maps::map_by_fd(2), *result;
    float mat_1[MAT_SIZE], mat_2[MAT_SIZE], mat_res[MAT_SIZE];

    // Read in 2 matrices
    for (int i = 0; i < MAT_SIZE; i++) {
        result = maps::bpf_map_lookup_elem(mat_map_1, &i);
        mat_1[i] = *(float*)result;

        result = maps::bpf_map_lookup_elem(mat_map_1, &i);
        mat_2[i] = *(float*)result;
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
        maps::bpf_map_update_elem(mat_map_res, &i, &mat_res[i], 0);
    }

    return 0;
}

}  // namespace Matmul

}  // namespace Components
