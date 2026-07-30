#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

#define FILE_LEN 64
#define CHUNK_LEN 8
#define NUM_CHUNKS (FILE_LEN / CHUNK_LEN)

namespace Components {

namespace CfdpChunk {

int main() {
    void *file_map = (void*)maps::map_by_fd(19), *state_map = (void*)maps::map_by_fd(20),
         *out_map = (void*)maps::map_by_fd(21), *result;

    int state_key = 0;
    result = maps::bpf_map_lookup_elem(state_map, &state_key);
    int chunk_index = result ? (*(int*)result % NUM_CHUNKS) : 0;
    if (chunk_index < 0) chunk_index += NUM_CHUNKS;

    int offset = chunk_index * CHUNK_LEN;

    int data[CHUNK_LEN];
    unsigned int checksum = 0;

    for (int i = 0; i < CHUNK_LEN; i++) {
        int key = offset + i;
        result = maps::bpf_map_lookup_elem(file_map, &key);
        data[i] = *(int*)result;
        checksum += (unsigned int)data[i];
    }

    // Emit the File Data PDU
    int key, val;

    key = 0; val = offset;        maps::bpf_map_update_elem(out_map, &key, &val, 0);
    key = 1; val = CHUNK_LEN;     maps::bpf_map_update_elem(out_map, &key, &val, 0);
    key = 2; val = (int)checksum; maps::bpf_map_update_elem(out_map, &key, &val, 0);

    for (int w = 0; w < CHUNK_LEN; w++) {
        key = 3 + w;
        val = data[w];
        maps::bpf_map_update_elem(out_map, &key, &val, 0);
    }

    // Checkpoint the next chunk index for the following invocation
    int next_index = (chunk_index + 1) % NUM_CHUNKS;
    maps::bpf_map_update_elem(state_map, &state_key, &next_index, 0);

    return 0;
}

} // namespace CfdpChunk

} // namespace Components
