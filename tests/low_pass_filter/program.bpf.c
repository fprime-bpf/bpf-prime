#include "../bpf_shim.h"

int main() {
    void *map = MAP_BY_FD(2);
    int key = 0;

    void *result = bpf_map_lookup_elem(map, &key);

    if (result == 0) {
        return -1;
    }

<<<<<<<< HEAD:Components/LLVMSequencer/tests/low_pass_filter/program.bpf.c
    map = MAP_BY_FD(4);
    key = 0;
    float value = (*(float *)result);
    if (value >= 0.05f)
        bpf_map_update_elem(map, &key, &value, 0);
========
    map = MAP_BY_FD(2);
    key = 1;
    char value = (*(char *)result) * 2;
    bpf_map_update_elem(map, &key, &value, 0);
>>>>>>>> cdc8c87e56c765bde130610f203b847a3ddf15ad:tests/map_lookup/program.bpf.c

    return 0;
}
