#ifndef COMPONENTS_BPFSEQUENCER_CPU_CYCLES_HPP
#define COMPONENTS_BPFSEQUENCER_CPU_CYCLES_HPP

#include <cstdint>

// Portable, syscall-free cycle counter -- reads a hardware counter directly
// instead of going through clock_gettime()'s syscall/vDSO path. Ported from
// the noelv-fixes branch's BpfSequencer::run() timing (originally riscv64
// rdcycle only); extended here to also cover x86_64 and arm64 so the same
// benchmark code can run on any of the three without a syscall in the timed
// region.
//
// The raw counter units differ per architecture (x86_64: TSC ticks; aarch64:
// generic timer ticks; riscv64: true core clock cycles via Zicntr's `cycle`
// CSR), but CPU_CYCLES_HZ below assumes the same 667MHz NOEL-V/PolarFire SoC
// rate everywhere (matching runtime-verifier's polarfire.py cpu_freq_hz).
// That's only exactly correct on riscv64; on x86_64/arm64 it under/overstates
// the true elapsed time by a constant factor. Since every call site here
// converts bpf/native/wasm timings the same way, that factor cancels out of
// relative (bpf vs native vs wasm) comparisons, which is what this is for --
// it does not give physically accurate absolute times on those platforms.
#if defined(__riscv) && __riscv_xlen == 64
static inline uint64_t get_cpu_cycles() {
    uint64_t cycles;
    __asm__ __volatile__("rdcycle %0" : "=r"(cycles));
    return cycles;
}
#elif defined(__aarch64__)
static inline uint64_t get_cpu_cycles() {
    uint64_t cycles;
    __asm__ __volatile__("mrs %0, cntvct_el0" : "=r"(cycles));
    return cycles;
}
#elif defined(__x86_64__) || defined(_M_X64)
#include <x86intrin.h>
static inline uint64_t get_cpu_cycles() {
    return __rdtsc();
}
#else
#error "get_cpu_cycles: unsupported architecture (expected x86_64, aarch64, or riscv64)"
#endif

// 667,000,000 Hz -- see comment above on why this single constant is used
// across all three architectures.
static constexpr double CPU_CYCLES_HZ = 667000000.0;

static inline double cpu_cycles_to_ns(uint64_t cycles) {
    return (double)cycles * (1e9 / CPU_CYCLES_HZ);
}

#endif  // COMPONENTS_BPFSEQUENCER_CPU_CYCLES_HPP
