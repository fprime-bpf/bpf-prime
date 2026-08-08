#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unordered_map>
#include "Components/BpfSequencer/maps/shared_mutex.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

/*
 * Merged NOEL-V instruction/pipeline latency sweep -- combines what were
 * previously four separate binaries (div_latency_test.c,
 * pipeline_latency_test.c, lddw_latency_test.cpp, map_helper_latency_test.cpp)
 * into one, so a single run on the board covers everything. Each original
 * file's logic is now its own run_*() section below, called in sequence
 * from main(). See each section's header comment for the rationale specific
 * to that measurement (moved over unchanged from the original files).
 *
 * All integer/FP .rept blocks read from FIXED, never-overwritten operand
 * registers across the whole block -- chaining the result back into the
 * operand register lets it collapse toward a degenerate value (e.g. 0 for
 * a dividend, which short-circuits div64.vhd's divider immediately),
 * silently measuring the cheapest case instead of steady-state latency.
 * The functional units involved aren't fully pipelined on this core, so
 * back-to-back independent ops still serialize -- this measures true
 * per-op latency, not throughput inflated by overlap.
 */

static inline uint64_t rdcycle(void) {
    uint64_t c;
    asm volatile("rdcycle %0" : "=r"(c));
    return c;
}

static void report(const char *name, uint64_t cyc, int reps) {
    printf("%-40s: %10lu cyc / %-6d = %8.2f cycles/op\n",
           name, (unsigned long)cyc, reps, (double)cyc / reps);
}

/* ===================== 1. DIV/MOD (div_latency_test.c) ===================== */

/* div64.vhd (lib/gaisler/noelv/core/div64.vhd) is an SRT-style divider that
 * finds each operand's leading-one bit (firstone()) and only iterates
 * (leading-one(dividend) - leading-one(divisor)) steps -- latency is
 * data-dependent, not fixed. This measures how far apart the best case
 * (operands the same magnitude, ~0 iterations) and worst case (huge
 * dividend / divisor=1, near-maximal iterations) actually are. */
#define MEASURE_DIV(name, insn, dividend_val, divisor_val, reps)            \
do {                                                                        \
    register uint64_t rd asm("a0") = (uint64_t)(dividend_val);             \
    register uint64_t rs asm("a1") = (uint64_t)(divisor_val);              \
    uint64_t start, end;                                                   \
    asm volatile(                                                          \
        "fence\n"                                                         \
        "rdcycle %[start]\n"                                              \
        ".rept " #reps "\n"                                               \
        insn " a2, %[a0], %[a1]\n"                                        \
        ".endr\n"                                                         \
        "rdcycle %[end]\n"                                                \
        : [start] "=&r"(start), [end] "=&r"(end)                          \
        : [a0] "r"(rd), [a1] "r"(rs)                                      \
        : "a2"                                                            \
    );                                                                     \
    report(name, end - start, reps);                                       \
} while (0)

static void run_div_tests(void) {
    printf("=== 1. DIV/MOD latency vs. operand bit pattern ===\n\n");

    printf("--- divu/remu (64-bit) ---\n");
    MEASURE_DIV("divu best  (1/1)",         "divu", 1ULL, 1ULL, 500);
    MEASURE_DIV("divu best  (eq magnitude)","divu", 0x8000000000000000ULL, 0x8000000000000000ULL, 500);
    MEASURE_DIV("divu typical (1e6/7)",     "divu", 1000000ULL, 7ULL, 500);
    MEASURE_DIV("divu worst (~2^64 / 1)",   "divu", 0xFFFFFFFFFFFFFFFFULL, 1ULL, 500);
    MEASURE_DIV("remu worst (~2^64 / 1)",   "remu", 0xFFFFFFFFFFFFFFFFULL, 1ULL, 500);

    printf("\n--- divuw/remuw (32-bit) ---\n");
    MEASURE_DIV("divuw best  (1/1)",        "divuw", 1ULL, 1ULL, 500);
    MEASURE_DIV("divuw best  (eq magnitude)","divuw", 0x80000000ULL, 0x80000000ULL, 500);
    MEASURE_DIV("divuw typical (1e6/7)",    "divuw", 1000000ULL, 7ULL, 500);
    MEASURE_DIV("divuw worst (~2^32 / 1)",  "divuw", 0xFFFFFFFFULL, 1ULL, 500);
    MEASURE_DIV("remuw worst (~2^32 / 1)",  "remuw", 0xFFFFFFFFULL, 1ULL, 500);

    printf("\n--- div/rem (64-bit signed) ---\n");
    MEASURE_DIV("div worst (-1 / 1)",       "div", 0xFFFFFFFFFFFFFFFFULL /* -1 */, 1ULL, 500);
    MEASURE_DIV("div worst (INT64_MIN/1)",  "div", 0x8000000000000000ULL, 1ULL, 500);
}

