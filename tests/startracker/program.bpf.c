#include "../bpf_shim.h"

#define PI    3.14159265359f
#define TERMS 10

inline float round_off(float f) {
    float delta = (f > 0.0f) ? 0.5f : -0.5f, ret = f * 1000.0f;
    ret = (float)((int)(ret + delta));
    return ret / 1000.0f;
}

inline float sqroot(float s) { 
    double r = s/3;
    long i;
    if (s <= 0)
        return 0;

    r = (r + s / r) / 2;
    r = (r + s / r) / 2;
    r = (r + s / r) / 2;
    r = (r + s / r) / 2;
    r = (r + s / r) / 2;

    return r;
}

inline float power(float base, long exp) {
    if(exp < 0) {
        if(base == 0)
            return -0; // Error!!
        return 1 / (base * power(base, (-exp) - 1));
    }
    if(exp == 0)
        return 1;
    if(exp == 1)
        return base;
    return base * power(base, exp - 1);
}

inline long fact(long n) {
    return n <= 0 ? 1 : n * fact(n-1);
}

inline float sine(float rad) {
    float sin = 0;

    for(long i = 0; i < TERMS; i++) {
        sin += power(-1, i) * power(rad, 2 * i + 1) / fact(2 * i + 1);
    }
    return sin;
}

inline float cosine(float rad) {
    float cos = 0;

    for(long i = 0; i < TERMS; i++) {
        cos += power(-1, i) * power(rad, 2 * i) / fact(2 * i);
    }
    return cos;
}

int main() {
    void *star_coords_x = MAP_BY_FD(0), *star_coords_y = MAP_BY_FD(1), *out_map = MAP_BY_FD(2), *result;
    float star_x[4], star_y[4], distances[6], max_distance, hash_val;
    long i, max_dist_idx;

    // Fetch star infos from BPF maps
    i = 0;
    result = bpf_map_lookup_elem(star_coords_x, &i);
    star_x[i] = *(float *)result;
    result = bpf_map_lookup_elem(star_coords_y, &i);
    star_y[i] = *(float *)result;

    i = 1;
    result = bpf_map_lookup_elem(star_coords_x, &i);
    star_x[i] = *(float *)result;
    result = bpf_map_lookup_elem(star_coords_y, &i);
    star_y[i] = *(float *)result;

    i = 2;
    result = bpf_map_lookup_elem(star_coords_x, &i);
    star_x[i] = *(float *)result;
    result = bpf_map_lookup_elem(star_coords_y, &i);
    star_y[i] = *(float *)result;

    i = 3;
    result = bpf_map_lookup_elem(star_coords_x, &i);
    star_x[i] = *(float *)result;
    result = bpf_map_lookup_elem(star_coords_y, &i);
    star_y[i] = *(float *)result;

    // Get star distances
    distances[0] = sqroot(((star_x[0] - star_x[1]) * (star_x[0] - star_x[1])) + ((star_y[0] - star_y[1]) * (star_y[0] - star_y[1])));
    distances[1] = sqroot(((star_x[1] - star_x[2]) * (star_x[1] - star_x[2])) + ((star_y[1] - star_y[2]) * (star_y[1] - star_y[2])));
    distances[2] = sqroot(((star_x[2] - star_x[3]) * (star_x[2] - star_x[3])) + ((star_y[2] - star_y[3]) * (star_y[2] - star_y[3])));
    distances[3] = sqroot(((star_x[1] - star_x[3]) * (star_x[1] - star_x[3])) + ((star_y[1] - star_y[3]) * (star_y[1] - star_y[3])));
    distances[4] = sqroot(((star_x[0] - star_x[2]) * (star_x[0] - star_x[2])) + ((star_y[0] - star_y[2]) * (star_y[0] - star_y[2])));
    distances[5] = sqroot(((star_x[0] - star_x[3]) * (star_x[0] - star_x[3])) + ((star_y[0] - star_y[3]) * (star_y[0] - star_y[3])));

    // Find largest star distance
    max_distance = distances[0];
    max_dist_idx = 0;
    if (max_distance < distances[1]) {
        max_distance = distances[1];
        max_dist_idx = 1;
    }
    if (max_distance < distances[2]) {
        max_distance = distances[2];
        max_dist_idx = 2;
    }
    if (max_distance < distances[3]) {
        max_distance = distances[3];
        max_dist_idx = 3;
    }
    if (max_distance < distances[4]) {
        max_distance = distances[4];
        max_dist_idx = 4;
    }
    if (max_distance < distances[5]) {
        max_distance = distances[5];
        max_dist_idx = 5;
    }

    // Normalize star distances to max distance
    distances[0] = distances[0] / max_distance;
    distances[1] = distances[1] / max_distance;
    distances[2] = distances[2] / max_distance;
    distances[3] = distances[3] / max_distance;
    distances[4] = distances[4] / max_distance;
    distances[5] = distances[5] / max_distance;

    // Drop element that contains 1.0f
    switch (max_dist_idx) {
    case 0:
        distances[0] = distances[1];
    case 1:
        distances[1] = distances[2];
    case 2:
        distances[2] = distances[3];
    case 3:
        distances[3] = distances[4];
    case 4:
        distances[4] = distances[5];
    case 5: // No need to do anything, last one is empty
    default:
        break;
    }

    // Hash star distances
    distances[0] = cosine(distances[0]);
    distances[1] = sine(distances[1]);
    distances[2] = cosine(distances[2]);
    distances[3] = sine(distances[3]);
    distances[4] = cosine(distances[4]);
    hash_val = distances[0] / distances[1] * distances[2] / distances[3] * distances[4];
    
    i = 0;
    bpf_map_update_elem(out_map, &i, &hash_val, 0);
}
