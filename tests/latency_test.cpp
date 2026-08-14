#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <sys/mman.h>
#include <unordered_map>
#include "Components/BpfSequencer/maps/shared_mutex.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"

// NOEL-V latency sweep merging 4 old binaries; see each run_*() for rationale.
// All .rept blocks read fixed operand registers, never the result, to avoid
// collapsing toward a degenerate (cheap) case and to measure true per-op cost.

static inline uint64_t rdcycle(void) {
    uint64_t c;
    asm volatile("rdcycle %0" : "=r"(c));
    return c;
}

static void report(const char *name, uint64_t cyc, int reps) {
    printf("%-40s: %10lu cyc / %-6d = %8.2f cycles/op\n",
           name, (unsigned long)cyc, reps, (double)cyc / reps);
}

// === 1. DIV/MOD ===

// SRT divider, data-dependent latency; measures best- vs worst-case iterations.
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

// === 2. Pipeline sweep ===

// a2 = insn(a0, a1) x reps; isolates true per-op latency, no overlap.
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

// Same idea for double-precision FP ops.
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

// Single-precision counterpart; single-vs-double FADD/FSUB never measured yet.
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

// Single-operand double FP op (FNEG/FMOV): a0 unused, unlike MEASURE_FOP.
#define MEASURE_FOP1(name, insn, opa, reps)                                 \
do {                                                                        \
    register double fa asm("fa0") = (opa);                                 \
    uint64_t start, end;                                                   \
    asm volatile(                                                          \
        "fence\n"                                                         \
        "rdcycle %[start]\n"                                              \
        ".rept " #reps "\n"                                               \
        insn " fa2, %[a0]\n"                                              \
        ".endr\n"                                                         \
        "rdcycle %[end]\n"                                                \
        : [start] "=&r"(start), [end] "=&r"(end)                          \
        : [a0] "f"(fa)                                                    \
        : "fa2"                                                           \
    );                                                                     \
    report(name, end - start, reps);                                       \
} while (0)

// Single-precision counterpart to MEASURE_FOP1.
#define MEASURE_FOP1_S(name, insn, opa, reps)                               \
do {                                                                        \
    register float fa asm("fa0") = (opa);                                  \
    uint64_t start, end;                                                   \
    asm volatile(                                                          \
        "fence\n"                                                         \
        "rdcycle %[start]\n"                                              \
        ".rept " #reps "\n"                                               \
        insn " fa2, %[a0]\n"                                              \
        ".endr\n"                                                         \
        "rdcycle %[end]\n"                                                \
        : [start] "=&r"(start), [end] "=&r"(end)                          \
        : [a0] "f"(fa)                                                    \
        : "fa2"                                                           \
    );                                                                     \
    report(name, end - start, reps);                                       \
} while (0)

// Helper-call proxy: volatile fn ptr forces jalr/ret, native call+ret only.
__attribute__((noinline)) static uint64_t helper_noop(uint64_t x) {
    return x + 1;
}
static uint64_t (*volatile helper_ptr)(uint64_t) = helper_noop;