/* ================ 2. Pipeline sweep (pipeline_latency_test.c) ================ */

/* Generic integer op: a2 = insn(a0, a1), unrolled `reps` times, a0/a1 never
 * touched -- isolates true per-op latency on this in-order core, since
 * back-to-back independent ops still serialize on a busy functional unit. */
#define MEASURE_IOP(name, insn, opa, opb, reps)                             \
do {                                                                        \
    register uint64_t ra asm("a0") = (uint64_t)(opa);                      \
    register uint64_t rb asm("a1") = (uint64_t)(opb);                      \
    uint64_t start, end;                                                   \
    asm volatile(                                                          \
        "fence\n"                                                         \
        "rdcycle %[start]\n"                                              \
        ".rept " #reps "\n"                                               \
        insn " a2, %[a0], %[a1]\n"                                        \
        ".endr\n"                                                         \
        "rdcycle %[end]\n"                                                \
        : [start] "=&r"(start), [end] "=&r"(end)                          \
        : [a0] "r"(ra), [a1] "r"(rb)                                      \
        : "a2"                                                            \
    );                                                                     \
    report(name, end - start, reps);                                       \
} while (0)

/* Same idea for double-precision FP ops. */
#define MEASURE_FOP(name, insn, opa, opb, reps)                             \
do {                                                                        \
    register double fa asm("fa0") = (opa);                                 \
    register double fb asm("fa1") = (opb);                                 \
    uint64_t start, end;                                                   \
    asm volatile(                                                          \
        "fence\n"                                                         \
        "rdcycle %[start]\n"                                              \
        ".rept " #reps "\n"                                               \
        insn " fa2, %[a0], %[a1]\n"                                       \
        ".endr\n"                                                         \
        "rdcycle %[end]\n"                                                \
        : [start] "=&r"(start), [end] "=&r"(end)                          \
        : [a0] "f"(fa), [a1] "f"(fb)                                      \
        : "fa2"                                                           \
    );                                                                     \
    report(name, end - start, reps);                                       \
} while (0)

/* Single-precision counterpart. noelv.py's FADD/FSUB/FMUL/FDIV/FNEG/FMOV
 * overrides currently give the 32-bit (single) and 64-bit (double) variant
 * of every float op the exact same cost -- but nanofpunv.vhd's FADD/FSUB
 * state machine is a bit-serial mantissa loop (nf_div4/nf_div5-style), and
 * single precision has less than half the mantissa bits of double (24 vs
 * 53), so it should need meaningfully fewer iterations, not an identical
 * cost. This has never been measured on real hardware at all -- only the
 * double-precision case was (MEASURE_FOP above). */
#define MEASURE_FOP_S(name, insn, opa, opb, reps)                           \
do {                                                                        \
    register float fa asm("fa0") = (opa);                                  \
    register float fb asm("fa1") = (opb);                                  \
    uint64_t start, end;                                                   \
    asm volatile(                                                          \
        "fence\n"                                                         \
        "rdcycle %[start]\n"                                              \
        ".rept " #reps "\n"                                               \
        insn " fa2, %[a0], %[a1]\n"                                       \
        ".endr\n"                                                         \
        "rdcycle %[end]\n"                                                \
        : [start] "=&r"(start), [end] "=&r"(end)                          \
        : [a0] "f"(fa), [a1] "f"(fb)                                      \
        : "fa2"                                                           \
    );                                                                     \
    report(name, end - start, reps);                                       \
} while (0)

/* Helper-call proxy: called through a volatile function pointer so the
 * compiler can't inline/devirtualize it -- forces a real jalr/ret, same
 * shape as the BPF interpreter's helper dispatch. NOTE: this only measures
 * native call+return latency, not the full helper marshaling cost inside
 * BpfSequencer -- that's what section 4 (map helpers) actually measures. */
