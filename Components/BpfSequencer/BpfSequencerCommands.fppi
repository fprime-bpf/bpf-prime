@ Load and compile a sequence
async command LOAD_SEQUENCE(
            vmId: U32, @< The index of the selected BPF VM (0-63)
            sequenceFilePath: string
        ) \ 
        opcode 0 priority 7 assert

@ Runs a sequence
async command RUN_SEQUENCE(
            vmId: U32, @< The index of the selected BPF VM (0-63)
        ) \ 
        opcode 2 priority 7 assert