static void run_pipeline_tests(void) {
    printf("\n\n=== 2. Pipeline latency sweep ===\n\n");

    // FADD/FSUB shapes: normal, cancel (max leading-zero cancel), subnorm.
    printf("--- FADD/FSUB (double) ---\n");
    MEASURE_FOP("fadd.d normal (1.5+2.5)",   "fadd.d", 1.5, 2.5, 500);
    MEASURE_FOP("fsub.d normal (2.5-1.5)",   "fsub.d", 2.5, 1.5, 500);
    MEASURE_FOP("fsub.d cancel (1.0-~1.0)",  "fsub.d", 1.0, 0x1.fffffffffffffp-1, 500);
    MEASURE_FOP("fadd.d subnorm (+DBL_TRUE_MIN)", "fadd.d", 1.0, 5e-324, 500);

    // Single-precision counterpart, same operand shapes, never measured before.
    printf("\n--- FADD/FSUB (single) ---\n");
    MEASURE_FOP_S("fadd.s normal (1.5+2.5)",   "fadd.s", 1.5f, 2.5f, 500);
    MEASURE_FOP_S("fsub.s normal (2.5-1.5)",   "fsub.s", 2.5f, 1.5f, 500);
    MEASURE_FOP_S("fsub.s cancel (1.0-~1.0)",  "fsub.s", 1.0f, 0x1.fffffep-1f, 500);
    MEASURE_FOP_S("fadd.s subnorm (+FLT_TRUE_MIN)", "fadd.s", 1.0f, 1e-45f, 500);

    // FMUL/FDIV/FNEG/FMOV: never independently measured before this.
    printf("\n--- FMUL/FDIV (double) ---\n");
    MEASURE_FOP("fmul.d normal (1.5*2.5)",            "fmul.d", 1.5, 2.5, 500);
    MEASURE_FOP("fmul.d underflow (1e-160*1e-160)",   "fmul.d", 1e-160, 1e-160, 500);
    MEASURE_FOP("fdiv.d normal (2.5/1.5)",            "fdiv.d", 2.5, 1.5, 500);
    MEASURE_FOP("fdiv.d worst (1.0/3.0)",             "fdiv.d", 1.0, 3.0, 500);
    MEASURE_FOP("fdiv.d subnorm (DBL_TRUE_MIN/2.0)",  "fdiv.d", 5e-324, 2.0, 500);

    printf("\n--- FMUL/FDIV (single) ---\n");
    MEASURE_FOP_S("fmul.s normal (1.5*2.5)",              "fmul.s", 1.5f, 2.5f, 500);
    MEASURE_FOP_S("fmul.s underflow (1e-20f*1e-20f)",     "fmul.s", 1e-20f, 1e-20f, 500);
    MEASURE_FOP_S("fdiv.s normal (2.5/1.5)",              "fdiv.s", 2.5f, 1.5f, 500);
    MEASURE_FOP_S("fdiv.s worst (1.0/3.0)",               "fdiv.s", 1.0f, 3.0f, 500);
    MEASURE_FOP_S("fdiv.s subnorm (FLT_TRUE_MIN/2.0)",    "fdiv.s", 1e-45f, 2.0f, 500);

    printf("\n--- FNEG/FMOV (double) ---\n");
    MEASURE_FOP1("fneg.d normal (-1.5)", "fneg.d", 1.5, 500);
    MEASURE_FOP1("fmv.d normal (1.5)",   "fmv.d", 1.5, 500);

    printf("\n--- FNEG/FMOV (single) ---\n");
    MEASURE_FOP1_S("fneg.s normal (-1.5)", "fneg.s", 1.5f, 500);
    MEASURE_FOP1_S("fmv.s normal (1.5)",   "fmv.s", 1.5f, 500);

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

    // MUL/MUL64 sanity check: fixed 2-stage pipeline, expect ~constant cost.
    printf("\n--- MUL/MUL64 (expect ~constant across operands) ---\n");
    MEASURE_IOP("mul small (3*4)",     "mul",  3ULL, 4ULL, 500);
    MEASURE_IOP("mul large (2^63-ish)","mul",  0x7FFFFFFFFFFFFFFFULL, 0x7FFFFFFFFFFFFFFFULL, 500);
    MEASURE_IOP("mulh large",          "mulh", 0x7FFFFFFFFFFFFFFFULL, 0x7FFFFFFFFFFFFFFFULL, 500);
    MEASURE_IOP("mulw small (3*4)",    "mulw", 3ULL, 4ULL, 500);
    MEASURE_IOP("mulw large",          "mulw", 0x7FFFFFFFULL, 0x7FFFFFFFULL, 500);

    // Branch taken vs. not-taken: model charges one cost regardless of that.
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

        // JA: eBPF's unconditional jump, not measured above.
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            asm volatile("j 1f\n" "1:\n");
        asm volatile("rdcycle %0" : "=r"(end));
        report("j (unconditional, JA)", end - start, n);
    }

    // _K needs li materialization first (32-bit K-imm vs 12-bit addi imm).
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

    // JFULE_X shape: fle.s+bnez pair; RISC-V has no fused FP compare-branch.
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

    // Simple ALU sanity check (expect ~1 cycle, low risk).
    printf("\n--- Simple ALU ---\n");
    MEASURE_IOP("add", "add", 5ULL, 7ULL, 500);
    MEASURE_IOP("sub", "sub", 5ULL, 7ULL, 500);
    MEASURE_IOP("and", "and", 0xFF00FF00ULL, 0x0FF00FF0ULL, 500);
    MEASURE_IOP("or",  "or",  0xFF00FF00ULL, 0x0FF00FF0ULL, 500);
    MEASURE_IOP("xor", "xor", 0xFF00FF00ULL, 0x0FF00FF0ULL, 500);
    MEASURE_IOP("sll", "sll", 1ULL, 5ULL, 500);
    MEASURE_IOP("srl", "srl", 0xFF00000000000000ULL, 5ULL, 500);
    MEASURE_IOP("sra", "sra", 0xFF00000000000000ULL, 5ULL, 500);

    // BPF ALU_X's dst-op=-src shape; add/and/or/xor/sub compress under RVC.
    printf("\n--- Simple ALU (compressed, BPF dst-op=-src shape) ---\n");
