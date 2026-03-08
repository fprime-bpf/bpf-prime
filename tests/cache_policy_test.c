/*
 * cache_policy_test.c
 *
 * Empirical cache replacement policy verification for PolarFire SoC (MPFS095T).
 *
 * Target cache geometry (U54 cores):
 *   L1 DCache: 32 KB, 8-way set-associative, 64B lines -> 64 sets
 *              Set index: bits [11:6], stride for same set: 0x1000 (4 KB)
 *   L2 Cache:  2 MB, 16-way set-associative, 64B lines -> 2048 sets
 *              Set index: bits [16:6], stride for same set: 0x20000 (128 KB)
 *
 * Build (bare-metal with riscv64 toolchain):
 *   riscv64-unknown-elf-gcc -O0 -march=rv64gc -mabi=lp64d \
 *       -nostdlib -T your_linker_script.ld cache_policy_test.c -o cache_policy_test
 *
 * Or with SoftConsole / Linux userspace:
 *   riscv64-unknown-linux-gnu-gcc -O0 -static cache_policy_test.c -o cache_policy_test
 *
 * IMPORTANT: Compile with -O0 to prevent the compiler from reordering
 * or eliminating memory accesses. The volatile qualifiers are a second
 * line of defense.
 *
 * Strategy:
 *   We exploit the fact that LRU, FIFO, PLRU, and random produce
 *   different eviction victims for carefully chosen access sequences.
 *   We time re-accesses with rdcycle to classify hit vs miss.
 *
 * Author: [your name]
 * Date:   2026
 */

#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/* ------------------------------------------------------------------ */
/* Platform parameters - adjust these for your specific configuration  */
/* ------------------------------------------------------------------ */

/* L1 DCache geometry (U54 core on PolarFire SoC) */
#define L1_WAYS         8
#define L1_LINE_SIZE    64
#define L1_SETS         64
#define L1_SET_STRIDE   (L1_WAYS * L1_LINE_SIZE * L1_SETS / L1_SETS)
/* Stride to hit same L1 set = L1_size / L1_ways = 4096 */
#define L1_SAME_SET_STRIDE  0x1000

/* L2 Cache geometry */
#define L2_WAYS         16
#define L2_LINE_SIZE    64
#define L2_SETS         2048
#define L2_SAME_SET_STRIDE  0x20000  /* 128 KB */

/* Timing thresholds - calibrate these on your hardware!
 * Run calibrate_thresholds() first to determine good values.
 * These are initial guesses. */
#define L1_HIT_MAX_CYCLES   15    /* L1 hit is ~1-5 cycles */
#define L1_MISS_MIN_CYCLES  20    /* L1 miss (L2 hit) is ~20+ cycles */
#define L2_HIT_MAX_CYCLES   40    /* L2 hit */
#define L2_MISS_MIN_CYCLES  80    /* L2 miss (DDR access) */

/* Number of times to repeat each test for statistical confidence */
#define NUM_TRIALS      1000

/* ------------------------------------------------------------------ */
/* RISC-V cycle counter                                                */
/* ------------------------------------------------------------------ */

static inline uint64_t rdcycle(void)
{
    uint64_t val;
    asm volatile("rdcycle %0" : "=r"(val));
    return val;
}

/* Full fence to serialize memory accesses */
static inline void fence(void)
{
    asm volatile("fence" ::: "memory");
}

/* ------------------------------------------------------------------ */
/* Test buffer - must be large enough and aligned                      */
/* ------------------------------------------------------------------ */

/*
 * We need at least (WAYS + 2) * STRIDE bytes of contiguous memory
 * where all addresses map to the same cache set.
 *
 * For L1 testing:  (8 + 2) * 4096  =  40 KB
 * For L2 testing:  (16 + 2) * 128K = 2304 KB (~2.25 MB)
 *
 * We allocate a large buffer and pick addresses from it.
 * The buffer must be aligned to at least the stride size.
 */

#define TEST_BUF_SIZE   (32 * 1024 * 1024)  /* 32 MB */

/* Use a global array so it lands in .bss (or allocate via mmap) */
static volatile uint8_t __attribute__((aligned(0x20000)))
    test_buffer[TEST_BUF_SIZE];

/* ------------------------------------------------------------------ */
/* Helpers                                                             */
/* ------------------------------------------------------------------ */

