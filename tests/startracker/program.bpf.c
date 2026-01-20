#include "../bpf_shim.h"

#define PI    3.14159265359f

inline float sqroot(float s) { 
    float r = s / 2;
    if (s <= 0)
        return 0;

    long i = * (long *) &s;
    i = 0x5f3759df - ( i >> 1 );
    s = * (float *) &i;
    r = s * (1.5f - r * s * s);

    return 1.0f / r;
}

inline float sine(float rad) {
    float step = 0.125f * PI, v1 = 0.0f, v2 = 0.38268343f, frac, offset = rad;

    if (rad < 0.0f)
        rad = rad + 2.0f * PI;
    if (rad >= 2.0f * PI)
        rad = rad - 2.0f * PI;

    offset = (rad >= step) ? (rad - step) : offset;
    v1 = (rad >= step) ? 0.38268343f : v1;
    v2 = (rad >= step) ? 0.70710678f : v2;
    
    offset = (rad >= 2.0f * step) ? (rad - 2.0f * step) : offset;
    v1 = (rad >= 2.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 2.0f * step) ? 0.92387953f : v2;
    
    offset = (rad >= 3.0f * step) ? (rad - 3.0f * step) : offset;
    v1 = (rad >= 3.0f * step) ? 0.92387953f : v1;
    v2 = (rad >= 3.0f * step) ? 1.0f : v2;
    
    offset = (rad >= 4.0f * step) ? (rad - 4.0f * step) : offset;
    v1 = (rad >= 4.0f * step) ? 1.0f : v1;
    v2 = (rad >= 4.0f * step) ? 0.92387953f : v2;
    
    offset = (rad >= 5.0f * step) ? (rad - 5.0f * step) : offset;
    v1 = (rad >= 5.0f * step) ? 0.92387953f : v1;
    v2 = (rad >= 5.0f * step) ? 0.70710678f : v2;
    
    offset = (rad >= 6.0f * step) ? (rad - 6.0f * step) : offset;
    v1 = (rad >= 6.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 6.0f * step) ? 0.38268343f : v2;
    
    offset = (rad >= 7.0f * step) ? (rad - 7.0f * step) : offset;
    v1 = (rad >= 7.0f * step) ? 0.38268343f : v1;
    v2 = (rad >= 7.0f * step) ? 0.0f : v2;
    
    offset = (rad >= 8.0f * step) ? (rad - 8.0f * step) : offset;
    v1 = (rad >= 8.0f * step) ? 0.0f : v1;
    v2 = (rad >= 8.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 9.0f * step) ? (rad - 9.0f * step) : offset;
    v1 = (rad >= 9.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 9.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 10.0f * step) ? (rad - 10.0f * step) : offset;
    v1 = (rad >= 10.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 10.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 11.0f * step) ? (rad - 11.0f * step) : offset;
    v1 = (rad >= 11.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 11.0f * step) ? -1.0f : v2;
    
    offset = (rad >= 12.0f * step) ? (rad - 12.0f * step) : offset;
    v1 = (rad >= 12.0f * step) ? -1.0f : v1;
    v2 = (rad >= 12.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 13.0f * step) ? (rad - 13.0f * step) : offset;
    v1 = (rad >= 13.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 13.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 14.0f * step) ? (rad - 14.0f * step) : offset;
    v1 = (rad >= 14.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 14.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 15.0f * step) ? (rad - 15.0f * step) : offset;
    v1 = (rad >= 15.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 15.0f * step) ? 0.0f : v2;

    frac = offset / step;
    return v1 + frac * (v2 - v1);
}

