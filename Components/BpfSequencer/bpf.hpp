#pragma once

namespace Components {

/* flags for BPF_MAP_UPDATE_ELEM command */
#define BPF_ANY         0 /* create new element or update existing */
#define BPF_NOEXIST     1 /* create new element if it didn't exist */
#define BPF_EXIST       2 /* update existing element */
#define BPF_F_LOCK      4 /* spin_lock-ed map_lookup/map_update */

struct bpf_map_def {
    unsigned int type;
    unsigned int key_size;
    unsigned int value_size;
    unsigned int max_entries;
    unsigned int map_flags;
};

}