/*
 * Access (read) a cache line and return the cycle count for the access.
 */
static inline uint64_t timed_access(volatile uint8_t *addr)
{
    uint64_t t0, t1;
    volatile uint8_t sink;

    fence();
    t0 = rdcycle();
    sink = *addr;
    fence();
    t1 = rdcycle();

    (void)sink;
    return t1 - t0;
}

/*
 * Access (read) a cache line without timing - just to warm it.
 */
static inline void access_line(volatile uint8_t *addr)
{
    volatile uint8_t sink = *addr;
    (void)sink;
    fence();
}

/*
 * Flush the entire L1 dcache by reading through a large region.
 * On PolarFire SoC without explicit flush instructions for L1,
 * we can use CFLUSH.D.L1 if available, or just thrash the cache.
 *
 * For a more reliable flush, use the RISC-V CFLUSH.D.L1 instruction
 * (SiFive custom opcode) if running in M-mode or S-mode:
 *   asm volatile(".insn r 0x73, 0, 0, x0, %0, x0" :: "r"(addr));
 *
 * The thrash approach below works in any privilege mode.
 */
static volatile uint8_t __attribute__((aligned(4096)))
    flush_buffer[512 * 1024];  /* 512 KB > L1 size */

static void flush_l1_dcache(void)
{
    for (int i = 0; i < (int)sizeof(flush_buffer); i += L1_LINE_SIZE) {
        volatile uint8_t sink = flush_buffer[i];
        (void)sink;
    }
    fence();
}

/*
 * Flush L2 by reading through a region larger than L2.
 * This is slow but reliable in user mode.
 * In bare-metal, prefer using WayMask + zero-device approach.
 */
static void flush_l2_cache(void)
{
    /* Read 4 MB to be safe (L2 is 2 MB) */
    for (int i = 0; i < TEST_BUF_SIZE / 8; i += L2_LINE_SIZE) {
        volatile uint8_t sink = test_buffer[i];
        (void)sink;
    }
    fence();
}

/* ------------------------------------------------------------------ */
/* Calibration: determine hit/miss timing thresholds                   */
/* ------------------------------------------------------------------ */

static uint64_t l1_hit_threshold;
static uint64_t l2_hit_threshold;

static void calibrate_thresholds(void)
{
    uint64_t hit_total = 0, miss_total = 0;
    const int NSAMPLES = 200;
    volatile uint8_t *addr = &test_buffer[0];

    printf("=== Calibrating timing thresholds ===\n");

    /* Measure L1 hits: access, then re-access */
    for (int i = 0; i < NSAMPLES; i++) {
        access_line(addr);
        hit_total += timed_access(addr);
    }

    /* Measure L1 misses: flush, then access */
    for (int i = 0; i < NSAMPLES; i++) {
        flush_l1_dcache();
        miss_total += timed_access(addr);
    }

    uint64_t avg_hit  = hit_total / NSAMPLES;
    uint64_t avg_miss = miss_total / NSAMPLES;
    l1_hit_threshold = (avg_hit + avg_miss) / 2;

    printf("  L1 avg hit:  %lu cycles\n", (unsigned long)avg_hit);
    printf("  L1 avg miss: %lu cycles\n", (unsigned long)avg_miss);
    printf("  L1 threshold: %lu cycles\n", (unsigned long)l1_hit_threshold);

    /*
     * For L2: access enough to evict from L1 but keep in L2,
     * then time L2 hit. Then flush L2 and time miss.
     * (Simplified here - adjust based on your measured values.)
     */
    l2_hit_threshold = avg_miss * 3;  /* rough estimate */
    printf("  L2 threshold (est): %lu cycles\n\n",
           (unsigned long)l2_hit_threshold);
}

static int is_l1_hit(uint64_t cycles)
{
    return cycles <= l1_hit_threshold;
}

/* ------------------------------------------------------------------ */
/* TEST 1: Distinguish LRU from FIFO                                   */
/*                                                                     */
/* Access pattern for k-way cache (targeting one set):                 */
/*   1. Fill the set: access A0, A1, ..., A(k-1)                      */
/*   2. Re-access A0 (hit in both LRU and FIFO)                       */
/*   3. Access new line Ak (causes one eviction)                       */
/*   4. Check A0:                                                      */
/*      - LRU:  A0 was recently used, so A1 is evicted -> A0 HITS     */
/*      - FIFO: A0 was inserted first, so A0 is evicted -> A0 MISSES  */
/*      - PLRU: depends on tree state, usually A0 HITS                 */
/*      - Random: ~1/k chance of evicting A0                           */
/* ------------------------------------------------------------------ */