__attribute__((noinline)) static uint64_t helper_noop(uint64_t x) {
    return x + 1;
}
static uint64_t (*volatile helper_ptr)(uint64_t) = helper_noop;

static void run_pipeline_tests(void) {
    printf("\n\n=== 2. Pipeline latency sweep ===\n\n");

    /* FADD/FSUB: alignment shift + post-cancellation renorm.
     * nanofpunv.vhd's nf_addsub* states hit the same OPACT_SHFTN
     * data-dependent shift-count path as div's OPACT_SHFTN before nf_div4.
     * "normal" = ordinary operands, no cancellation/denorm.
     * "cancel" = 1.0 - (largest double below 1.0): maximal leading-zero
     *   cancellation, forces the biggest possible renormalization shift.
     * "subnorm" = one operand is the smallest positive subnormal double,
     *   forcing the is_normal()-gated renormalization path to actually run. */
    printf("--- FADD/FSUB (double) ---\n");
    MEASURE_FOP("fadd.d normal (1.5+2.5)",   "fadd.d", 1.5, 2.5, 500);
    MEASURE_FOP("fsub.d normal (2.5-1.5)",   "fsub.d", 2.5, 1.5, 500);
    MEASURE_FOP("fsub.d cancel (1.0-~1.0)",  "fsub.d", 1.0, 0x1.fffffffffffffp-1, 500);
    MEASURE_FOP("fadd.d subnorm (+DBL_TRUE_MIN)", "fadd.d", 1.0, 5e-324, 500);

    /* Single-precision counterpart -- same operand shapes (normal/cancel/
     * subnorm), never measured before. Compare directly against the
     * double-precision numbers above to see whether FADD_X/FSUB_X really
     * should differ from FADD64_X/FSUB64_X. */
    printf("\n--- FADD/FSUB (single) ---\n");
    MEASURE_FOP_S("fadd.s normal (1.5+2.5)",   "fadd.s", 1.5f, 2.5f, 500);
    MEASURE_FOP_S("fsub.s normal (2.5-1.5)",   "fsub.s", 2.5f, 1.5f, 500);
    MEASURE_FOP_S("fsub.s cancel (1.0-~1.0)",  "fsub.s", 1.0f, 0x1.fffffep-1f, 500);
    MEASURE_FOP_S("fadd.s subnorm (+FLT_TRUE_MIN)", "fadd.s", 1.0f, 1e-45f, 500);

    printf("\n--- Helper-call proxy (native jalr/ret only) ---\n");
    {
        uint64_t start, end, sink = 0;
        int n = 2000;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++) {
            sink = helper_ptr(sink);
        }
        asm volatile("rdcycle %0" : "=r"(end));
        report("call+ret (volatile fn ptr)", end - start, n);
        if (sink == 0xdeadbeef) printf("(unreachable, keeps sink live)\n");
    }

    /* MUL/MUL64 sanity check: mul64.vhd is `v.ready := '1'` always (fixed
     * 2-stage pipeline), so this is expected to be near-constant regardless
     * of operand magnitude -- confirming the model's flat-constant *shape*
     * is correct here, unlike DIV. */
    printf("\n--- MUL/MUL64 (expect ~constant across operands) ---\n");
    MEASURE_IOP("mul small (3*4)",     "mul",  3ULL, 4ULL, 500);
    MEASURE_IOP("mul large (2^63-ish)","mul",  0x7FFFFFFFFFFFFFFFULL, 0x7FFFFFFFFFFFFFFFULL, 500);
    MEASURE_IOP("mulh large",          "mulh", 0x7FFFFFFFFFFFFFFFULL, 0x7FFFFFFFFFFFFFFFULL, 500);
    MEASURE_IOP("mulw small (3*4)",    "mulw", 3ULL, 4ULL, 500);
    MEASURE_IOP("mulw large",          "mulw", 0x7FFFFFFFULL, 0x7FFFFFFFULL, 500);

    /* Branch taken vs. not-taken: the model charges one cost per branch
     * opcode with no taken/not-taken split; check whether that's actually
     * two different costs. */
    printf("\n--- Branch ---\n");
    {
        uint64_t start, end;
        int n = 10000;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            asm volatile("beq zero, zero, 1f\n" "1:\n");
        asm volatile("rdcycle %0" : "=r"(end));
        report("beq (always taken)", end - start, n);

        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            asm volatile("bne zero, zero, 1f\n" "1:\n");
        asm volatile("rdcycle %0" : "=r"(end));
        report("bne (never taken)", end - start, n);

        /* JA: eBPF's unconditional jump -- only conditional branches were
         * measured above. */
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            asm volatile("j 1f\n" "1:\n");
        asm volatile("rdcycle %0" : "=r"(end));
        report("j (unconditional, JA)", end - start, n);
    }

    /* Immediate-operand ALU (_K variants): MEASURE_IOP above only used
     * register-register (_X-shape) forms. The _K variants need the
     * immediate materialized first: addi covers small (fits in 12 bits)
     * immediates in one instruction, but eBPF K-immediates are 32-bit, so a
     * large constant needs a real li (lui+addi) sequence -- never measured
     * separately from the ALU op itself. */
    printf("\n--- Immediate-operand ALU (_K shape) ---\n");
    {
        register uint64_t ra asm("a0") = 5;
        uint64_t start, end;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            ".rept 500\n"
            "addi a2, %[a0], 7\n"  /* small imm, fits in 12 bits, one insn */
            ".endr\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end)
            : [a0] "r"(ra)
            : "a2"
        );
        report("addi (small imm, 1 insn)", end - start, 500);

        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            ".rept 500\n"
            "li a2, 305419896\n"   /* 0x12345678: needs lui+addi (2 insns) */
            "add a2, a2, %[a0]\n"
            ".endr\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end)
            : [a0] "r"(ra)
            : "a2"
        );
        report("li (32-bit const) + add", end - start, 500);
    }

    /* Float compare-and-branch (JFULE_X shape): RISC-V has no fused
     * FP-compare-and-branch: eBPF's JFULE_X compiles to an fle.s (or
     * similar) producing 0/1 in an integer register, then a separate
     * bnez/beqz. JFULE_X's overridden cost (18 cycles) came from the
     * mechanical Polarfire->NOELV diff, never independently measured like
     * FADD/FSUB were -- measure the real compare+branch pair. */
    printf("\n--- Float compare-and-branch (JFULE_X shape) ---\n");
    {
        register float fa asm("fa0") = 1.5f;
        register float fb asm("fa1") = 2.5f;
        uint64_t start, end;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            ".rept 500\n"
            "fle.s a2, %[a0], %[a1]\n"
            "bnez a2, 1f\n"
            "1:\n"
            ".endr\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end)
            : [a0] "f"(fa), [a1] "f"(fb)
            : "a2"
        );
        report("fle.s + bnez (JFULE_X pair)", end - start, 500);
    }

    /* Simple ALU sanity check (expect ~1 cycle, low risk). */
    printf("\n--- Simple ALU ---\n");
    MEASURE_IOP("add", "add", 5ULL, 7ULL, 500);
    MEASURE_IOP("sub", "sub", 5ULL, 7ULL, 500);
    MEASURE_IOP("and", "and", 0xFF00FF00ULL, 0x0FF00FF0ULL, 500);
    MEASURE_IOP("or",  "or",  0xFF00FF00ULL, 0x0FF00FF0ULL, 500);
    MEASURE_IOP("xor", "xor", 0xFF00FF00ULL, 0x0FF00FF0ULL, 500);
    MEASURE_IOP("sll", "sll", 1ULL, 5ULL, 500);
    MEASURE_IOP("srl", "srl", 0xFF00000000000000ULL, 5ULL, 500);
    MEASURE_IOP("sra", "sra", 0xFF00000000000000ULL, 5ULL, 500);

    /* Memory hit vs. likely-miss. We don't have confirmed L1/L2 geometry
     * for this bitstream, so this isn't a precise per-tier split -- just a
     * coarse "definitely resident" (repeated access to one hot word) vs.
     * "definitely not resident" (16MB buffer, 4KB stride, one pass)
     * comparison to sanity-check l1_hit_cycles=13 and miss_cycles=300. */
    printf("\n--- Memory ---\n");
    {
        static volatile uint64_t hot = 42;
        uint64_t start, end, val;
        int n = 5000;
        val = hot;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++) val = *(volatile uint64_t *)&hot;
        asm volatile("rdcycle %0" : "=r"(end));
        report("ld hot word (resident)", end - start, n);
        (void)val;
    }
    {
        const int BIGBUF_BYTES = 16 * 1024 * 1024;
        const int STRIDE = 4096;
        volatile uint8_t *bigbuf = (volatile uint8_t *)malloc(BIGBUF_BYTES);
        memset((void *)bigbuf, 1, BIGBUF_BYTES);
        int n = BIGBUF_BYTES / STRIDE;
        uint64_t start, end, sum = 0;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++) sum += bigbuf[i * STRIDE];
        asm volatile("rdcycle %0" : "=r"(end));
        report("ld 4KB-stride sweep (likely miss)", end - start, n);
        free((void *)bigbuf);
        (void)sum;
    }

    /* Stores: isolated vs. back-to-back burst. cctrl5nv.vhd has a real
     * store buffer (`stbuffull` flag, with a documented "fast write path" /
     * "slow write path" split) -- an isolated store should be absorbed
     * cheaply without stalling the pipeline, but the buffer has finite
     * depth, so a sustained run of stores (exactly the adversarial case a
     * WCET bound has to cover) can fill it and stall. Same shape of
     * problem as DIV: not free, not one fixed number, state-dependent.
     * sd/sw/fsw == eBPF STX_DW/STX_W/FSTX_W. */
    printf("\n--- Store: isolated vs. burst ---\n");
    {
        static volatile uint64_t store_target_isolated;
        uint64_t start, end;
        int n = 5000;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            *(volatile uint64_t *)&store_target_isolated = (uint64_t)i;
        asm volatile("rdcycle %0" : "=r"(end));
        report("sd isolated (loop, buffer drains)", end - start, n);
    }
    {
        static uint64_t store_target_burst;
        register uint64_t addr asm("a0") = (uint64_t)&store_target_burst;
        register uint64_t val asm("a1") = 0x1122334455667788ULL;
        uint64_t start, end;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            ".rept 500\n"
            "sd %[val], 0(%[addr])\n"
            ".endr\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end)
            : [addr] "r"(addr), [val] "r"(val)
            : "memory"
        );
        report("sd burst (500 back-to-back, same addr)", end - start, 500);
    }
    {
        static uint32_t store_target_burst_w;
        register uint64_t addr asm("a0") = (uint64_t)&store_target_burst_w;
        register uint64_t val asm("a1") = 0x11223344ULL;
        uint64_t start, end;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            ".rept 500\n"
            "sw %[val], 0(%[addr])\n"
            ".endr\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end)
            : [addr] "r"(addr), [val] "r"(val)
            : "memory"
        );
        report("sw burst (500 back-to-back, same addr)", end - start, 500);
    }
    {
        static float store_target_burst_f;
        register uint64_t addr asm("a0") = (uint64_t)&store_target_burst_f;
        register float fval asm("fa0") = 3.5f;
        uint64_t start, end;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            ".rept 500\n"
            "fsw %[val], 0(%[addr])\n"
            ".endr\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end)
            : [addr] "r"(addr), [val] "f"(fval)
            : "memory"
        );
        report("fsw burst (500 back-to-back, same addr)", end - start, 500);
    }
}