#define MEASURE_IOP2(name, insn, reps)                                     \
    do {                                                                   \
        register uint64_t ra asm("a0") = 5;                                \
        register uint64_t rb asm("a1") = 7;                                \
        uint64_t start, end;                                               \
        asm volatile(                                                      \
            "fence\n"                                                     \
            "rdcycle %[start]\n"                                          \
            ".rept " #reps "\n"                                           \
            insn " a0, a0, a1\n"                                          \
            ".endr\n"                                                     \
            "rdcycle %[end]\n"                                            \
            : [start] "=&r"(start), [end] "=&r"(end), "+r"(ra)             \
            : "r"(rb)                                                     \
        );                                                                 \
        report(name, end - start, reps);                                   \
    } while (0)

    MEASURE_IOP2("add (compressed, dependent)", "add", 500);
    MEASURE_IOP2("and (compressed, dependent)", "and", 500);
    MEASURE_IOP2("or  (compressed, dependent)", "or", 500);
    MEASURE_IOP2("xor (compressed, dependent)", "xor", 500);
    MEASURE_IOP2("sub (compressed, dependent)", "sub", 500);
    MEASURE_IOP2("sll (uncompressed, dependent)", "sll", 500);
    MEASURE_IOP2("srl (uncompressed, dependent)", "srl", 500);
    MEASURE_IOP2("sra (uncompressed, dependent)", "sra", 500);
#undef MEASURE_IOP2

    {
        register uint64_t ra asm("a0") = 5;
        register uint64_t rb asm("a1") = 7;
        uint64_t start, end;
        asm volatile(
            "fence\n"
            "rdcycle %[start]\n"
            ".option norvc\n"
            ".rept 500\n"
            "add a0, a0, a1\n"
            ".endr\n"
            ".option rvc\n"
            "rdcycle %[end]\n"
            : [start] "=&r"(start), [end] "=&r"(end), "+r"(ra)
            : "r"(rb)
        );
        report("add (forced uncompressed, dependent)", end - start, 500);
    }

    // Memory: resident hot word (L1) vs. 16MB/4KB-stride sweep (likely miss).
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

    // Stores: isolated (buffer drains) vs. burst (buffer can fill up).
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

// === 3. LDDW / map_by_fd ===

// LDDW is a flat cost, but map_by_fd is really 2 unordered_map ops (find+[]).
static void run_lddw_tests(void) {
    printf("\n\n=== 3. LDDW / map_by_fd proxy cost ===\n\n");

    std::unordered_map<uint32_t, void *> map_instances;
    // Matches this project's real map counts (a handful of live maps).
    for (uint32_t fd = 0; fd < 8; fd++) {
        map_instances[fd] = reinterpret_cast<void *>(0x1000 + fd);
    }

    const int n = 2000;
    volatile void *sink = nullptr;
    uint64_t start, end;

    // Reproduces map_by_fd's hit path: find() then operator[].
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        uint32_t fd = 2;
        if (map_instances.find(fd) != map_instances.end()) {
            sink = map_instances[fd];
        }
    }
    end = rdcycle();
    report("unordered_map find()+[] (map_by_fd hit)", end - start, n);

    // Miss path: map_by_fd returns early after find() fails.
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

// === 4. Map helper locks ===

// Real shared_lock/unique_lock cost via Os::Mutex; what map helpers pay.
static void run_map_helper_tests(void) {
    printf("\n\n=== 4. shared_mutex (Os::Mutex-backed) real cost ===\n\n");

    shared_mutex m;
    const int n = 2000;
    uint64_t start, end;

    // shared_lock ctor/dtor == what bpf_map_lookup_elem actually uses.
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        shared_lock lock(m);
    }
    end = rdcycle();
    report("shared_lock (lookup_elem's lock)", end - start, n);

    // unique_lock: what bpf_map_update_elem/delete_elem use.
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        unique_lock lock(m);
    }
    end = rdcycle();
    report("unique_lock (update/delete_elem's lock)", end - start, n);
}

