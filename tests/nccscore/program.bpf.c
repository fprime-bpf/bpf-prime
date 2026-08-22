#include "../bpf_shim.h"

#define MATCH_DIM 5
#define MATCH_SIZE (MATCH_DIM * MATCH_DIM)

#define IMG_DIM 50
#define IMG_SIZE (IMG_DIM * IMG_DIM)

int main() {
    void *map_image_input = MAP_BY_FD(13), *map_match_image = MAP_BY_FD(14);
    void* result;
    volatile int image_input[IMG_SIZE], match_image[MATCH_SIZE];
    // Signed/INT_MAX so (score - best_score)'s sign bit is well-defined.
    volatile int best_match, best_score = 0x7fffffff;

    struct bpf_iter_num it, ij, iii, ijj;
    long long* i, *j, *ii, *jj;

    // Read in input and match images
    bpf_iter_num_new(&it, 0, IMG_SIZE);
    while ((i = bpf_iter_num_next(&it))) {
        result = bpf_map_lookup_elem(map_image_input, i);
        image_input[*i] = *(int*)result;
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, 0, MATCH_SIZE);
    while ((i = bpf_iter_num_next(&it))) {
        result = bpf_map_lookup_elem(map_match_image, i);
        match_image[*i] = *(int*)result;
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, 0, IMG_DIM - MATCH_DIM + 1);
    while ((i = bpf_iter_num_next(&it))) {

        bpf_iter_num_new(&ij, 0, IMG_DIM - MATCH_DIM + 1);
        while ((j = bpf_iter_num_next(&ij))) {
            int score = 0;
            int temp;

            bpf_iter_num_new(&iii, 0, MATCH_DIM);
            while ((ii = bpf_iter_num_next(&iii))) {
                bpf_iter_num_new(&ijj, 0, MATCH_DIM);
                while ((jj = bpf_iter_num_next(&ijj))) {
                    int img_pixel = image_input[(*i + *ii) * IMG_DIM + (*j + *jj)];
                    int match_pixel = match_image[*ii * MATCH_DIM + *jj];

                    temp = (img_pixel & 0x000f) - (match_pixel & 0x000f);
                    if (temp > 0)
                        score += temp;
                    else
                        score -= temp;

                    temp = ((img_pixel & 0x00f0) >> 4) -
                           ((match_pixel & 0x00f0) >> 4);
                    if (temp > 0)
                        score += temp;
                    else
                        score -= temp;

                    temp = ((img_pixel & 0x0f00) >> 8) -
                           ((match_pixel & 0x0f00) >> 8);
                    if (temp > 0)
                        score += temp;
                    else
                        score -= temp;
                }
                bpf_iter_num_destroy(&ijj);
            }
            bpf_iter_num_destroy(&iii);

            // Branchless min-tracking (data-dependent compare would
            // fork the DFS at every (i,j) position; cf. ccsds msb_mask).
            // mask is all-ones iff score < best_score.
            // asm barriers stop clang refolding this into a branch.
            int diff = score - best_score;
            asm volatile("" : "+r"(diff));
            int mask = diff >> 31;
            asm volatile("" : "+r"(mask));
            int candidate = (int)(*i * IMG_DIM + *j);
            best_score = (best_score & ~mask) | (score & mask);
            best_match = (best_match & ~mask) | (candidate & mask);
        }
        bpf_iter_num_destroy(&ij);
    }
    bpf_iter_num_destroy(&it);

    int key = 0;
    bpf_map_update_elem(map_match_image, &key, &best_match, 0);

    return 0;
}