/* ==================== 3. LDDW / map_by_fd (lddw_latency_test.cpp) ==================== */

/* eBPF's LDDW (64-bit immediate load) is charged as a flat instruction cost
 * in the model, but for map-pointer resolution (bpf_shim.h's MAP_BY_FD) it
 * isn't a simple constant materialization -- BpfSequencer.cpp wires it to
 * maps::map_by_fd (Components/BpfSequencer/maps/map_lddw_helpers.cpp), a
 * real function that does map_instances.find() followed by
 * map_instances[fd] -- two std::unordered_map<U32, map*> operations, not a
 * load. map_by_fd's real implementation is a *static* method reading
 * BpfSequencer's static `maps` instance, so exactly reproducing the call
 * would require linking the whole Component framework. Instead this
 * reproduces the identical operation shape -- the same container/key type
 * doing find()+operator[] -- since that's what actually drives the cost,
 * not BpfSequencer's class scaffolding around it. */
static void run_lddw_tests(void) {
    printf("\n\n=== 3. LDDW / map_by_fd proxy cost ===\n\n");

    std::unordered_map<uint32_t, void *> map_instances;
    // A handful of entries, matching this project's real map counts
    // (low_pass_filter uses fd 2 and 4; nothing here needs more than a
    // few live maps at once).
    for (uint32_t fd = 0; fd < 8; fd++) {
        map_instances[fd] = reinterpret_cast<void *>(0x1000 + fd);
    }

    const int n = 2000;
    volatile void *sink = nullptr;
    uint64_t start, end;

    // Reproduces map_by_fd's hit path exactly: find() then operator[].
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        uint32_t fd = 2;
        if (map_instances.find(fd) != map_instances.end()) {
            sink = map_instances[fd];
        }
    }
    end = rdcycle();
    report("unordered_map find()+[] (map_by_fd hit)", end - start, n);

    // Miss path: map_by_fd returns 0 immediately after find() fails,
    // skipping the second lookup -- cheaper, but worth confirming.
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        uint32_t fd = 999;
        if (map_instances.find(fd) != map_instances.end()) {
            sink = map_instances[fd];
        }
    }
    end = rdcycle();
    report("unordered_map find() only (map_by_fd miss)", end - start, n);

    (void)sink;
}

