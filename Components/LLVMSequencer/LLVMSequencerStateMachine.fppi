## This is a state machine for the LLVM Sequencer

state machine LLVMSequencerStateMachine{

    initial enter IDLE

    @ This will destruct the vm and everything inside of it!
    action clearSequenceFile

    @ This will set the sequence file path 
    action setSequenceFilePath: string

    action signalEntered

    signal cmd_LOAD: string

    state IDLE{
        # #TODO - Determine if we need to clear the sequence file or not when you enter the state
 
        # Wait for the 
        on cmd_LOAD do {setSequenceFilePath} enter LOADING
    }

    action loadSequence
    action sendCmdResponse_EXECUTION_ERROR
    signal load_failure
    signal load_success

    state LOADING{
        # When you enter the state, raise a signal that you entered the state
        entry do { loadSequence } 
        #The results from loading
        on load_failure do {sendCmdResponse_EXECUTION_ERROR} enter IDLE
        on load_success enter COMPILING
    }

    action compileSequence
    signal compile_failure
    signal compile_success

    signal cmd_COMPILE

    state COMPILING{
        on cmd_COMPILE do { compileSequence } 
        #The results from compilation
        on compile_failure do {sendCmdResponse_EXECUTION_ERROR} enter IDLE
        on compile_success enter RUNNING
    }

    action runSequence
    signal run_failure
    signal run_success

    signal cmd_RUN

    state RUNNING{
        on cmd_RUN do { runSequence } 
        #The results from running
        on run_failure do {sendCmdResponse_EXECUTION_ERROR} enter IDLE

        on run_success enter IDLE
    }
}