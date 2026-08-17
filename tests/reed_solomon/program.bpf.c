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

    // kidx is fully determined by the (compile-time-unrolled) step index, so
    // hand-unrolling makes kidx>=1/kidx<=0 fold at compile time; hi is nonzero
    // only reads a genuinely dynamic byte when kidx==0, so nz_mask+OPT_BARRIER
    // (same reason as RS_STEP's, LLVM canonicalizes the branch-free trick back
    // into a select otherwise) is only needed there, but applied uniformly for
    // simplicity since the cost is negligible at this scale.
#define OPT_BARRIER(x) asm volatile("" : "+r"(x))
#define DEG_STEP(KIDX, DEG, ROOT) { \
        long long kidx = (KIDX); \
        unsigned char lo = (kidx >= 1) ? genpoly[kidx - 1] : 0; \
        unsigned char hi = (kidx <= (DEG)) ? genpoly[kidx] : 0; \
        int hi_signed = (int)hi; \
        int hi_or = hi_signed | -hi_signed; \
        OPT_BARRIER(hi_or); \
        unsigned int hi_nz_mask = (unsigned int)(hi_or >> 31); \
        unsigned char prod = gfexp[gflog[hi] + gflog[(ROOT)]] & hi_nz_mask; /* gflog[0] undefined but masked out when hi==0, same as RS_STEP */ \
        genpoly[kidx] = lo ^ prod; \
    }
    {
        // deg = 0
        unsigned char root = gfexp[0];
        DEG_STEP(1, 0, root)
        DEG_STEP(0, 0, root)
    }
    {
        // deg = 1
        unsigned char root = gfexp[1];
        DEG_STEP(2, 1, root)
        DEG_STEP(1, 1, root)
        DEG_STEP(0, 1, root)
    }
    {
        // deg = 2
        unsigned char root = gfexp[2];
        DEG_STEP(3, 2, root)
        DEG_STEP(2, 2, root)
        DEG_STEP(1, 2, root)
        DEG_STEP(0, 2, root)
    }
    {
        // deg = 3
        unsigned char root = gfexp[3];
        DEG_STEP(4, 3, root)
        DEG_STEP(3, 3, root)
        DEG_STEP(2, 3, root)
        DEG_STEP(1, 3, root)
        DEG_STEP(0, 3, root)
    }
#undef DEG_STEP
#undef OPT_BARRIER

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

    // Systematic encode via polynomial long division (LFSR form).
    // Outer ii via bpf_iter_num (K); jj hand-unrolled since NPAR is a compile-time constant, avoiding the runtime jj that forked the DFS.
    // OPT_BARRIER sits between the OR and the shift so LLVM can't fuse "OR-of-x-and-negx then ashr 31" back
    // into a select, which BPF has no cmov for and lowers as a real branch (also forked the DFS).
#define OPT_BARRIER(x) asm volatile("" : "+r"(x))
#define RS_STEP(JJ) { \
        unsigned char g = genpoly[NPAR - (JJ)]; \
        int coef_signed = (int)coef; \
        int coef_or = coef_signed | -coef_signed; \
        OPT_BARRIER(coef_or); \
        unsigned int coef_nz_mask = (unsigned int)(coef_or >> 31); \
        int g_signed = (int)g; \
        int g_or = g_signed | -g_signed; \
        OPT_BARRIER(g_or); \
        unsigned int g_nz_mask = (unsigned int)(g_or >> 31); \
        unsigned int nz_mask = coef_nz_mask & g_nz_mask; /* avoids reading gflog[0] (undefined) when coef or g is 0 */ \
        long long idx = ii + (JJ); \
        unsigned char contribution = gfexp[gflog[g] + gflog[coef]]; \
        buf[idx] ^= (unsigned char)(contribution & nz_mask); \
    }
    bpf_iter_num_new(&it, 0, K);
    while ((i = bpf_iter_num_next(&it))) {
        unsigned long long ii = (unsigned long long)*i;
        unsigned char coef = buf[ii]; // once per ii, before this ii's own RS_STEP writes below (LFSR carry dependency)
        RS_STEP(0) RS_STEP(1) RS_STEP(2) RS_STEP(3) RS_STEP(4)
    }
    bpf_iter_num_destroy(&it);
#undef RS_STEP
#undef OPT_BARRIER

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
