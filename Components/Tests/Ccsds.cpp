#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

#define PAYLOAD_LEN 16

#define CCSDS_VERSION       0
#define CCSDS_TYPE          0
#define CCSDS_SEC_HDR_FLAG  0
#define CCSDS_APID          0x123
#define CCSDS_SEQ_FLAGS     3

#define CRC16_POLY 0x1021
#define CRC16_INIT 0xFFFF

namespace Components {

namespace Ccsds {

int main() {
    void *in_map = (void*)maps::map_by_fd(15), *out_map = (void*)maps::map_by_fd(16), *result;

    int payload[PAYLOAD_LEN];
    unsigned int crc = CRC16_INIT;

    for (int i = 0; i < PAYLOAD_LEN; i++) {
        result = maps::bpf_map_lookup_elem(in_map, &i);
        payload[i] = *(int*)result;
    }

    for (int b = 0; b < PAYLOAD_LEN; b++) {
        unsigned int word = (unsigned int)payload[b];

        for (int byte_in_word = 0; byte_in_word < 4; byte_in_word++) {
            unsigned int shift = 24 - byte_in_word * 8;
            unsigned int byte = (word >> shift) & 0xFF;

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

    unsigned int seq_count = (unsigned int)payload[0] & 0x3FFF;
    unsigned int hdr_word1 = ((unsigned int)CCSDS_VERSION << 13) |
                              ((unsigned int)CCSDS_TYPE << 12) |
                              ((unsigned int)CCSDS_SEC_HDR_FLAG << 11) |
                              ((unsigned int)CCSDS_APID & 0x7FF);
    unsigned int hdr_word2 = ((unsigned int)CCSDS_SEQ_FLAGS << 14) | seq_count;
    unsigned int hdr_word3 = (unsigned int)(PAYLOAD_LEN * 4 - 1);

    int key, val;

    key = 0; val = (int)hdr_word1; maps::bpf_map_update_elem(out_map, &key, &val, 0);
    key = 1; val = (int)hdr_word2; maps::bpf_map_update_elem(out_map, &key, &val, 0);
    key = 2; val = (int)hdr_word3; maps::bpf_map_update_elem(out_map, &key, &val, 0);

    for (int w = 0; w < PAYLOAD_LEN; w++) {
        key = 3 + w;
        val = payload[w];
        maps::bpf_map_update_elem(out_map, &key, &val, 0);
    }

    key = 3 + PAYLOAD_LEN;
    val = (int)crc;
    maps::bpf_map_update_elem(out_map, &key, &val, 0);

    return 0;
}

} // namespace Ccsds

} // namespace Components