static void test_lru_vs_fifo(int ways, int stride,
                             volatile uint8_t *base, const char *label)
{
    int a0_hit_count = 0;
    int a1_hit_count = 0;

    volatile uint8_t *addr[32];  /* max 32 ways */

    /* Set up addresses that all map to the same cache set */
    for (int i = 0; i <= ways; i++) {
        addr[i] = base + (uint64_t)i * stride;
    }

    printf("=== TEST 1: LRU vs FIFO (%s, %d-way) ===\n", label, ways);
    printf("  Pattern: fill set, re-touch A0, evict with A%d, check A0\n",
           ways);

    for (int trial = 0; trial < NUM_TRIALS; trial++) {
        /* Cold start: flush caches */
        flush_l1_dcache();

        /* Step 1: Fill the set with A0..A(k-1) */
        for (int i = 0; i < ways; i++) {
            access_line(addr[i]);
        }

        /* Step 2: Re-access A0 (this is a HIT) */
        access_line(addr[0]);

        /* Step 3: Access Ak - causes eviction of one line */
        access_line(addr[ways]);

        /* Step 4: Time access to A0 */
        uint64_t t_a0 = timed_access(addr[0]);
        if (is_l1_hit(t_a0)) {
            a0_hit_count++;
        }

        /* Also check A1 for additional signal */
        /* Need to redo the experiment since checking A0 disturbed state */
    }

    float a0_hit_rate = (float)a0_hit_count / NUM_TRIALS * 100.0f;
    printf("  A0 hit rate: %.1f%% (%d / %d)\n",
           a0_hit_rate, a0_hit_count, NUM_TRIALS);
    printf("  Interpretation:\n");
    printf("    ~100%% hit -> LRU or PLRU (re-access promoted A0)\n");
    printf("    ~0%% hit   -> FIFO (re-access doesn't change eviction order)\n");
    printf("    ~%.0f%% hit  -> random (1/k chance of evicting A0)\n",
           (1.0f - 1.0f / ways) * 100.0f);
    printf("\n");
}

/* ------------------------------------------------------------------ */
/* TEST 2: Distinguish LRU from tree-PLRU                              */
/*                                                                     */
/* For an 8-way cache, the classic distinguishing sequence:            */
/*   1. Fill set: A0, A1, A2, A3, A4, A5, A6, A7                      */
/*   2. Re-access in order: A0, A1, A2, A3 (touch the first half)     */
/*   3. Evict with new line A8                                         */
/*   4. Check A4:                                                      */
/*      - True LRU: A4 is LRU (A0-A3 were re-accessed) -> A4 MISSES   */
/*      - Tree PLRU: tree state may protect A4 -> A4 HITS             */
/*                                                                     */
/* The exact PLRU behavior depends on the tree structure, but the key  */
/* insight is that PLRU doesn't maintain perfect ordering, so it will  */
/* sometimes evict a different victim than true LRU.                   */
/* ------------------------------------------------------------------ */

static void test_lru_vs_plru(int ways, int stride,
                              volatile uint8_t *base, const char *label)
{
    if (ways < 4) {
        printf("=== TEST 2: Skipped (need >= 4 ways) ===\n\n");
        return;
    }

    int victim_is_lru = 0;    /* A(ways/2) was evicted (true LRU behavior) */
    int victim_is_plru = 0;   /* something else evicted (PLRU behavior) */

    volatile uint8_t *addr[32];
    for (int i = 0; i <= ways; i++) {
        addr[i] = base + (uint64_t)i * stride;
    }

    int half = ways / 2;

    printf("=== TEST 2: LRU vs PLRU (%s, %d-way) ===\n", label, ways);
    printf("  Pattern: fill set, re-touch A0..A%d, evict, check A%d\n",
           half - 1, half);

    for (int trial = 0; trial < NUM_TRIALS; trial++) {
        flush_l1_dcache();

        /* Step 1: Fill the set */
        for (int i = 0; i < ways; i++) {
            access_line(addr[i]);
        }

        /* Step 2: Re-access first half */
        for (int i = 0; i < half; i++) {
            access_line(addr[i]);
        }

        /* Step 3: Evict */
        access_line(addr[ways]);

        /* Step 4: Check A[half] - under true LRU this is the victim */
        uint64_t t = timed_access(addr[half]);
        if (is_l1_hit(t)) {
            victim_is_plru++;  /* A[half] survived -> not true LRU */
        } else {
            victim_is_lru++;   /* A[half] evicted -> consistent with LRU */
        }
    }

    float lru_rate = (float)victim_is_lru / NUM_TRIALS * 100.0f;
    printf("  A%d evicted rate: %.1f%%\n", half, lru_rate);
    printf("  Interpretation:\n");
    printf("    ~100%% evicted -> true LRU\n");
    printf("    <100%% evicted -> PLRU (tree doesn't track perfect order)\n");
    printf("    ~%.0f%% evicted -> random\n", 100.0f / ways);
    printf("\n");
}