/* =============== 4. Map helper locks (map_helper_latency_test.cpp) =============== */

/* Measures the real cost of shared_mutex's lock_shared()/unlock_shared() and
 * lock_unique()/unlock_unique() -- what every bpf_map_lookup_elem/update_elem
 * call pays via maps/map_bpf_helpers.cpp -- on real NOEL-V hardware.
 *
 * shared_mutex.cpp shows each of the four operations does a FULL Os::Mutex
 * lock()+unlock() pair internally (lock_shared/unlock_shared are each their
 * own critical section, not one shared one), and unlock_shared()/
 * unlock_unique() additionally call condvar.notifyAll() when applicable.
 * So a single bpf_map_lookup_elem call = lock_shared() + unlock_shared() =
 * TWO full mutex lock/unlock pairs + one notifyAll(). This measures that
 * real, uncontended (single-thread, no waiters) cost directly, to compare
 * against the flat miss_cycles=300 the WCET model used to charge CALL_1/
 * CALL_2/CALL_3 (the map helper indices) before it got its own
 * map_lookup_cycles/map_update_cycles/map_delete_cycles fields. */
static void run_map_helper_tests(void) {
    printf("\n\n=== 4. shared_mutex (Os::Mutex-backed) real cost ===\n\n");

    shared_mutex m;
    const int n = 2000;
    uint64_t start, end;

    // lock_shared()+unlock_shared() together == the RAII pattern
    // bpf_map_lookup_elem actually uses (shared_lock ctor/dtor).
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        shared_lock lock(m);
    }
    end = rdcycle();
    report("shared_lock (lookup_elem's lock)", end - start, n);

    // lock_unique()+unlock_unique(): what bpf_map_update_elem/delete_elem use.
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        unique_lock lock(m);
    }
    end = rdcycle();
    report("unique_lock (update/delete_elem's lock)", end - start, n);
}

