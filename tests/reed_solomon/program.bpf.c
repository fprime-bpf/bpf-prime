// Reed-Solomon systematic encoder benchmark (CCSDS-style downlink FEC).
//
// Table-driven: builds GF(2^8) log/antilog tables once, then reuses those
// same two fixed lookup tables across every symbol of both the generator
// polynomial construction and the encode pass -- exactly the
// persistence-across-loops / cache-reuse access pattern that a linear or
// blocked kernel (e.g. matmul) does not exercise.
//
// RS(K+NPAR, K) over GF(2^8) with field polynomial x^8+x^4+x^3+x^2+1
// (0x11D, the CCSDS/AES field polynomial).
//
// Map layout (fds are local to this VM slot):
//   fd 0: K entries, int (low byte used) -- input data symbols
//   fd 1: NPAR entries, int             -- output parity symbols

#include "../bpf_shim.h"

#define GF_SIZE 256
#define GF_POLY 0x11d
#define K 16
#define NPAR 4

int main() {
    void *in_map = MAP_BY_FD(0), *out_map = MAP_BY_FD(1);
    void *result;

    volatile unsigned char gflog[GF_SIZE];
    volatile unsigned char gfexp[GF_SIZE * 2];
    volatile unsigned char genpoly[NPAR + 1];
    volatile unsigned char buf[K + NPAR];

    struct bpf_iter_num it;
    long long *i;

    // Build GF(2^8) exp/log tables. gfexp is double-length so gf_mul below
    // never needs a modulo reduction, just a table lookup.
    unsigned int x = 1;
    bpf_iter_num_new(&it, 0, GF_SIZE - 1);
    while ((i = bpf_iter_num_next(&it))) {
        gfexp[*i] = (unsigned char)x;
        gflog[x] = (unsigned char)*i;
        x <<= 1;
        if (x & 0x100)
            x ^= GF_POLY;
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, GF_SIZE - 1, GF_SIZE * 2 - 1);
    while ((i = bpf_iter_num_next(&it))) {
        gfexp[*i] = gfexp[*i - (GF_SIZE - 1)];
    }
    bpf_iter_num_destroy(&it);

    // Build the generator polynomial g(x) = (x + a^0)(x + a^1)...(x + a^(NPAR-1)),
    // stored low-degree-first: genpoly[0] is the constant term, genpoly[NPAR]
    // is the (monic) leading term.
    genpoly[0] = 1;
    struct bpf_iter_num izero;
    long long *z;
    bpf_iter_num_new(&izero, 1, NPAR + 1);
    while ((z = bpf_iter_num_next(&izero))) genpoly[*z] = 0;
    bpf_iter_num_destroy(&izero);

    int deg = 0;
    bpf_iter_num_new(&it, 0, NPAR);
    while ((i = bpf_iter_num_next(&it))) {
        unsigned char root = gfexp[*i];

        // Multiply the running polynomial by (x + root) in place, walking
        // coefficients high-to-low so each update only reads not-yet-written
        // entries.
        struct bpf_iter_num ik;
        long long *kk;
        bpf_iter_num_new(&ik, 0, deg + 2);
        while ((kk = bpf_iter_num_next(&ik))) {
            long long kidx = (long long)(deg + 1) - *kk;
            unsigned char lo = (kidx >= 1) ? genpoly[kidx - 1] : 0;
            unsigned char hi = (kidx <= deg) ? genpoly[kidx] : 0;
            unsigned char prod = (hi != 0) ? gfexp[gflog[hi] + gflog[root]] : 0;
            genpoly[kidx] = lo ^ prod;
        }
        bpf_iter_num_destroy(&ik);

        deg = deg + 1;
    }
    bpf_iter_num_destroy(&it);

    // Load the message into a zero-padded work buffer [data | parity-region]
    bpf_iter_num_new(&it, 0, K);
    while ((i = bpf_iter_num_next(&it))) {
        result = bpf_map_lookup_elem(in_map, i);
        buf[*i] = (unsigned char)(*(int*)result & 0xFF);
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, K, K + NPAR);
    while ((i = bpf_iter_num_next(&it))) buf[*i] = 0;
    bpf_iter_num_destroy(&it);

    // Systematic encode via polynomial long division (LFSR form): for each
    // message symbol, cancel its leading term by XORing in a scaled copy of
    // the generator polynomial. gflog/gfexp are read on every inner step.
    bpf_iter_num_new(&it, 0, K);
    while ((i = bpf_iter_num_next(&it))) {
        unsigned char coef = buf[*i];

        if (coef != 0) {
            struct bpf_iter_num ij;
            long long *j;
            bpf_iter_num_new(&ij, 0, NPAR + 1);
            while ((j = bpf_iter_num_next(&ij))) {
                unsigned char g = genpoly[NPAR - *j];
                if (g != 0) {
                    long long idx = *i + *j;
                    buf[idx] ^= gfexp[gflog[g] + gflog[coef]];
                }
            }
            bpf_iter_num_destroy(&ij);
        }
    }
    bpf_iter_num_destroy(&it);

    // Write out the parity symbols
    struct bpf_iter_num iw;
    long long *w;
    bpf_iter_num_new(&iw, 0, NPAR);
    while ((w = bpf_iter_num_next(&iw))) {
        int key = (int)*w;
        int val = (int)buf[K + *w];
        bpf_map_update_elem(out_map, &key, &val, 0);
    }
    bpf_iter_num_destroy(&iw);

    return 0;
}
