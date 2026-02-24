#pragma once

#include <stdint.h>

#define BPF_ANY         0
#define BPF_NOEXIST     1
#define BPF_EXIST       2

typedef uint64_t BpfMapType;

int main();
__attribute__((export_name("run")))
int run() {
    return main();
}

__attribute__((import_module("env"), import_name("bpf_map_lookup_elem")))
uint32_t _bpf_map_lookup_elem(uint64_t map_ptr, uint32_t key);
__attribute__((import_module("env"), import_name("bpf_map_update_elem")))
uint32_t _bpf_map_update_elem(uint64_t map_ptr, uint32_t key, uint32_t value, uint64_t flags);
__attribute__((import_module("env"), import_name("bpf_map_delete_elem")))
uint32_t _bpf_map_delete_elem(uint64_t map_ptr, uint32_t key);
__attribute__((import_module("env"), import_name("MAP_BY_FD")))
uint64_t _MAP_BY_FD(uint32_t fd);


void *bpf_map_lookup_elem(BpfMapType map, const void *key) {
    static uint32_t value;
    value = _bpf_map_lookup_elem(map, *(uint32_t*)key);
    return &value;
}

long bpf_map_update_elem(BpfMapType map, const void *key, const void *value, unsigned long long flags) {
    return _bpf_map_update_elem(map, *(uint32_t*)key, *(uint32_t*)value, flags);
}

long bpf_map_delete_elem(BpfMapType map, const void *key) {
    return _bpf_map_delete_elem(map, *(uint32_t*)key);
}

BpfMapType MAP_BY_FD(uint32_t MAP_FD) {
    return _MAP_BY_FD(MAP_FD);
}
