// WASM counterpart of the ccsds BPF kernel. WASM execution doesn't go
// through the restricted BPF backend or the runtime-verifier, so this uses
// the natural (nested-loop, real-branch) algorithm shape directly instead
// of the flattened/branch-free rewrite the BPF version needed.

#include "../wasm_shim.h"

#define PAYLOAD_LEN 16

#define CCSDS_VERSION       0
#define CCSDS_TYPE          0
#define CCSDS_SEC_HDR_FLAG  0
#define CCSDS_APID          0x123
#define CCSDS_SEQ_FLAGS     3

#define CRC16_POLY 0x1021
#define CRC16_INIT 0xFFFF

int main() {
    uint64_t in_map = MAP_BY_FD(15), out_map = MAP_BY_FD(16);
    uint32_t result;

    int32_t payload[PAYLOAD_LEN];
    uint32_t crc = CRC16_INIT;

    for (int i = 0; i < PAYLOAD_LEN; i++) {
        result = bpf_map_lookup_elem(in_map, i);
        payload[i] = (int32_t)result;
    }

    for (int b = 0; b < PAYLOAD_LEN; b++) {
        uint32_t word = (uint32_t)payload[b];

        for (int byte_in_word = 0; byte_in_word < 4; byte_in_word++) {
            uint32_t shift = 24 - byte_in_word * 8;
            uint32_t byte = (word >> shift) & 0xFF;

            crc ^= (byte << 8);

            for (int bit = 0; bit < 8; bit++) {
                if (crc & 0x8000)
                    crc = (crc << 1) ^ CRC16_POLY;
                else
                    crc = crc << 1;
                crc &= 0xFFFF;
            }
        }
    }

    uint32_t seq_count = (uint32_t)payload[0] & 0x3FFF;
    uint32_t hdr_word1 = ((uint32_t)CCSDS_VERSION << 13) |
                          ((uint32_t)CCSDS_TYPE << 12) |
                          ((uint32_t)CCSDS_SEC_HDR_FLAG << 11) |
                          ((uint32_t)CCSDS_APID & 0x7FF);
    uint32_t hdr_word2 = ((uint32_t)CCSDS_SEQ_FLAGS << 14) | seq_count;
    uint32_t hdr_word3 = (uint32_t)(PAYLOAD_LEN * 4 - 1);

    bpf_map_update_elem(out_map, 0, hdr_word1, 0);
    bpf_map_update_elem(out_map, 1, hdr_word2, 0);
    bpf_map_update_elem(out_map, 2, hdr_word3, 0);

    for (int w = 0; w < PAYLOAD_LEN; w++) {
        bpf_map_update_elem(out_map, 3 + w, (uint32_t)payload[w], 0);
    }

    bpf_map_update_elem(out_map, 3 + PAYLOAD_LEN, crc, 0);

    return 0;
}