/* ------------------------------------------------------------------ */
/* TEST 3: Detect randomness via variance                              */
/*                                                                     */
/* Fill set with k lines, then access k new lines one at a time.       */
/* After each new access, check which of the original k lines was      */
/* evicted. With deterministic policies, the victim is always the      */
/* same across trials. With random, different victims are chosen.      */
/* ------------------------------------------------------------------ */

static void test_randomness(int ways, int stride,
                             volatile uint8_t *base, const char *label)
{
    int eviction_count[32] = {0};  /* count how many times each way is evicted */

    volatile uint8_t *addr[32];
    for (int i = 0; i <= ways; i++) {
        addr[i] = base + (uint64_t)i * stride;
    }

    printf("=== TEST 3: Randomness detection (%s, %d-way) ===\n",
           label, ways);
    printf("  Pattern: fill set, add one new line, check which was evicted\n");

    for (int trial = 0; trial < NUM_TRIALS; trial++) {
        flush_l1_dcache();

        /* Fill the set with A0..A(k-1) */
        for (int i = 0; i < ways; i++) {
            access_line(addr[i]);
        }

        /* Evict with one new line */
        access_line(addr[ways]);

        /* Check each original line */
        for (int i = 0; i < ways; i++) {
            uint64_t t = timed_access(addr[i]);
            if (!is_l1_hit(t)) {
                eviction_count[i]++;
                break;  /* Stop after finding the first miss
                         * (checking more would disturb state) */
            }
        }
    }

    printf("  Eviction distribution across ways:\n");
    float expected = (float)NUM_TRIALS / ways;
    float chi_sq = 0;
    for (int i = 0; i < ways; i++) {
        float pct = (float)eviction_count[i] / NUM_TRIALS * 100.0f;
        printf("    Way %d (A%d): %d times (%.1f%%)\n",
               i, i, eviction_count[i], pct);
        float diff = eviction_count[i] - expected;
        chi_sq += (diff * diff) / expected;
    }
    printf("  Chi-squared statistic: %.2f\n", chi_sq);
    printf("  Interpretation:\n");
    printf("    One way dominates (~100%%) -> deterministic (FIFO/LRU)\n");
    printf("    Roughly uniform            -> random (chi-sq should be small)\n");
    printf("    Note: for FIFO, A0 should always be evicted\n");
    printf("    Note: for LRU with sequential fill, A0 is also evicted\n");
    printf("\n");
}

/* ------------------------------------------------------------------ */
/* TEST 4: FIFO-specific confirmation                                  */
/*                                                                     */
/* After establishing determinism (Test 3) and distinguishing from     */
/* LRU (Test 1), this test checks the FIFO insertion order property.   */
/*                                                                     */
/* 1. Fill: A0, A1, ..., A(k-1)                                       */
/* 2. Evict with Ak  -> should evict A0 (oldest)                      */
/* 3. Evict with Ak+1 -> should evict A1 (next oldest)                */
/* 4. Check: is A1 evicted?                                            */
/*    - FIFO: yes, A1 is second-oldest                                 */
/*    - LRU with no re-access: also yes (same as FIFO here)           */
/*    Combine with Test 1 to disambiguate.                             */
/* ------------------------------------------------------------------ */

