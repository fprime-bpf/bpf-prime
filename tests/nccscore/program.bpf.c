#include "../bpf_shim.h"

#define MATCH_DIM  5
#define MATCH_SIZE (MATCH_DIM * MATCH_DIM)

#define IMG_DIM 50
#define IMG_SIZE (IMG_DIM * IMG_DIM)

int main() {
    void *map_image_input = MAP_BY_FD(0), *map_match_image = MAP_BY_FD(1), *result;
    int image_input[IMG_SIZE], match_image[MATCH_SIZE];
    long best_match, best_score = 0xffffffff;

    // Read in input and match images
    for (int i = 0; i < IMG_SIZE; i++) {
        result = bpf_map_lookup_elem(map_image_input, &i);
        image_input[i] = *(int *)result;
    }

    for (int i = 0; i < MATCH_SIZE; i++) {
        result = bpf_map_lookup_elem(map_match_image, &i);
        match_image[i] = *(int *)result;
    }

    for (long i = 0; i < IMG_DIM - MATCH_DIM; i++) {
        for (long j = 0; j < IMG_DIM - MATCH_DIM; i++) {
            long score = 0;
            int temp;

            for (long ii = 0; ii < MATCH_DIM; ii++) {
                for (long jj = 0; jj < MATCH_DIM; jj++) {
                    temp = ((image_input[(i + ii) * IMG_DIM + j + jj]) & 0x000f) - (match_image[ii + jj] & 0x000f);
                    if (temp > 0)
                      score += temp;
                    else
                      score -= temp;

                    temp = (((image_input[(i + ii) * IMG_DIM + j + jj]) & 0x00f0) >> 8) - ((match_image[ii + jj] & 0x00f0) >> 8);
                    if (temp > 0)
                      score += temp;
                    else
                      score -= temp;

                    temp = (((image_input[(i + ii) * IMG_DIM + j + jj]) & 0x0f00) >> 16) - ((match_image[ii + jj] & 0x0f00) >> 16);
                    if (temp > 0)
                      score += temp;
                    else
                      score -= temp;
                }
            }

            if (score < best_score) {
                best_match = i;
                best_score = score;
            }
        }
    }

    return 0;
}
