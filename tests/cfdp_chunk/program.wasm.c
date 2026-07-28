// WASM counterpart of the cfdp_chunk BPF kernel. bpf_map_lookup_elem
// returns the map value directly (by value, not a pointer) in the WASM
// shim, so there's no null-check equivalent needed here -- it just reads
// whatever the array map currently holds (0 on the very first call, since
// array maps zero-init).

#include "../wasm_shim.h"

#define FILE_LEN 64
#define CHUNK_LEN 8
#define NUM_CHUNKS (FILE_LEN / CHUNK_LEN)

int main() {
    uint64_t file_map = MAP_BY_FD(19), state_map = MAP_BY_FD(20), out_map = MAP_BY_FD(21);
    uint32_t result;

    result = bpf_map_lookup_elem(state_map, 0);
    int chunk_index = (int)result % NUM_CHUNKS;
    if (chunk_index < 0) chunk_index += NUM_CHUNKS;

    int offset = chunk_index * CHUNK_LEN;

    int32_t data[CHUNK_LEN];
    uint32_t checksum = 0;

    for (int i = 0; i < CHUNK_LEN; i++) {
        result = bpf_map_lookup_elem(file_map, offset + i);
        data[i] = (int32_t)result;
        checksum += (uint32_t)data[i];
    }

    // Emit the File Data PDU
    bpf_map_update_elem(out_map, 0, (uint32_t)offset, 0);
    bpf_map_update_elem(out_map, 1, CHUNK_LEN, 0);
    bpf_map_update_elem(out_map, 2, checksum, 0);

    for (int w = 0; w < CHUNK_LEN; w++) {
        bpf_map_update_elem(out_map, 3 + w, (uint32_t)data[w], 0);
    }

    // Checkpoint the next chunk index for the following invocation
    int next_index = (chunk_index + 1) % NUM_CHUNKS;
    bpf_map_update_elem(state_map, 0, (uint32_t)next_index, 0);

    return 0;
}
