#pragma once

#define BPF_ANY         0
#define BPF_NOEXIST     1
#define BPF_EXIST       2

__attribute__((import_module("env"), import_name("bpf_map_lookup_elem")))
void* bpf_map_lookup_elem(void* map_ptr, const void* key);
__attribute__((import_module("env"), import_name("bpf_map_update_elem")))
long bpf_map_update_elem(void* map_ptr, const void* key, const void* value, unsigned long long flags);
__attribute__((import_module("env"), import_name("bpf_map_delete_elem")))
long bpf_map_delete_elem(void* map_ptr, const void* key);

__attribute__((import_module("env"), import_name("MAP_BY_FD")))
void *MAP_BY_FD(unsigned int fd);
