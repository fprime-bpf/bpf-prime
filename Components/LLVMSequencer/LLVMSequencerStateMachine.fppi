## This is a state machine for the LLVM Sequencer

state machine LLVMSequencerStateMachine{

    initial enter IDLE

    @ This will destruct the vm and everything inside of it!
    action clearSequenceFile

    signal load_failure
    signal load_success

    state IDLE {
        #The results from loading
        on load_failure enter IDLE
        on load_success enter READY
    }

    signal run_failure
    signal run_success

    signal cmd_RUN

    state READY {
        #The results from running
        on run_failure do { clearSequenceFile } enter IDLE
        on run_success enter READY 
    }
}
