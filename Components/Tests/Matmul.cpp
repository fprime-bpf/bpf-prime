#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

#define MAT_DIM  10
#define MAT_SIZE (MAT_DIM * MAT_DIM)

namespace Components {

namespace Matmul {

// Matches program.bpf.c's int_to_float_small(): the bpf target has no
// hardware int-to-float instruction, so that version uses a bit trick
// instead of a plain (float) cast. Kept identical here (rather than just
// casting, which native could do natively) so all three implementations
// compute bit-for-bit the same value.
inline float int_to_float_small(int i) {
    unsigned int bits = ((unsigned int)i) | 0x4B000000u;
    float biased = *(float*)&bits;
    return biased - 8388608.0f;
}

int main() {
    volatile float mat_1[MAT_SIZE], mat_2[MAT_SIZE], mat_res[MAT_SIZE];

    for (int i = 0; i < MAT_SIZE; i++) {
        mat_1[i] = int_to_float_small(BpfSequencer::bpf_rand_int(0, 100));
        mat_2[i] = int_to_float_small(BpfSequencer::bpf_rand_int(0, 100));
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