/* =============== 5. bpf_iter_num_new/_next/_destroy real cost =============== */

/* CALL_5/6/7 (bpf_iter_num_new/_next/_destroy) still use the flat
 * default_helper_call_cost guess -- unlike CALL_1/2/3 (map lookup/update),
 * which we've now measured directly. Components/BpfSequencer/
 * iter_bpf_helpers.cpp shows these are actually trivial: no mutex, no
 * container, just a few field reads/writes and a comparison (bpf_iter_num_
 * next is an increment, a bounds check, and a pointer-or-NULL return). So
 * unlike the map helpers, the hypothesis here is the opposite direction --
 * default_helper_call_cost=100 might be *too high* for these specifically,
 * since a generic call+ret (section 2's helper-call proxy) alone measured
 * only ~9 cycles. Measuring directly rather than assuming either way. */
static void run_iter_num_tests(void) {
    printf("\n\n=== 5. bpf_iter_num_new/_next/_destroy real cost ===\n\n");

    Components::BpfSequencer::bpf_iter_num it;
    const int n = 2000;
    uint64_t start, end;

    start = rdcycle();
    for (int i = 0; i < n; i++) {
        Components::BpfSequencer::bpf_iter_num_new(&it, 0, 7);
    }
    end = rdcycle();
    report("bpf_iter_num_new(0,7)", end - start, n);

    // Steady-state next(): huge range so it always returns non-NULL, same
    // as the common case inside a real bpf_iter_num_new/_next loop.
    Components::BpfSequencer::bpf_iter_num_new(&it, 0, 1000000000);
    volatile long long sink = 0;
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        I64 *r = Components::BpfSequencer::bpf_iter_num_next(&it);
        sink = *r;
    }
    end = rdcycle();
    report("bpf_iter_num_next (steady, non-NULL)", end - start, n);
    (void)sink;

    start = rdcycle();
    for (int i = 0; i < n; i++) {
        Components::BpfSequencer::bpf_iter_num_destroy(&it);
    }
    end = rdcycle();
    report("bpf_iter_num_destroy", end - start, n);
}

