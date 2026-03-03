#include "../bpf_shim.h"

#define MATCH_DIM 5
#define MATCH_SIZE (MATCH_DIM * MATCH_DIM)

#define IMG_DIM 50
#define IMG_SIZE (IMG_DIM * IMG_DIM)

int main() {
    void *map_image_input = MAP_BY_FD(13), *map_match_image = MAP_BY_FD(14);
    void* result;
    int image_input[IMG_SIZE], match_image[MATCH_SIZE];
    unsigned int best_match, best_score = 0xffffffff;

    // Read in input and match images
    for (int i = 0; i < IMG_SIZE; i++) {
        result = bpf_map_lookup_elem(map_image_input, &i);
        image_input[i] = *(int*)result;
    }

    for (int i = 0; i < MATCH_SIZE; i++) {
        result = bpf_map_lookup_elem(map_match_image, &i);
        match_image[i] = *(int*)result;
    }

    for (int i = 0; i <= IMG_DIM - MATCH_DIM; i++) {
        for (int j = 0; j <= IMG_DIM - MATCH_DIM; j++) {
            int score = 0;
            int temp;

            for (int ii = 0; ii < MATCH_DIM; ii++) {
                for (int jj = 0; jj < MATCH_DIM; jj++) {
                    int img_pixel = image_input[(i + ii) * IMG_DIM + (j + jj)];
                    int match_pixel = match_image[ii * MATCH_DIM + jj];

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
            }

            if (score < best_score) {
                best_match = i * IMG_DIM + j;
                best_score = score;
            }
        }
    }

    int i = 0;
    bpf_map_update_elem(map_match_image, &i, &best_match, 0);

    return 0;
}
