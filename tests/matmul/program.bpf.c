#include "../bpf_shim.h"

#define MAT_DIM 10
#define MAT_SIZE (MAT_DIM * MAT_DIM)

// Branch-free int-to-float conversion via bit trick -- there is no hardware
// int-to-float instruction on this target (confirmed absent from both the
// duotronic LLVM backend and llvmbpf's own JIT, i.e. no fix on either side
// can make (float)some_int "just work" here). Only valid for non-negative
// integers small enough to fit in a float's 23-bit mantissa (i < 2^23);
// bpf_rand_int(0, 100)'s range is always within that. OR-ing i's bits into
// 2^23's bit pattern (0x4B000000) gives exactly (2^23 + i) reinterpreted as
// float, since i's bits don't overlap the sign/exponent; subtracting 2^23
// back out is then exact (both operands are exactly representable and close
// in magnitude), leaving i.0f. Same bit-reinterpretation convention as
// sqroot()'s existing fast-inverse-square-root trick below.
inline float int_to_float_small(int i) {
    unsigned int bits = ((unsigned int)i) | 0x4B000000u;
    float biased = *(float*)&bits;
    return biased - 8388608.0f;
}

int main() {
    volatile float mat_1[MAT_SIZE], mat_2[MAT_SIZE], mat_res[MAT_SIZE];
    struct bpf_iter_num it;
    long long* i;

    bpf_iter_num_new(&it, 0, MAT_SIZE);
    while ((i = bpf_iter_num_next(&it))) {
        mat_1[*i] = int_to_float_small(bpf_rand_int(0, 100));
        mat_2[*i] = int_to_float_small(bpf_rand_int(0, 100));
        mat_res[*i] = 0.0f;
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, 0, MAT_DIM * MAT_DIM * MAT_DIM);
    while ((i = bpf_iter_num_next(&it))) {
        int row = (int)*i / (MAT_DIM * MAT_DIM);
        int col = ((int)*i / MAT_DIM) % MAT_DIM;
        int k = (int)*i % MAT_DIM;
        mat_res[row * MAT_DIM + col] += mat_1[row * MAT_DIM + k] * mat_2[k * MAT_DIM + col];
    }
    bpf_iter_num_destroy(&it);

    return 0;
}