// === 5. bpf_iter_num_new/_next/_destroy real cost ===

// Still uses the flat guess; likely too high given how trivial this is.
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

    // Huge range so next() always returns non-NULL, the common real case.
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

// === 6. Branch: real loop-carried backward edge ===

// Section 2 only measured a trivial forward hop; this is the real BPF shape.
static void run_branch_tests(void) {
    printf("\n\n=== 6. Branch: real loop-carried backward edge ===\n\n");

    // addi+bnez backward loop: N-1 taken + 1 not-taken; isolates branch cost.
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

    // beqz variant: matches JEQ_K exit shape, taken once on the last iteration.
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

    // Backward-taken cost with a 7-nop body; checks target-distance effects.
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

// === 7. Cache latency sweep (L1/L2/miss geometry) ===

// Working-set sweep to find L1/L2/miss tiers; 2MB pages isolate TLB confound.
enum class PageMode { HUGETLB, THP_REQUESTED, DEFAULT_4K, DEFAULT_4K_MMAP_FAILED };

struct PageAlloc {
    void *ptr;
    size_t mapped_size;      // 0 if this came from malloc, not mmap
    PageMode mode;
    int hugetlb_errno = 0;   // errno from the failed MAP_HUGETLB attempt
};

static const char *page_mode_label(const PageAlloc &a, char *buf, size_t buf_sz) {
    switch (a.mode) {
        case PageMode::HUGETLB:
            return "2MB hugetlbfs";
        case PageMode::THP_REQUESTED:
            snprintf(buf, buf_sz, "2MB THP-requested (best-effort, MAP_HUGETLB errno=%d %s)",
                     a.hugetlb_errno, strerror(a.hugetlb_errno));
            return buf;
        case PageMode::DEFAULT_4K:
            snprintf(buf, buf_sz, "4KB (MAP_HUGETLB errno=%d %s, madvise(MADV_HUGEPAGE) also failed)",
                     a.hugetlb_errno, strerror(a.hugetlb_errno));
            return buf;
        case PageMode::DEFAULT_4K_MMAP_FAILED:
            return "4KB (plain mmap failed too, malloc fallback)";
    }
    return "?";
}

static PageAlloc alloc_pages(size_t size, bool prefer_huge) {
    static const size_t HUGE_PAGE = 2 * 1024 * 1024;
    int huge_errno = 0;

    if (prefer_huge) {
        size_t huge_sz = (size + HUGE_PAGE - 1) & ~(HUGE_PAGE - 1);
        void *p = mmap(nullptr, huge_sz, PROT_READ | PROT_WRITE,
                        MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB, -1, 0);
        if (p != MAP_FAILED)
            return {p, huge_sz, PageMode::HUGETLB, 0};
        huge_errno = errno;
    }

    void *p = mmap(nullptr, size, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    if (p == MAP_FAILED)
        return {malloc(size), 0, PageMode::DEFAULT_4K_MMAP_FAILED, huge_errno};

    if (prefer_huge && madvise(p, size, MADV_HUGEPAGE) == 0)
        return {p, size, PageMode::THP_REQUESTED, huge_errno};

    return {p, size, PageMode::DEFAULT_4K, huge_errno};
}

static void free_pages(PageAlloc a) {
    if (a.mapped_size)
        munmap(a.ptr, a.mapped_size);
    else
        free(a.ptr);
}

static void run_cache_sweep(bool prefer_huge) {
    static const size_t sizes[] = {
        1  * 1024,   2  * 1024,   4   * 1024,  8   * 1024,
        16 * 1024,   24 * 1024,   32  * 1024,  48  * 1024,
        64 * 1024,   96 * 1024,   128 * 1024,  192 * 1024,
        256 * 1024,  512 * 1024,
        1  * 1024 * 1024, 2 * 1024 * 1024, 4 * 1024 * 1024,
        8  * 1024 * 1024, 16 * 1024 * 1024,
    };

    printf("%-10s %-16s %s\n", "size(B)", "cycles/access", "page mode");

    for (size_t size : sizes) {
        size_t n = size / sizeof(void *);
        if (n < 2) continue;

        PageAlloc alloc = alloc_pages(size, prefer_huge);
        void **buf = (void **)alloc.ptr;
        size_t *idx = (size_t *)malloc(n * sizeof(size_t));
        for (size_t i = 0; i < n; i++) idx[i] = i;

        // xorshift64: not cryptographic, just decorrelates access order.
        uint64_t rng = 0x9E3779B97F4A7C15ULL ^ (uint64_t)size;
        for (size_t i = n - 1; i > 0; i--) {
            rng ^= rng << 13; rng ^= rng >> 7; rng ^= rng << 17;
            size_t j = rng % (i + 1);
            size_t t = idx[i]; idx[i] = idx[j]; idx[j] = t;
        }
        for (size_t i = 0; i < n; i++)
            buf[idx[i]] = (void *)&buf[idx[(i + 1) % n]];

        // Warm-up lap; must use a volatile-qualified deref or -O3 deletes it.
        void *p = buf[0];
        for (size_t i = 0; i < n; i++) p = *(void *volatile *)p;

        const int laps = 4;
        long iters = (long)n * laps;
        uint64_t start, end;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (long i = 0; i < iters; i++) p = *(void *volatile *)p;
        asm volatile("rdcycle %0" : "=r"(end));

        double cyc_per_access = (double)(end - start) / (double)iters;
        char mode_buf[128];
        printf("%-10zu %-16.2f %s\n", size, cyc_per_access, page_mode_label(alloc, mode_buf, sizeof(mode_buf)));

        (void)p;
        free(idx);
        free_pages(alloc);
    }
}

static void run_cache_sweep_tests(void) {
    printf("\n\n=== 7. Cache latency sweep (working-set size vs. cycles/access) ===\n\n");

    printf("\n--- 4KB pages (original baseline, may show TLB confound) ---\n");
    run_cache_sweep(/*prefer_huge=*/false);

    printf("\n--- 2MB pages (isolates cache tiers from TLB reach) ---\n");
    run_cache_sweep(/*prefer_huge=*/true);
}

// === 8. bpf_math_sqrt/sin/cos/atan2 real cost ===

// CALL_9-12 use a flat guess; measuring real libm cost, in/out-of-range angle.
static void run_math_helper_tests(void) {
    printf("\n\n=== 8. bpf_math_sqrt/sin/cos/atan2 real cost ===\n\n");

    const int n = 2000;
    uint64_t start, end;
    volatile I32 sink = 0;

    auto f2i = [](F32 f) { return *reinterpret_cast<I32*>(&f); };

    I32 sqrt_arg = f2i(2.0f);
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        sink = Components::BpfSequencer::bpf_math_sqrt(sqrt_arg);
    }
    end = rdcycle();
    report("bpf_math_sqrt(2.0)", end - start, n);

    I32 sin_small = f2i(1.5f);
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        sink = Components::BpfSequencer::bpf_math_sin(sin_small);
    }
    end = rdcycle();
    report("bpf_math_sin(1.5, in-range)", end - start, n);

    I32 sin_large = f2i(403.0f);
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        sink = Components::BpfSequencer::bpf_math_sin(sin_large);
    }
    end = rdcycle();
    report("bpf_math_sin(403.0, out-of-range)", end - start, n);

    I32 cos_small = f2i(1.5f);
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        sink = Components::BpfSequencer::bpf_math_cos(cos_small);
    }
    end = rdcycle();
    report("bpf_math_cos(1.5, in-range)", end - start, n);

    I32 cos_large = f2i(403.0f);
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        sink = Components::BpfSequencer::bpf_math_cos(cos_large);
    }
    end = rdcycle();
    report("bpf_math_cos(403.0, out-of-range)", end - start, n);

    I32 atan2_y = f2i(1.5f), atan2_x = f2i(2.5f);
    start = rdcycle();
    for (int i = 0; i < n; i++) {
        sink = Components::BpfSequencer::bpf_math_atan2(atan2_y, atan2_x);
    }
    end = rdcycle();
    report("bpf_math_atan2(1.5, 2.5)", end - start, n);

    (void)sink;
}

int main(void) {
    run_div_tests();
    run_pipeline_tests();
    run_lddw_tests();
    run_map_helper_tests();
    run_iter_num_tests();
    run_branch_tests();
    run_cache_sweep_tests();
    run_math_helper_tests();
    return 0;
}
