// WASM counterpart of the reed_solomon BPF kernel. WASM execution doesn't
// go through the restricted BPF backend or the runtime-verifier, so this
// uses the natural (nested-loop, real-branch) algorithm shape directly
// instead of the flattened/branch-free rewrite the BPF version needed.

#include "../wasm_shim.h"

#define GF_SIZE 256
#define GF_POLY 0x11d
#define K 16
#define NPAR 4

int main() {
    uint64_t in_map = MAP_BY_FD(17), out_map = MAP_BY_FD(18);
    uint32_t result;

    uint8_t gflog[GF_SIZE];
    uint8_t gfexp[GF_SIZE * 2];
    uint8_t genpoly[NPAR + 1];
    uint8_t buf[K + NPAR];

    // Build GF(2^8) exp/log tables.
    uint32_t x = 1;
    for (int i = 0; i < GF_SIZE - 1; i++) {
        gfexp[i] = (uint8_t)x;
        gflog[x] = (uint8_t)i;
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
        uint8_t root = gfexp[i];

        for (int kk = deg + 1; kk >= 0; kk--) {
            uint8_t lo = (kk >= 1) ? genpoly[kk - 1] : 0;
            uint8_t hi = (kk <= deg) ? genpoly[kk] : 0;
            uint8_t prod = (hi != 0) ? gfexp[gflog[hi] + gflog[root]] : 0;
            genpoly[kk] = lo ^ prod;
        }

        deg = deg + 1;
    }

    // Load the message into a zero-padded work buffer [data | parity-region]
    for (int i = 0; i < K; i++) {
        result = bpf_map_lookup_elem(in_map, i);
        buf[i] = (uint8_t)(result & 0xFF);
    }
    for (int i = K; i < K + NPAR; i++) buf[i] = 0;

    // Systematic encode via polynomial long division (LFSR form).
    for (int i = 0; i < K; i++) {
        uint8_t coef = buf[i];

        if (coef != 0) {
            for (int j = 0; j < NPAR + 1; j++) {
                uint8_t g = genpoly[NPAR - j];
                if (g != 0) {
                    int idx = i + j;
                    buf[idx] ^= gfexp[gflog[g] + gflog[coef]];
                }
            }
        }
    }

    for (int w = 0; w < NPAR; w++) {
        bpf_map_update_elem(out_map, w, (uint32_t)buf[K + w], 0);
    }

    return 0;
}
