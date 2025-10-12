#pragma once

#define BPF_ANY         0
#define BPF_NOEXIST     1
#define BPF_EXIST       2

static void *(* const bpf_map_lookup_elem)(void *map, const void *key) = (void *) 1;
static long (* const bpf_map_update_elem)(void *map, const void *key, const void *value, unsigned long long flags) = (void *) 2;
static long (* const bpf_map_delete_elem)(void *map, const void *key) = (void *) 3;

#define MAP_BY_FD(MAP_FD) ({ \
    register void *map_ptr_reg asm("r1");                                \
    asm volatile ( \
        ".byte 0x18, 0x11, 0x00, 0x00, " \
        "%c[fd0], %c[fd1], %c[fd2], %c[fd3], " \
        "0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00" \
        : "=r"(map_ptr_reg) \
        : [fd0] "i" ((MAP_FD >> 0) & 0xFF), \
        [fd1] "i" ((MAP_FD >> 8) & 0xFF), \
        [fd2] "i" ((MAP_FD >> 16) & 0xFF), \
        [fd3] "i" ((MAP_FD >> 24) & 0xFF) \
        : \
    ); \
    map_ptr_reg; \
})
