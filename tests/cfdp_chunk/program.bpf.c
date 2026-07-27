// CFDP-style file-transfer chunking benchmark.
//
// Stateful across invocations: the current chunk index lives in a
// persistent BPF map entry (fd 1) rather than being recomputed each run, so
// repeated invocations step through the virtual file like a real File Data
// PDU sequence would -- this is deliberately a checkpoint/migration-style
// benchmark, since the entire resumable state is that one map entry.
//
// Map layout (fds are local to this VM slot):
//   fd 0: FILE_LEN entries, int -- backing "file" data
//   fd 1: 1 entry, int          -- persistent chunk index (do not
//                                  reinitialize between runs; starts at 0
//                                  since array maps zero-init)
//   fd 2: 3 + CHUNK_LEN entries, int -- output File Data PDU:
//         [0] offset, [1] length, [2] additive checksum, [3..] chunk data

#include "../bpf_shim.h"

#define FILE_LEN 64
#define CHUNK_LEN 8
#define NUM_CHUNKS (FILE_LEN / CHUNK_LEN)

int main() {
    void *file_map = MAP_BY_FD(0), *state_map = MAP_BY_FD(1), *out_map = MAP_BY_FD(2);
    void *result;

    int state_key = 0;
    result = bpf_map_lookup_elem(state_map, &state_key);
    int chunk_index = result ? (*(int*)result % NUM_CHUNKS) : 0;
    if (chunk_index < 0) chunk_index += NUM_CHUNKS;

    int offset = chunk_index * CHUNK_LEN;

    volatile int data[CHUNK_LEN];
    volatile unsigned int checksum = 0;

    struct bpf_iter_num it;
    long long *i;

    bpf_iter_num_new(&it, 0, CHUNK_LEN);
    while ((i = bpf_iter_num_next(&it))) {
        long long key = offset + *i;
        result = bpf_map_lookup_elem(file_map, &key);
        data[*i] = *(int*)result;
        checksum += (unsigned int)data[*i];
    }
    bpf_iter_num_destroy(&it);

    // Emit the File Data PDU
    int key, val;

    key = 0; val = offset;     bpf_map_update_elem(out_map, &key, &val, 0);
    key = 1; val = CHUNK_LEN;  bpf_map_update_elem(out_map, &key, &val, 0);
    key = 2; val = (int)checksum; bpf_map_update_elem(out_map, &key, &val, 0);

    struct bpf_iter_num iw;
    long long *w;
    bpf_iter_num_new(&iw, 0, CHUNK_LEN);
    while ((w = bpf_iter_num_next(&iw))) {
        key = 3 + (int)*w;
        val = data[*w];
        bpf_map_update_elem(out_map, &key, &val, 0);
    }
    bpf_iter_num_destroy(&iw);

    // Checkpoint the next chunk index for the following invocation
    int next_index = (chunk_index + 1) % NUM_CHUNKS;
    bpf_map_update_elem(state_map, &state_key, &next_index, 0);

    return 0;
}
