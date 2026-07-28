#include "NativeTests.hpp"
#include "Components/BpfSequencer/maps/maps.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

#define GF_SIZE 256
#define GF_POLY 0x11d
#define K 16
#define NPAR 4

namespace Components {

namespace ReedSolomon {

int main() {
    void *in_map = (void*)maps::map_by_fd(17), *out_map = (void*)maps::map_by_fd(18), *result;

    unsigned char gflog[GF_SIZE];
    unsigned char gfexp[GF_SIZE * 2];
    unsigned char genpoly[NPAR + 1];
    unsigned char buf[K + NPAR];

    // Build GF(2^8) exp/log tables.
    unsigned int x = 1;
    for (int i = 0; i < GF_SIZE - 1; i++) {
        gfexp[i] = (unsigned char)x;
        gflog[x] = (unsigned char)i;
        x <<= 1;
        if (x & 0x100)
            x ^= GF_POLY;
    }

    for (int i = GF_SIZE - 1; i < GF_SIZE * 2 - 1; i++) {
        gfexp[i] = gfexp[i - (GF_SIZE - 1)];
    }

    // Build the generator polynomial g(x) = (x + a^0)(x + a^1)...(x + a^(NPAR-1)).
    genpoly[0] = 1;
    for (int z = 1; z < NPAR + 1; z++) genpoly[z] = 0;

    int deg = 0;
    for (int i = 0; i < NPAR; i++) {
        unsigned char root = gfexp[i];

        for (int kk = deg + 1; kk >= 0; kk--) {
            unsigned char lo = (kk >= 1) ? genpoly[kk - 1] : 0;
            unsigned char hi = (kk <= deg) ? genpoly[kk] : 0;
            unsigned char prod = (hi != 0) ? gfexp[gflog[hi] + gflog[root]] : 0;
            genpoly[kk] = lo ^ prod;
        }

        deg = deg + 1;
    }

    // Load the message into a zero-padded work buffer [data | parity-region]
    for (int i = 0; i < K; i++) {
        result = maps::bpf_map_lookup_elem(in_map, &i);
        buf[i] = (unsigned char)(*(int*)result & 0xFF);
    }
    for (int i = K; i < K + NPAR; i++) buf[i] = 0;

    // Systematic encode via polynomial long division (LFSR form).
    for (int i = 0; i < K; i++) {
        unsigned char coef = buf[i];

        if (coef != 0) {
            for (int j = 0; j < NPAR + 1; j++) {
                unsigned char g = genpoly[NPAR - j];
                if (g != 0) {
                    int idx = i + j;
                    buf[idx] ^= gfexp[gflog[g] + gflog[coef]];
                }
            }
        }
    }

    for (int w = 0; w < NPAR; w++) {
        int key = w;
        int val = (int)buf[K + w];
        maps::bpf_map_update_elem(out_map, &key, &val, 0);
    }

    return 0;
}

} // namespace ReedSolomon

} // namespace Components
