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
    // is the (monic) leading term. NPAR (4) is a small compile-time constant,
    // so the outer "multiply running polynomial by (x+root)" step is unrolled
    // by hand (deg=0..NPAR-1) instead of nesting a bpf_iter_num loop inside
    // another: this target's runtime-verifier can't analyze nested loops, and
    // NPAR never varies at runtime. Each inner loop still walks coefficients
    // high-to-low so it only ever reads not-yet-written entries.
    genpoly[0] = 1;
    struct bpf_iter_num izero;
    long long *z;
    bpf_iter_num_new(&izero, 1, NPAR + 1);
    while ((z = bpf_iter_num_next(&izero))) genpoly[*z] = 0;
    bpf_iter_num_destroy(&izero);

    {
        // deg = 0
        unsigned char root = gfexp[0];
        struct bpf_iter_num ik;
        long long *kk;
        bpf_iter_num_new(&ik, 0, 2);
        while ((kk = bpf_iter_num_next(&ik))) {
            long long kidx = 1 - *kk;
            unsigned char lo = (kidx >= 1) ? genpoly[kidx - 1] : 0;
            unsigned char hi = (kidx <= 0) ? genpoly[kidx] : 0;
            unsigned char prod = (hi != 0) ? gfexp[gflog[hi] + gflog[root]] : 0;
            genpoly[kidx] = lo ^ prod;
        }
        bpf_iter_num_destroy(&ik);
    }
    {
        // deg = 1
        unsigned char root = gfexp[1];
        struct bpf_iter_num ik;
        long long *kk;
        bpf_iter_num_new(&ik, 0, 3);
        while ((kk = bpf_iter_num_next(&ik))) {
            long long kidx = 2 - *kk;
            unsigned char lo = (kidx >= 1) ? genpoly[kidx - 1] : 0;
            unsigned char hi = (kidx <= 1) ? genpoly[kidx] : 0;
            unsigned char prod = (hi != 0) ? gfexp[gflog[hi] + gflog[root]] : 0;
            genpoly[kidx] = lo ^ prod;
        }
        bpf_iter_num_destroy(&ik);
    }
    {
        // deg = 2
        unsigned char root = gfexp[2];
        struct bpf_iter_num ik;
        long long *kk;
        bpf_iter_num_new(&ik, 0, 4);
        while ((kk = bpf_iter_num_next(&ik))) {
            long long kidx = 3 - *kk;
            unsigned char lo = (kidx >= 1) ? genpoly[kidx - 1] : 0;
            unsigned char hi = (kidx <= 2) ? genpoly[kidx] : 0;
            unsigned char prod = (hi != 0) ? gfexp[gflog[hi] + gflog[root]] : 0;
            genpoly[kidx] = lo ^ prod;
        }
        bpf_iter_num_destroy(&ik);
    }
    {
        // deg = 3
        unsigned char root = gfexp[3];
        struct bpf_iter_num ik;
        long long *kk;
        bpf_iter_num_new(&ik, 0, 5);
        while ((kk = bpf_iter_num_next(&ik))) {
            long long kidx = 4 - *kk;
            unsigned char lo = (kidx >= 1) ? genpoly[kidx - 1] : 0;
            unsigned char hi = (kidx <= 3) ? genpoly[kidx] : 0;
            unsigned char prod = (hi != 0) ? gfexp[gflog[hi] + gflog[root]] : 0;
            genpoly[kidx] = lo ^ prod;
        }
        bpf_iter_num_destroy(&ik);
    }

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

    // Snapshot the message symbols before encoding. The systematic encode
    // below is one bpf_iter_num_next() coefficient read per message symbol,
    // reused across NPAR+1 generator-coefficient steps; flattened into a
    // single loop those steps must all see that same original value, but
    // the first (jj=0) step zeroes buf[ii] as part of the polynomial-division
    // cancellation (monic leading term), so re-reading buf[ii] fresh on
    // every jj would silently lose the later contributions. This target's
    // runtime-verifier can't analyze nested bpf_iter_num loops, hence the
    // flattening; the snapshot is what keeps it equivalent to the original
    // nested form.
    volatile unsigned char msg_snapshot[K];
    bpf_iter_num_new(&it, 0, K);
    while ((i = bpf_iter_num_next(&it))) msg_snapshot[*i] = buf[*i];
    bpf_iter_num_destroy(&it);

    // Systematic encode via polynomial long division (LFSR form): for each
    // message symbol, cancel its leading term by XORing in a scaled copy of
    // the generator polynomial. gflog/gfexp are read on every inner step.
    bpf_iter_num_new(&it, 0, K * (NPAR + 1));
    while ((i = bpf_iter_num_next(&it))) {
        unsigned long long ii = (unsigned long long)*i / (NPAR + 1);
        unsigned long long jj = (unsigned long long)*i % (NPAR + 1);

        unsigned char coef = msg_snapshot[ii];
        if (coef != 0) {
            unsigned char g = genpoly[NPAR - jj];
            if (g != 0) {
                long long idx = ii + jj;
                buf[idx] ^= gfexp[gflog[g] + gflog[coef]];
            }
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
