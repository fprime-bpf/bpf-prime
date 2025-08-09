#include "../bpf_shim.h"

int main() {
    void *map = MAP_BY_FD(2);
    int key = 0xFFFFFFFF;
    int value = 0xDEADBEEF;

    bpf_map_update_elem(map, &key, &value, 0);

    map = MAP_BY_FD(2);
    key = 0xFFFFFFFF;
    value = 0;

    bpf_map_update_elem(map, &key, &value, BPF_NOEXIST);

    return 0;
}
