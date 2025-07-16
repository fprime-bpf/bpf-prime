
enum BPF_MAP_TYPE : U32 {
    BPF_MAP_TYPE_UNSPEC,
    BPF_MAP_TYPE_HASH,
    BPF_MAP_TYPE_ARRAY,
    BPF_MAP_TYPE_PROG_ARRAY,
    BPF_MAP_TYPE_PERF_EVENT_ARRAY,
    BPF_MAP_TYPE_PERCPU_HASH,
    BPF_MAP_TYPE_PERCPU_ARRAY,
    BPF_MAP_TYPE_STACK_TRACE,
    BPF_MAP_TYPE_CGROUP_ARRAY,
    BPF_MAP_TYPE_LRU_HASH,
    BPF_MAP_TYPE_LRU_PERCPU_HASH
}

@ Create a map
async command BPF_MAP_CREATE(
            $type: BPF_MAP_TYPE,
            key_size: U32,
            value_size: U32,
            max_entries: U32,
            map_flags: U32
        ) \ 
        opcode 3 priority 7 assert

@ Lookup an element in a map
async command BPF_MAP_LOOKUP_ELEM(
            fd: U32,
            key: string,
            output_path: string
        ) \
        opcode 5 priority 7 assert

@ Update an element in a map
async command BPF_MAP_UPDATE_ELEM(
            fd: U32,
            key: string,
            value: string,
            flags: U64
        ) \
        opcode 6 priority 7 assert
    
@ Delete an element in a map
async command BPF_MAP_DELETE_ELEM(
            fd: U32,
            key: string
        ) \
        opcode 7 priority 7 assert
