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
__attribute__((import_module("env"), import_name("MAP_BY_FD")))
uint64_t MAP_BY_FD(uint32_t fd);
