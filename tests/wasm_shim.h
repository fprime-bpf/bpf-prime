#pragma once

#include <stdint.h>

#define BPF_ANY         0
#define BPF_NOEXIST     1
#define BPF_EXIST       2

typedef uint64_t BpfMapType;

struct bpf_iter_num {
    unsigned long fd;
    long start;
    long end;
    long curr;
};

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
__attribute__((import_module("env"), import_name("bpf_iter_num_new")))
uint32_t _bpf_iter_num_new(struct bpf_iter_num *it, int32_t start, int32_t end);
__attribute__((import_module("env"), import_name("bpf_iter_num_next")))
int32_t _bpf_iter_num_next(struct bpf_iter_num *it);
__attribute__((import_module("env"), import_name("bpf_iter_num_destroy")))
void _bpf_iter_num_destroy(struct bpf_iter_num *it);
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

unsigned int bpf_iter_num_new(struct bpf_iter_num *it, int start, int end) {
    return _bpf_iter_num_new(it, start, end);
}

int *bpf_iter_num_next(struct bpf_iter_num *it) {
    return (int*)_bpf_iter_num_next(it);
}

void bpf_iter_num_destroy(struct bpf_iter_num *it) {
    _bpf_iter_num_destroy(it);
}

BpfMapType MAP_BY_FD(uint32_t MAP_FD) {
    return _MAP_BY_FD(MAP_FD);
}
