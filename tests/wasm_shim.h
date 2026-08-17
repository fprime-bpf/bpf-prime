#pragma once

#include <stdint.h>

#define BPF_ANY         0
#define BPF_NOEXIST     1
#define BPF_EXIST       2

int main();
__attribute__((export_name("run")))
int run() {
    return main();
}

__attribute__((import_module("env"), import_name("bpf_map_lookup_elem")))
uint32_t bpf_map_lookup_elem(uint64_t map_ptr, uint32_t key);
__attribute__((import_module("env"), import_name("bpf_map_update_elem")))
uint32_t bpf_map_update_elem(uint64_t map_ptr, uint32_t key, uint32_t value, uint64_t flags);
__attribute__((import_module("env"), import_name("bpf_map_delete_elem")))
uint32_t bpf_map_delete_elem(uint64_t map_ptr, uint32_t key);
__attribute__((import_module("env"), import_name("bpf_rand_int")))
int32_t bpf_rand_int(int32_t min, int32_t max);
__attribute__((import_module("env"), import_name("MAP_BY_FD")))
uint64_t MAP_BY_FD(uint32_t fd);

// Native imports so WASM's transcendental calls run the same AOT-compiled libm as native/BPF, instead of WAMR-JIT-compiled sinf/cosf/atan2f.
__attribute__((import_module("env"), import_name("bpf_math_sqrt")))
float bpf_math_sqrt(float elem);
__attribute__((import_module("env"), import_name("bpf_math_sin")))
float bpf_math_sin(float elem);
__attribute__((import_module("env"), import_name("bpf_math_cos")))
float bpf_math_cos(float elem);
__attribute__((import_module("env"), import_name("bpf_math_atan2")))
float bpf_math_atan2(float y, float x);
