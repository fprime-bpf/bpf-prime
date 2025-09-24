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
            fd: U32, @< Map file descriptor
            $type: BPF_MAP_TYPE, @< Map type
            key_size: U32, @< Size of map keys (in bytes)
            value_size: U32, @< Size of map values (in bytes)
            max_entries: U32, @< Maximum amount of entries
            map_flags: U32 @< Map flags
        ) \ 
        opcode 3 priority 7 assert

@ Lookup an element in a map
@ @note The actual value of `key` is dependent on the endianness of your system
async command BPF_MAP_LOOKUP_ELEM(
            fd: U32, @< File descriptor
            key: string, @< Key data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
            output_path: string @< File path to output element
        ) \
        opcode 5 priority 7 assert

@ Update an element in a map
@ @note The actual value of `key` is dependent on the endianness of your system
@ @note The actual value of `value` is dependent on the endianness of your system
async command BPF_MAP_UPDATE_ELEM(
            fd: U32, @< File descriptor
            key: string, @< Key data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
            value: string, @< Value data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
            flags: U64 @< Map-specific flags
        ) \
        opcode 6 priority 7 assert
    
@ Delete an element in a map
@ @note The actual value of `key` is dependent on the endianness of your system
async command BPF_MAP_DELETE_ELEM(
            fd: U32, @< File descriptor
            key: string @< Key data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
        ) \
        opcode 7 priority 7 assert
