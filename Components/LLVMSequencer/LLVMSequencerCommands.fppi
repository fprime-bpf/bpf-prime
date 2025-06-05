
@ Load and compile a sequence
async command LOAD_SEQUENCE(
            sequenceFilePath: string
        ) \ 
        opcode 0 priority 7 assert

@ Runs a sequence
async command RUN_SEQUENCE() \ 
        opcode 2 priority 7 assert
