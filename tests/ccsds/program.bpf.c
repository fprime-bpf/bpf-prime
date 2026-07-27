// CCSDS telemetry packetization + header parsing/framing benchmark.
//
// Integer-heavy, control-flow-rich workload with a small working set: builds
// a CCSDS space packet primary header (CCSDS 133.0-B-2) around a telemetry
// payload and appends a bit-by-bit CRC-16/CCITT-FALSE checksum over that
// payload -- no lookup table, in contrast to the Reed-Solomon benchmark.
//
// Map layout (fds are local to this VM slot):
//   fd 0: PAYLOAD_LEN entries, int  -- input telemetry parameter words
//   fd 1: 3 + PAYLOAD_LEN + 1 entries, int -- output frame:
//         [0] header word 1 (version/type/sec-hdr-flag/APID)
//         [1] header word 2 (seq flags/seq count)
//         [2] header word 3 (packet data length - 1, in octets)
//         [3 .. 3+PAYLOAD_LEN-1] payload words (passthrough)
//         [3+PAYLOAD_LEN] CRC-16/CCITT-FALSE over the payload octets

#include "../bpf_shim.h"

#define PAYLOAD_LEN 16

#define CCSDS_VERSION       0
#define CCSDS_TYPE          0   // 0 = telemetry
#define CCSDS_SEC_HDR_FLAG  0
#define CCSDS_APID          0x123
#define CCSDS_SEQ_FLAGS     3   // unsegmented user data

#define CRC16_POLY 0x1021
#define CRC16_INIT 0xFFFF

int main() {
    void *in_map = MAP_BY_FD(0), *out_map = MAP_BY_FD(1);
    void *result;

    volatile int payload[PAYLOAD_LEN];
    volatile unsigned int crc = CRC16_INIT;

    struct bpf_iter_num it;
    long long *i;

    // Read telemetry payload words
    bpf_iter_num_new(&it, 0, PAYLOAD_LEN);
    while ((i = bpf_iter_num_next(&it))) {
        result = bpf_map_lookup_elem(in_map, i);
        payload[*i] = *(int*)result;
    }
    bpf_iter_num_destroy(&it);

    // Bit-by-bit CRC-16/CCITT-FALSE over the payload octets (MSB-first).
    // Flattened into a single PAYLOAD_LEN*4*8-iteration loop (byte_idx/bit_idx
    // derived from the flat index) instead of a byte loop nesting a bit loop:
    // this target's runtime-verifier can't analyze nested bpf_iter_num loops.
    struct bpf_iter_num ib;
    long long *b;

    bpf_iter_num_new(&ib, 0, PAYLOAD_LEN * 4 * 8);
    while ((b = bpf_iter_num_next(&ib))) {
        unsigned int byte_idx = (unsigned int)(*b / 8);
        unsigned int bit_idx = (unsigned int)(*b % 8);

        if (bit_idx == 0) {
            unsigned int word = (unsigned int)payload[byte_idx / 4];
            unsigned int shift = 24 - (byte_idx % 4) * 8;
            unsigned int byte = (word >> shift) & 0xFF;
            crc ^= (byte << 8);
        }

        if (crc & 0x8000)
            crc = (crc << 1) ^ CRC16_POLY;
        else
            crc = crc << 1;
        crc &= 0xFFFF;
    }
    bpf_iter_num_destroy(&ib);

    // Build CCSDS primary header (first payload word doubles as a pseudo
    // sequence counter so the header varies with the input like a real
    // packet stream would).
    unsigned int seq_count = (unsigned int)payload[0] & 0x3FFF;
    unsigned int hdr_word1 = ((unsigned int)CCSDS_VERSION << 13) |
                              ((unsigned int)CCSDS_TYPE << 12) |
                              ((unsigned int)CCSDS_SEC_HDR_FLAG << 11) |
                              ((unsigned int)CCSDS_APID & 0x7FF);
    unsigned int hdr_word2 = ((unsigned int)CCSDS_SEQ_FLAGS << 14) | seq_count;
    unsigned int hdr_word3 = (unsigned int)(PAYLOAD_LEN * 4 - 1);

    int key, val;

    key = 0; val = (int)hdr_word1; bpf_map_update_elem(out_map, &key, &val, 0);
    key = 1; val = (int)hdr_word2; bpf_map_update_elem(out_map, &key, &val, 0);
    key = 2; val = (int)hdr_word3; bpf_map_update_elem(out_map, &key, &val, 0);

    // Passthrough the payload after the header
    struct bpf_iter_num iw;
    long long *w;
    bpf_iter_num_new(&iw, 0, PAYLOAD_LEN);
    while ((w = bpf_iter_num_next(&iw))) {
        key = 3 + (int)*w;
        val = payload[*w];
        bpf_map_update_elem(out_map, &key, &val, 0);
    }
    bpf_iter_num_destroy(&iw);

    // Append the CRC
    key = 3 + PAYLOAD_LEN;
    val = (int)crc;
    bpf_map_update_elem(out_map, &key, &val, 0);

    return 0;
}
