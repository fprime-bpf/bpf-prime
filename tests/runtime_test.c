#include <stdint.h>
#include <stdio.h>

static inline uint64_t rdcycle(void) {
    uint64_t c;
    asm volatile("rdcycle %0" : "=r"(c));
    return c;
}

/* Measure latency: chain of dependent instructions */
#define MEASURE_LATENCY(name, insn, n)                          \
do {                                                            \
    register uint64_t r0 asm("a0") = 1;                         \
    register uint64_t r1 asm("a1") = 2;                         \
    uint64_t start, end;                                        \
    asm volatile("fence\n" "rdcycle %0" : "=r"(start));         \
    for (int _i = 0; _i < (n); _i++) {                          \
        asm volatile(insn : "+r"(r0) : "r"(r1));                \
    }                                                           \
    asm volatile("rdcycle %0" : "=r"(end));                     \
    printf("%-12s latency: %lu / %d = %.2f cycles\n",          \
           name, (end - start), n,                              \
           (double)(end - start) / (n));                        \
} while(0)

/* Measure throughput: independent instructions */
#define MEASURE_THROUGHPUT(name, insn, n)                        \
do {                                                            \
    register uint64_t r0 asm("a0") = 1;                         \
    register uint64_t r1 asm("a1") = 2;                         \
    register uint64_t r2 asm("a2") = 3;                         \
    register uint64_t r3 asm("a3") = 4;                         \
    register uint64_t r4 asm("a4") = 5;                         \
    register uint64_t r5 asm("a5") = 6;                         \
    uint64_t start, end;                                        \
    int total = (n) * 6;                                        \
    asm volatile("fence\n" "rdcycle %0" : "=r"(start));         \
    for (int _i = 0; _i < (n); _i++) {                          \
        asm volatile(insn : "+r"(r0) : "r"(r1));                \
        asm volatile(insn : "+r"(r2) : "r"(r3));                \
        asm volatile(insn : "+r"(r4) : "r"(r5));                \
        asm volatile(insn : "+r"(r1) : "r"(r0));                \
        asm volatile(insn : "+r"(r3) : "r"(r2));                \
        asm volatile(insn : "+r"(r5) : "r"(r4));                \
    }                                                           \
    asm volatile("rdcycle %0" : "=r"(end));                     \
    printf("%-12s throughput: %lu / %d = %.2f cyc/insn\n",     \
           name, (end - start), total,                          \
           (double)(end - start) / total);                      \
} while(0)