/* =============== 6. Branch: real loop-carried backward edge =============== */

/* Section 2's "--- Branch ---" test only measured a trivial, isolated,
 * always-taken-or-always-not-taken FORWARD hop (beq/bne zero,zero,1f with
 * "1:" immediately following) wrapped in a C for-loop -- that shape doesn't
 * match what JEQ_K/JNE_K actually look like in low_pass_filter's compiled
 * output. Decoding program.bpf.o directly: every bpf_iter_num_next() call
 * is followed by a JNE_K (K=0, i.e. "is result non-NULL?") that branches
 * BACKWARD to the top of the loop body when true, and falls through to a
 * JEQ_K (K=0) forward exit only once, on the final NULL iteration. In the
 * worst-case path this JNE_K is the single most common branch-classified
 * instruction (14 occurrences, vs. 2 for the exit JEQ_K) -- but the model's
 * JEQ_K=JNE_K=7 cost was carried over mechanically from PolarFire's original
 * base table, never measured against this actual backward-taken shape.
 *
 * This measures a real decrementing backward-branch loop: N-1 taken
 * iterations (mirrors the steady-state "next() returned non-NULL, continue"
 * case) plus exactly 1 not-taken iteration (mirrors the single loop-exit
 * check) -- the same "steady-state + one different final state" shape used
 * for the div/store/iter_num measurements above, instead of an artificial
 * always-one-way loop. */
static void run_branch_tests(void) {
    printf("\n\n=== 6. Branch: real loop-carried backward edge ===\n\n");

    /* addi + bnez, backward-branching loop: N-1 taken + 1 not-taken.
     * Isolate the branch's own contribution by comparing against the
     * standalone "addi" cost already measured in section 2's ALU sanity
     * check (both operate on registers only, no memory). */
    {
        uint64_t start, end;
        const long n = 10000;
        register long counter asm("a2") = n;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            "1:\n"
            "addi %[c], %[c], -1\n"
            "bnez %[c], 1b\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end), [c] "+&r"(counter)
            :
            :
        );
        report("addi+bnez backward loop ((N-1) taken + 1 not-taken)", end - start, n);
    }

    /* Same shape but with beqz (branches away/forward past the loop on
     * counter==0, i.e. how the JEQ_K exit check is actually shaped: taken
     * exactly once, on the very last iteration, matching the real N-1
     * skip + 1 taken pattern instead of section 2's always-taken case). */
    {
        uint64_t start, end;
        const long n = 10000;
        register long counter asm("a2") = n;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            "1:\n"
            "addi %[c], %[c], -1\n"
            "beqz %[c], 2f\n"
            "j 1b\n"
            "2:\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end), [c] "+&r"(counter)
            :
            :
        );
        report("addi+beqz/j (N-1 not-taken + 1 taken exit)", end - start, n);
    }

    /* Pure backward-taken cost with a longer, more realistic body between
     * the branch and its target (7 nops, roughly matching a filter
     * iteration's instruction count) -- checks whether branch cost depends
     * on target distance/instructions-in-flight, not just the branch
     * opcode itself. */
    {
        uint64_t start, end;
        const long n = 10000;
        register long counter asm("a2") = n;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            "1:\n"
            "nop\nnop\nnop\nnop\nnop\nnop\nnop\n"
            "addi %[c], %[c], -1\n"
            "bnez %[c], 1b\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end), [c] "+&r"(counter)
            :
            :
        );
        report("addi+bnez backward loop, 7-nop body", end - start, n);
    }
}

/* =============== 7. Cache latency sweep (L1/L2/miss geometry) =============== */

