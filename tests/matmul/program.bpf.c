#include "../bpf_shim.h"

#define MAT_DIM 10
#define MAT_SIZE (MAT_DIM * MAT_DIM)

int main() {
    volatile float mat_1[MAT_SIZE], mat_2[MAT_SIZE], mat_res[MAT_SIZE];
    struct bpf_iter_num it;
    int* i;

    bpf_iter_num_new(&it, 0, MAT_SIZE);
    while ((i = bpf_iter_num_next(&it))) {
        mat_1[*i] = (float)bpf_rand_int(0, 100);
        mat_2[*i] = (float)bpf_rand_int(0, 100);
        mat_res[*i] = 0.0f;
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, 0, MAT_DIM * MAT_DIM * MAT_DIM);
    while ((i = bpf_iter_num_next(&it))) {
        int row = *i / (MAT_DIM * MAT_DIM);
        int col = (*i / MAT_DIM) % MAT_DIM;
        int k = *i % MAT_DIM;
        mat_res[row * MAT_DIM + col] += mat_1[row * MAT_DIM + k] * mat_2[k * MAT_DIM + col];
    }
    bpf_iter_num_destroy(&it);

    return 0;
}