static void test_fifo_order(int ways, int stride,
                             volatile uint8_t *base, const char *label)
{
    int a1_miss = 0;
    int a2_miss = 0;

    volatile uint8_t *addr[32];
    for (int i = 0; i <= ways + 1; i++) {
        addr[i] = base + (uint64_t)i * stride;
    }

    printf("=== TEST 4: FIFO ordering (%s, %d-way) ===\n", label, ways);
    printf("  Pattern: fill, evict twice, check second-oldest\n");

    for (int trial = 0; trial < NUM_TRIALS; trial++) {
        flush_l1_dcache();

        /* Fill: A0..A(k-1) */
        for (int i = 0; i < ways; i++) {
            access_line(addr[i]);
        }

        /* First eviction with Ak */
        access_line(addr[ways]);

        /* Second eviction with Ak+1 */
        access_line(addr[ways + 1]);

        /* Under FIFO: A0 and A1 should be evicted (in order) */
        /* Check A1 */
        uint64_t t = timed_access(addr[1]);
        if (!is_l1_hit(t)) {
            a1_miss++;
        }
    }

    float miss_rate = (float)a1_miss / NUM_TRIALS * 100.0f;
    printf("  A1 miss rate after 2 evictions: %.1f%%\n", miss_rate);
    printf("  Interpretation:\n");
    printf("    ~100%% miss -> FIFO confirmed (evicts in insertion order)\n");
    printf("    <100%% miss -> not pure FIFO\n");
    printf("\n");
}

/* ------------------------------------------------------------------ */
/* TEST 5: Repeated trials for statistical confidence on random        */
/*                                                                     */
/* If Tests 1-4 suggest random, this test runs many more iterations    */
/* and reports detailed statistics.                                    */
/* ------------------------------------------------------------------ */

static void test_random_stats(int ways, int stride,
                               volatile uint8_t *base, const char *label)
{
    const int LOTS_OF_TRIALS = 5000;
    int evict_map[32] = {0};

    volatile uint8_t *addr[32];
    for (int i = 0; i <= ways; i++) {
        addr[i] = base + (uint64_t)i * stride;
    }

    printf("=== TEST 5: Extended randomness (%s, %d-way, %d trials) ===\n",
           label, ways, LOTS_OF_TRIALS);

    for (int trial = 0; trial < LOTS_OF_TRIALS; trial++) {
        flush_l1_dcache();

        for (int i = 0; i < ways; i++) {
            access_line(addr[i]);
        }

        access_line(addr[ways]);

        /* Find which line was evicted by checking all of them.
         * We check in REVERSE order to avoid the issue where checking
         * A0 (miss) causes it to be loaded, evicting another line
         * before we check it. Instead, we note the FIRST miss found
         * scanning backward. */
        int evicted = -1;
        for (int i = ways - 1; i >= 0; i--) {
            uint64_t t = timed_access(addr[i]);
            if (!is_l1_hit(t)) {
                evicted = i;
                /* Don't break - the earlier ones might also miss
                 * due to our checking loading new lines. Take the
                 * lowest-index miss as the original victim. */
            }
        }
        if (evicted >= 0) {
            evict_map[evicted]++;
        }
    }

    printf("  Eviction histogram:\n");
    for (int i = 0; i < ways; i++) {
        float pct = (float)evict_map[i] / LOTS_OF_TRIALS * 100.0f;
        int bar_len = (int)(pct / 2);
        printf("    A%d: %5d (%5.1f%%) |", i, evict_map[i], pct);
        for (int b = 0; b < bar_len; b++) printf("#");
        printf("\n");
    }

    /* Check if distribution is roughly uniform (random) or peaked */
    int max_count = 0, min_count = LOTS_OF_TRIALS;
    for (int i = 0; i < ways; i++) {
        if (evict_map[i] > max_count) max_count = evict_map[i];
        if (evict_map[i] < min_count) min_count = evict_map[i];
    }
    float ratio = (max_count > 0) ? (float)max_count / (min_count + 1) : 999;
    printf("  Max/min ratio: %.2f\n", ratio);
    printf("  Interpretation:\n");
    printf("    Ratio ~1.0-2.0 -> likely random (uniform-ish)\n");
    printf("    Ratio >> 5     -> deterministic policy\n");
    printf("\n");
}

/* ------------------------------------------------------------------ */
/* Summary / verdict                                                   */
/* ------------------------------------------------------------------ */

