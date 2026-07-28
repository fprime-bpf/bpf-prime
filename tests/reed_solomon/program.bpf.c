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
// Map layout (fds match the shared benchmark harness's allocation in
// Components/Tests/testsWrappers.cpp -- fds 0-14 are claimed by the other
// benchmarks, and ccsds claims 15-16, so this one starts at 17):
//   fd 17: K entries, int (low byte used) -- input data symbols
//   fd 18: NPAR entries, int             -- output parity symbols

#include "../bpf_shim.h"

#define GF_SIZE 256
#define GF_POLY 0x11d
#define K 16
#define NPAR 4

int main() {
    void *in_map = MAP_BY_FD(17), *out_map = MAP_BY_FD(18);
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
        // Branch-free field-polynomial reduction, same trick as the CCSDS
        // CRC step: even though x is fully determined by the iteration
        // count (no message data involved), 255 back-to-back data-shaped
        // `if`s here turned out to still be a major source of DFS forking
        // in practice, not just the message-dependent checks below.
        unsigned int reduce_mask = 0u - ((x >> 8) & 1u);
        x ^= (GF_POLY & reduce_mask);
    }
    bpf_iter_num_destroy(&it);

    bpf_iter_num_new(&it, GF_SIZE - 1, GF_SIZE * 2 - 1);
    while ((i = bpf_iter_num_next(&it))) {
        gfexp[*i] = gfexp[*i - (GF_SIZE - 1)];
    }
    bpf_iter_num_destroy(&it);

    // Build the generator polynomial g(x) = (x + a^0)(x + a^1)...(x + a^(NPAR-1)),
    // stored low-degree-first: genpoly[0] is the constant term, genpoly[NPAR]
    // is the (monic) leading term. NPAR is a small compile-time constant,
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

    // Systematic encode via polynomial long division (LFSR form): one
    // coefficient read per message symbol
    // (buf[ii], AFTER any mutations earlier message symbols already made to
    // it -- this is a genuine LFSR carry-propagation dependency, not just a
    // convenience read), reused across the NPAR+1 generator-coefficient
    // steps for that symbol. Flattened into a single ii/jj loop, jj still
    // reaches 0 first for each ii (bpf_iter_num_next visits the flat index
    // in increasing order, so ii=k/(NPAR+1) is non-decreasing and jj=0 is
    // the first sub-step of each ii block) -- so capture coef there and hold
    // it for the rest of that ii's block, instead of re-reading buf[ii] on
    // every jj, which would pick up that same block's own jj=0 write (the
    // monic leading-term cancellation always zeroes buf[ii] first) and
    // silently drop every later generator-coefficient contribution for that
    // symbol. This target's runtime-verifier can't analyze nested
    // bpf_iter_num loops, hence the flattening.
    unsigned char coef = 0;
    bpf_iter_num_new(&it, 0, K * (NPAR + 1));
    while ((i = bpf_iter_num_next(&it))) {
        unsigned long long ii = (unsigned long long)*i / (NPAR + 1);
        unsigned long long jj = (unsigned long long)*i % (NPAR + 1);

        if (jj == 0)
            coef = buf[ii];

        unsigned char g = genpoly[NPAR - jj];

        // Both "coef != 0" and "g != 0" gate this contribution; coef comes
        // from the (arbitrary, symbolic) message data so it can't resolve
        // to a single concrete path, and in practice g didn't reliably
        // either (its value threads back through several array
        // reads/writes the runtime-verifier apparently doesn't fully
        // concretize). Make both branch-free instead of nesting `if`s, so
        // the DFS never forks on this at all: nz_mask is 0xFFFFFFFF when
        // the byte is nonzero, else 0 (sign-bit trick: negating a nonzero
        // byte sets the sign bit of its OR with the original, so an
        // arithmetic right shift by 31 sign-extends to all-ones; zero
        // keeps both sides zero). gflog[0] is never written (log(0) is
        // undefined) so this can read stack garbage when coef or g is 0,
        // but that's safe: the mask zeroes the whole contribution before
        // it's XORed in.
        int coef_signed = (int)coef;
        unsigned int coef_nz_mask = (unsigned int)((coef_signed | -coef_signed) >> 31);
        int g_signed = (int)g;
        unsigned int g_nz_mask = (unsigned int)((g_signed | -g_signed) >> 31);
        unsigned int nz_mask = coef_nz_mask & g_nz_mask;

        long long idx = ii + jj;
        unsigned char contribution = gfexp[gflog[g] + gflog[coef]];
        buf[idx] ^= (unsigned char)(contribution & nz_mask);
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
