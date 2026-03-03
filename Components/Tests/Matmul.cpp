#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

#define MAT_DIM  10
#define MAT_SIZE (MAT_DIM * MAT_DIM)

namespace Components {

namespace Matmul {

int main() {
    float mat_1[MAT_SIZE], mat_2[MAT_SIZE], mat_res[MAT_SIZE];

    for (int i = 0; i < MAT_SIZE; i++) {
        mat_1[i] = (float)BpfSequencer::bpf_rand_int(0, 100);
        mat_2[i] = (float)BpfSequencer::bpf_rand_int(0, 100);
        mat_res[i] = 0.0f;
    }

    for (int i = 0; i < MAT_DIM * MAT_DIM * MAT_DIM; i++) {
        int row = i / (MAT_DIM * MAT_DIM);
        int col = (i / MAT_DIM) % MAT_DIM;
        int k = i % MAT_DIM;
        mat_res[row * MAT_DIM + col] += mat_1[row * MAT_DIM + k] * mat_2[k * MAT_DIM + col];
    }

    return 0;
}

} // namespace Matmul

} // namespace Components
