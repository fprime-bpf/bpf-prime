## This is a state machine for the LLVM Sequencer

state machine LLVMSequencerStateMachine{

    initial enter IDLE

    @ This will destruct the vm and everything inside of it!
    action clearSequenceFile

    @ This will set the sequence file path 
    action setSequenceFilePath

    action signalEntered

    signal cmd_LOAD

    state IDLE{
        # #TODO - Determine if we need to clear the sequence file or not when you enter the state
        on entry do {clearSequenceFile}
 
        # Wait for the 
        on cmd_LOAD do {setSequenceFilePath} enter LOADING
    }

    action loadSequence
    action sendCmdResponse_EXECUTION_ERROR
    signal load_failure
    signal load_success

    state LOADING{
        # When you enter the state, raise a signal that you entered the state
        on entry do {signalEntered}

        on entered do { loadSequence } 
        #The results from loading
        on load_failure do {sendCmdResponse_EXECUTION_ERROR} enter IDLE
        on load_success enter COMPILING
    }

    state COMPILING{
        # When you enter the state, raise a signal that you entered the state
        on entry do {signalEntered}

        on entered do { compile } 
        #The results from loading
        on compile_failure do {sendCmdResponse_EXECUTION_ERROR} enter IDLE
        on compile_success enter RUNNING
    }

    state RUNNING{
        # When you enter the state, raise a signal that you entered the state
        on entry do {signalEntered}

        on entered do { run } 
        #The results from loading
        on run_failure do {sendCmdResponse_EXECUTION_ERROR} enter IDLE
        on run_success enter IDLE
    }
}