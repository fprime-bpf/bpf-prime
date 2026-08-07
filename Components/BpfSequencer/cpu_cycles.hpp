#ifndef COMPONENTS_BPFSEQUENCER_CPU_CYCLES_HPP
#define COMPONENTS_BPFSEQUENCER_CPU_CYCLES_HPP

#include <cstdint>

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

static constexpr double CPU_CYCLES_HZ = 667000000.0;

static inline double cpu_cycles_to_ns(uint64_t cycles) {
    return (double)cycles * (1e9 / CPU_CYCLES_HZ);
}

#endif  // COMPONENTS_BPFSEQUENCER_CPU_CYCLES_HPP