/* Section 2's "--- Memory ---" test only bracketed the extremes -- a single
 * always-resident hot word (definitely L1) vs. a 16MB/4KB-stride sweep
 * (definitely a miss) -- specifically because "we don't have confirmed
 * L1/L2 geometry for this bitstream" (see that section's comment). Neither
 * board's actual L1 size, L2 presence/size, or per-tier hit cost has ever
 * been measured; profiles/polarfire.py and profiles/noelv.py's
 * l1_hit_cycles/l2_hit_cycles/l3_hit_cycles/miss_cycles are inherited
 * guesses.
 *
 * This does a classic working-set-size sweep to find those tiers
 * empirically: pointer-chase a randomized cyclic permutation of 8-byte
 * slots confined to a buffer of size S, for a geometric range of S from 1KB
 * (definitely L1) to 16MB (definitely DRAM). Pointer-chasing (each load's
 * address depends on the previous load's *value*) defeats
 * prefetching/out-of-order overlap, so the result is a clean per-access
 * latency curve, not a throughput number. Where cycles/access jumps sharply
 * as S grows marks a real cache-tier boundary -- the plateau cost before
 * each jump is that tier's real hit cost.
 */
static void run_cache_sweep_tests(void) {
    printf("\n\n=== 7. Cache latency sweep (working-set size vs. cycles/access) ===\n\n");
    printf("%-10s %-16s\n", "size(B)", "cycles/access");

    static const size_t sizes[] = {
        1  * 1024,   2  * 1024,   4   * 1024,  8   * 1024,
        16 * 1024,   24 * 1024,   32  * 1024,  48  * 1024,
        64 * 1024,   96 * 1024,   128 * 1024,  192 * 1024,
        256 * 1024,  512 * 1024,
        1  * 1024 * 1024, 2 * 1024 * 1024, 4 * 1024 * 1024,
        8  * 1024 * 1024, 16 * 1024 * 1024,
    };

    for (size_t size : sizes) {
        size_t n = size / sizeof(void *);
        if (n < 2) continue;

        void **buf = (void **)malloc(size);
        size_t *idx = (size_t *)malloc(n * sizeof(size_t));
        for (size_t i = 0; i < n; i++) idx[i] = i;

        /* xorshift64 -- doesn't need to be cryptographic, just enough to
         * decorrelate access order from linear address order. */
        uint64_t rng = 0x9E3779B97F4A7C15ULL ^ (uint64_t)size;
        for (size_t i = n - 1; i > 0; i--) {
            rng ^= rng << 13; rng ^= rng >> 7; rng ^= rng << 17;
            size_t j = rng % (i + 1);
            size_t t = idx[i]; idx[i] = idx[j]; idx[j] = t;
        }
        for (size_t i = 0; i < n; i++)
            buf[idx[i]] = (void *)&buf[idx[(i + 1) % n]];

        /* Warm-up lap: touch every line once so the timed run measures
         * steady-state residency, not cold-start compulsory misses.
         *
         * `p` MUST be dereferenced through a volatile-qualified pointer type
         * (not just `volatile void *p`, which only makes the variable
         * itself volatile, not the memory it points to) -- otherwise -O3
         * can see the entire chase as a pure, side-effect-free computation
         * whose final result is discarded by `(void)p`, and is free to
         * delete the whole loop. That's exactly what happened on the first
         * hardware run: uniformly ~0.00 cycles/access at every size,
         * because the timed region between the two rdcycle asm blocks had
         * been optimized away to nothing. */
        void *p = buf[0];
        for (size_t i = 0; i < n; i++) p = *(void *volatile *)p;

        const int laps = 4;
        long iters = (long)n * laps;
        uint64_t start, end;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (long i = 0; i < iters; i++) p = *(void *volatile *)p;
        asm volatile("rdcycle %0" : "=r"(end));

        double cyc_per_access = (double)(end - start) / (double)iters;
        printf("%-10zu %-16.2f\n", size, cyc_per_access);

        (void)p;
        free(idx);
        free(buf);
    }
}

int main(void) {
    run_div_tests();
    run_pipeline_tests();
    run_lddw_tests();
    run_map_helper_tests();
    run_iter_num_tests();
    run_branch_tests();
    run_cache_sweep_tests();
    return 0;
}
