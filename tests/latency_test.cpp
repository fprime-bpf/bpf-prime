#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <unordered_map>
#include "Components/BpfSequencer/maps/shared_mutex.hpp"

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

int main(void) {
    run_div_tests();
    run_pipeline_tests();
    run_lddw_tests();
    run_map_helper_tests();
    return 0;
}