inline float cosine(float rad) {
    float step = 0.125f * PI, v1 = 1.0f, v2 = 0.92387953f, frac, offset = rad;

    if (rad < 0.0f)
        rad = rad + 2.0f * PI;
    if (rad >= 2.0f * PI)
        rad = rad - 2.0f * PI;

   offset = (rad >= step) ? (rad - step) : offset;
    v1 = (rad >= step) ? 0.92387953f : v1;
    v2 = (rad >= step) ? 0.70710678f : v2;
    
    offset = (rad >= 2.0f * step) ? (rad - 2.0f * step) : offset;
    v1 = (rad >= 2.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 2.0f * step) ? 0.38268343f : v2;
    
    offset = (rad >= 3.0f * step) ? (rad - 3.0f * step) : offset;
    v1 = (rad >= 3.0f * step) ? 0.38268343f : v1;
    v2 = (rad >= 3.0f * step) ? 0.0f : v2;
    
    offset = (rad >= 4.0f * step) ? (rad - 4.0f * step) : offset;
    v1 = (rad >= 4.0f * step) ? 0.0f : v1;
    v2 = (rad >= 4.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 5.0f * step) ? (rad - 5.0f * step) : offset;
    v1 = (rad >= 5.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 5.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 6.0f * step) ? (rad - 6.0f * step) : offset;
    v1 = (rad >= 6.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 6.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 7.0f * step) ? (rad - 7.0f * step) : offset;
    v1 = (rad >= 7.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 7.0f * step) ? -1.0f : v2;
    
    offset = (rad >= 8.0f * step) ? (rad - 8.0f * step) : offset;
    v1 = (rad >= 8.0f * step) ? -1.0f : v1;
    v2 = (rad >= 8.0f * step) ? -0.92387953f : v2;
    
    offset = (rad >= 9.0f * step) ? (rad - 9.0f * step) : offset;
    v1 = (rad >= 9.0f * step) ? -0.92387953f : v1;
    v2 = (rad >= 9.0f * step) ? -0.70710678f : v2;
    
    offset = (rad >= 10.0f * step) ? (rad - 10.0f * step) : offset;
    v1 = (rad >= 10.0f * step) ? -0.70710678f : v1;
    v2 = (rad >= 10.0f * step) ? -0.38268343f : v2;
    
    offset = (rad >= 11.0f * step) ? (rad - 11.0f * step) : offset;
    v1 = (rad >= 11.0f * step) ? -0.38268343f : v1;
    v2 = (rad >= 11.0f * step) ? 0.0f : v2;
    
    offset = (rad >= 12.0f * step) ? (rad - 12.0f * step) : offset;
    v1 = (rad >= 12.0f * step) ? 0.0f : v1;
    v2 = (rad >= 12.0f * step) ? 0.38268343f : v2;
    
    offset = (rad >= 13.0f * step) ? (rad - 13.0f * step) : offset;
    v1 = (rad >= 13.0f * step) ? 0.38268343f : v1;
    v2 = (rad >= 13.0f * step) ? 0.70710678f : v2;
    
    offset = (rad >= 14.0f * step) ? (rad - 14.0f * step) : offset;
    v1 = (rad >= 14.0f * step) ? 0.70710678f : v1;
    v2 = (rad >= 14.0f * step) ? 0.92387953f : v2;
    
    offset = (rad >= 15.0f * step) ? (rad - 15.0f * step) : offset;
    v1 = (rad >= 15.0f * step) ? 0.92387953f : v1;
    v2 = (rad >= 15.0f * step) ? 1.0f : v2;
    
    frac = offset / step; 
    return v1 + frac * (v2 - v1);
}

int main() {
    void *star_coords_x = MAP_BY_FD(0), *star_coords_y = MAP_BY_FD(1), *out_map = MAP_BY_FD(2), *result;
    float star_x[4], star_y[4], distances[6], hash_val;
    long locs[5];

    // Fetch star infos from BPF maps
    for (long i = 0; i < 4; i++) {
        result = bpf_map_lookup_elem(star_coords_x, &i);
        star_x[i] = *(float *)result;
        result = bpf_map_lookup_elem(star_coords_y, &i);
        star_y[i] = *(float *)result;
    }

    // Get star distances
    distances[0] = sqroot(((star_x[0] - star_x[1]) * (star_x[0] - star_x[1])) + ((star_y[0] - star_y[1]) * (star_y[0] - star_y[1])));
    distances[1] = sqroot(((star_x[1] - star_x[2]) * (star_x[1] - star_x[2])) + ((star_y[1] - star_y[2]) * (star_y[1] - star_y[2])));
    distances[2] = sqroot(((star_x[2] - star_x[3]) * (star_x[2] - star_x[3])) + ((star_y[2] - star_y[3]) * (star_y[2] - star_y[3])));
    distances[3] = sqroot(((star_x[1] - star_x[3]) * (star_x[1] - star_x[3])) + ((star_y[1] - star_y[3]) * (star_y[1] - star_y[3])));
    distances[4] = sqroot(((star_x[0] - star_x[2]) * (star_x[0] - star_x[2])) + ((star_y[0] - star_y[2]) * (star_y[0] - star_y[2])));
    distances[5] = sqroot(((star_x[0] - star_x[3]) * (star_x[0] - star_x[3])) + ((star_y[0] - star_y[3]) * (star_y[0] - star_y[3])));

    // Find largest star distance
    long max_dist_idx = 0;
    for (long i = 0; i < 6; i++) {
        float tmp_dis = distances[i] * 10000;
        float tmp_max = distances[max_dist_idx] * 10000;
        // Dirty hack to get around LLVM complaining
        if (*(long *)(&tmp_dis) > *(long *)(&tmp_max))
            max_dist_idx = i;
    }

    // Normalize star distances to max distance
    for (long i = 0; i < 6; i++) 
        distances[i] = distances[i] / distances[max_dist_idx];

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

    // Hash star distances with XOR
    for (long i = 0; i < 5; i++)
        locs[i] = *(long *)(&distances[i]);
    locs[0] = (locs[0] & locs[1]) | (~locs[0] & locs[2]);
    locs[1] = (locs[1] & locs[3]) | (locs[2] & ~locs[3]);
    locs[2] = locs[3] ^ (locs[2] & ~locs[4]);

    long i = locs[0] ^ locs[1] ^ locs[2];
    bpf_map_update_elem(out_map, &i, &hash_val, 0);

    return 0;
}