static void print_summary(void)
{
    printf("============================================================\n");
    printf("HOW TO INTERPRET RESULTS:\n");
    printf("============================================================\n");
    printf("\n");
    printf("If Test 3 shows one way always evicted:\n");
    printf("  -> Deterministic policy. Check Test 1:\n");
    printf("     Test 1 A0 hits ~100%%  -> LRU or PLRU\n");
    printf("     Test 1 A0 hits ~0%%    -> FIFO\n");
    printf("     Then check Test 2 to distinguish LRU from PLRU.\n");
    printf("\n");
    printf("If Test 3 shows roughly uniform distribution:\n");
    printf("  -> Random replacement. Test 5 confirms with more data.\n");
    printf("     This is expected for PolarFire SoC per SiFive docs.\n");
    printf("\n");
    printf("If Test 3 is deterministic but Test 1 shows ~%.0f%% hits:\n",
           (1.0f - 1.0f / L1_WAYS) * 100.0f);
    printf("  -> Might be pseudo-random or LFSR-based.\n");
    printf("     Run Test 5 to check if the pattern repeats.\n");
    printf("============================================================\n");
}

/* ------------------------------------------------------------------ */
/* Main                                                                */
/* ------------------------------------------------------------------ */

int main(void)
{
    printf("============================================================\n");
    printf("PolarFire SoC Cache Replacement Policy Verification\n");
    printf("============================================================\n");
    printf("L1 DCache: %d-way, %d sets, %dB line, stride=0x%x\n",
           L1_WAYS, L1_SETS, L1_LINE_SIZE, L1_SAME_SET_STRIDE);
    printf("L2 Cache:  %d-way, %d sets, %dB line, stride=0x%x\n",
           L2_WAYS, L2_SETS, L2_LINE_SIZE, L2_SAME_SET_STRIDE);
    printf("\n");

    /* Initialize buffer to avoid lazy allocation / CoW pages */
    memset((void *)test_buffer, 0xAA, TEST_BUF_SIZE);
    memset((void *)flush_buffer, 0x55, sizeof(flush_buffer));
    fence();

    /* Calibrate timing */
    calibrate_thresholds();

    /* Pick a base address within test_buffer, aligned to stride */
    volatile uint8_t *l1_base = &test_buffer[0x100000];  /* 1 MB offset */

    printf("************************************************************\n");
    printf("*  L1 DCache Tests                                         *\n");
    printf("************************************************************\n\n");

    test_lru_vs_fifo(L1_WAYS, L1_SAME_SET_STRIDE, l1_base, "L1");
    test_lru_vs_plru(L1_WAYS, L1_SAME_SET_STRIDE, l1_base, "L1");
    test_randomness(L1_WAYS, L1_SAME_SET_STRIDE, l1_base, "L1");
    test_fifo_order(L1_WAYS, L1_SAME_SET_STRIDE, l1_base, "L1");
    test_random_stats(L1_WAYS, L1_SAME_SET_STRIDE, l1_base, "L1");

    /*
     * L2 testing is trickier because accesses go through L1 first.
     * We use the L2 stride (128 KB) which maps addresses to the same
     * L2 set. These also map to the same L1 set, so after 8 accesses
     * L1 starts evicting. The evicted L1 lines remain in L2 (inclusive).
     * We need >16 addresses to trigger L2 evictions.
     *
     * To isolate L2 behavior, we:
     * 1. Access 16 + 1 addresses (all same L2 set)
     * 2. The first 8 fill L1; addresses 9-16 cause L1 evictions but
     *    stay in L2; address 17 causes an L2 eviction
     * 3. Time re-access of address 1 - if L2 miss, it went to DDR
     *
     * NOTE: This is a simplified L2 test. For precise results,
     * use WayMask registers to restrict L2 ways (bare-metal only).
     */
    printf("************************************************************\n");
    printf("*  L2 Cache Tests (simplified - L1 interference possible)  *\n");
    printf("************************************************************\n\n");

    volatile uint8_t *l2_base = &test_buffer[0];

    /* Use fewer ways for L2 test since we need huge strides */
    /* Only run randomness test - most diagnostic for L2 */
    test_randomness(L2_WAYS, L2_SAME_SET_STRIDE, l2_base, "L2");
    test_random_stats(L2_WAYS, L2_SAME_SET_STRIDE, l2_base, "L2");

    print_summary();

    return 0;
}
