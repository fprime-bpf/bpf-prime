#include "../bpf_shim.h"

int main() {
    void *map = MAP_BY_FD(3);
    int key = 0;

    void *result = bpf_map_lookup_elem(map, &key);

    if (result == 0) {
        return -1;
    }

    map = MAP_BY_FD(3);
    key = 1;
    int value = (*(int *)result) * 2;
    bpf_map_update_elem(map, &key, &value, 0);

    return 0;
}
