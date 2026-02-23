#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include <cmath>

namespace Components {

namespace StarTracker {

int main() {
    void *star_coords_x = (void*)maps::map_by_fd(0), *star_coords_y = (void*)maps::map_by_fd(1), *out_map = (void*)maps::map_by_fd(2);
    void *result;
    volatile float star_x[4], star_y[4], distances[6], hash_val;
    long locs[5];

    // Fetch star infos from BPF maps
    for (long i = 0; i < 4; i++) {
        result = maps::bpf_map_lookup_elem(star_coords_x, &i);
        star_x[i] = *(float *)result;
        result = maps::bpf_map_lookup_elem(star_coords_y, &i);
        star_y[i] = *(float *)result;
    }

    // Get star distances
    distances[0] = sqrt(((star_x[0] - star_x[1]) * (star_x[0] - star_x[1])) + ((star_y[0] - star_y[1]) * (star_y[0] - star_y[1])));
    distances[1] = sqrt(((star_x[1] - star_x[2]) * (star_x[1] - star_x[2])) + ((star_y[1] - star_y[2]) * (star_y[1] - star_y[2])));
    distances[2] = sqrt(((star_x[2] - star_x[3]) * (star_x[2] - star_x[3])) + ((star_y[2] - star_y[3]) * (star_y[2] - star_y[3])));
    distances[3] = sqrt(((star_x[1] - star_x[3]) * (star_x[1] - star_x[3])) + ((star_y[1] - star_y[3]) * (star_y[1] - star_y[3])));
    distances[4] = sqrt(((star_x[0] - star_x[2]) * (star_x[0] - star_x[2])) + ((star_y[0] - star_y[2]) * (star_y[0] - star_y[2])));
    distances[5] = sqrt(((star_x[0] - star_x[3]) * (star_x[0] - star_x[3])) + ((star_y[0] - star_y[3]) * (star_y[0] - star_y[3])));

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
    maps::bpf_map_update_elem(out_map, &i, (const void*)&hash_val, 0);

    return 0;
}

} // namespace StarTracker

} // namespace Components
