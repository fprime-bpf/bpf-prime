#include "../bpf_shim.h"

int main() {
    void *map = MAP_BY_FD(0);
    int key = 0;
    int value = 0xDEADBEEF;

    bpf_map_update_elem(map, &key, &value, 0);

    return 0;
}
