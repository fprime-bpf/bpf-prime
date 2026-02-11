#include "../wasm_shim.h"
#include <stdint.h>

__attribute__((export_name("run")))
void run() {
    uint64_t map = MAP_BY_FD(0);
    int num = bpf_map_lookup_elem(map, 0);
    bpf_map_update_elem(map, 0, num * 2, 0);
}