int main(void) {
    printf("NOEL-V Instruction Timing Measurements\n");
    printf("======================================\n\n");

    /* Integer ALU */
    printf("--- Integer ALU ---\n");
    MEASURE_LATENCY("add",    "add %0, %0, %1",   10000);
    MEASURE_LATENCY("sub",    "sub %0, %0, %1",   10000);
    MEASURE_LATENCY("and",    "and %0, %0, %1",   10000);
    MEASURE_LATENCY("or",     "or  %0, %0, %1",   10000);
    MEASURE_LATENCY("xor",    "xor %0, %0, %1",   10000);
    MEASURE_LATENCY("sll",    "sll %0, %0, %1",   10000);
    MEASURE_LATENCY("srl",    "srl %0, %0, %1",   10000);
    MEASURE_LATENCY("sra",    "sra %0, %0, %1",   10000);
    MEASURE_LATENCY("slt",    "slt %0, %0, %1",   10000);
    MEASURE_LATENCY("addi",   "addi %0, %0, 1",   10000);

    MEASURE_THROUGHPUT("add",  "add %0, %0, %1",  10000);

    /* Multiply/Divide */
    printf("\n--- Multiply/Divide ---\n");
    MEASURE_LATENCY("mul",    "mul    %0, %0, %1",  10000);
    MEASURE_LATENCY("mulh",   "mulh   %0, %0, %1",  10000);
    MEASURE_LATENCY("mulw",   "mulw   %0, %0, %1",  10000);
    MEASURE_LATENCY("div",    "div    %0, %0, %1",  1000);
    MEASURE_LATENCY("divu",   "divu   %0, %0, %1",  1000);
    MEASURE_LATENCY("rem",    "rem    %0, %0, %1",  1000);
    MEASURE_LATENCY("divw",   "divw   %0, %0, %1",  1000);

    /* Bit manipulation (Zba/Zbb/Zbs) */
    /*printf("\n--- Bit Manipulation ---\n");
    MEASURE_LATENCY("sh1add", "sh1add %0, %0, %1",  10000);
    MEASURE_LATENCY("sh2add", "sh2add %0, %0, %1",  10000);
    MEASURE_LATENCY("sh3add", "sh3add %0, %0, %1",  10000);
    MEASURE_LATENCY("clz",    "clz    %0, %0",      10000);
    MEASURE_LATENCY("ctz",    "ctz    %0, %0",      10000);
    MEASURE_LATENCY("cpop",   "cpop   %0, %0",      10000);
    MEASURE_LATENCY("andn",   "andn   %0, %0, %1",  10000);
    MEASURE_LATENCY("orn",    "orn    %0, %0, %1",  10000);
    MEASURE_LATENCY("rev8",   "rev8   %0, %0",      10000);
    MEASURE_LATENCY("bset",   "bset   %0, %0, %1",  10000);
    MEASURE_LATENCY("bclr",   "bclr   %0, %0, %1",  10000);
    MEASURE_LATENCY("bext",   "bext   %0, %0, %1",  10000);*/

    /* Branches (measure misprediction cost) */
    printf("\n--- Branch ---\n");
    {
        uint64_t start, end;
        int n = 10000;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++) {
            asm volatile(
                "beq zero, zero, 1f\n"
                "1:\n"
            );
        }
        asm volatile("rdcycle %0" : "=r"(end));
        printf("beq (taken) : %.2f cycles\n",
               (double)(end - start) / n);
    }

    /* Memory (L1 hit) */
    printf("\n--- Memory (L1 cache hit) ---\n");
    {
        volatile uint64_t data = 42;
        uint64_t start, end, val;
        int n = 10000;

        /* Warm cache */
        val = data;

        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++) {
            val = *(volatile uint64_t *)&data;
        }
        asm volatile("rdcycle %0" : "=r"(end));
        printf("ld (L1 hit) : %.2f cycles\n",
               (double)(end - start) / n);

        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++) {
            *(volatile uint64_t *)&data = val;
        }
        asm volatile("rdcycle %0" : "=r"(end));
        printf("sd (L1 hit) : %.2f cycles\n",
               (double)(end - start) / n);
    }

    /* FP (GPL FPU is iterative, expect high latencies) */
    printf("\n--- Floating Point (GPL iterative FPU) ---\n");
    {
        register double f0 asm("fa0") = 1.5;
        register double f1 asm("fa1") = 2.5;
        uint64_t start, end;
        int n = 1000;

        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            asm volatile("fadd.d %0, %0, %1" : "+f"(f0) : "f"(f1));
        asm volatile("rdcycle %0" : "=r"(end));
        printf("fadd.d      : %.2f cycles\n",
               (double)(end - start) / n);

        f0 = 1.5; f1 = 2.5;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            asm volatile("fmul.d %0, %0, %1" : "+f"(f0) : "f"(f1));
        asm volatile("rdcycle %0" : "=r"(end));
        printf("fmul.d      : %.2f cycles\n",
               (double)(end - start) / n);

        f0 = 1.5; f1 = 2.5;
        asm volatile("fence\n" "rdcycle %0" : "=r"(start));
        for (int i = 0; i < n; i++)
            asm volatile("fdiv.d %0, %0, %1" : "+f"(f0) : "f"(f1));
        asm volatile("rdcycle %0" : "=r"(end));
        printf("fdiv.d      : %.2f cycles\n",
               (double)(end - start) / n);
    }

    return 0;
}
