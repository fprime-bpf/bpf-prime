#include <new>
#include "Components/LLVMSequencer/LLVMSequencer.hpp"

namespace Components {
    // Command handlers:
    void LLVMSequencer::Components_LLVMSequencer_LLVMSequencerStateMachine_action_setSequenceFilePath(
        SmId smId,
        Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal,
        const Fw::StringBase& filePath //!< The sequence file path
    ){
        this->sequenceFilePath = filePath.toChar(); 
    }

    void LLVMSequencer::Components_LLVMSequencer_LLVMSequencerStateMachine_action_clearSequenceFile(
        SmId smId,
        Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    ){
        this->sequenceFilePath = "";
        this->vm.unload_code();
    }

    //Handler for sending the execution error response
    void LLVMSequencer::Components_LLVMSequencer_LLVMSequencerStateMachine_action_sendCmdResponse_EXECUTION_ERROR(
        SmId smId,
        Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    ){
        //TODO - Figure out the opcodes
        this->cmdResponse_out(FwOpcodeType(0), 0, Fw::CmdResponse::EXECUTION_ERROR);
    }
    
    //Action for action load of state machine
    //Performs all the necessary states for sequence loading and then raises a signal
    //load_success or load_failure
    void LLVMSequencer::Components_LLVMSequencer_LLVMSequencerStateMachine_action_loadSequence(
        SmId smId,
        Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    ){
        Fw::Success result = this->load(this->sequenceFilePath); //TODO - Implement compile function
        if (result == Fw::Success::SUCCESS) {
            this->sequencer_sendSignal_load_success();
        } else {
            this->sequencer_sendSignal_load_failure();
        }
        //this->sequencer_sendSignal_load_success();
    }

    void LLVMSequencer::Components_LLVMSequencer_LLVMSequencerStateMachine_action_compileSequence(
        SmId smId,
        Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    ){
        Fw::Success result = this->compile(); //TODO - Implement compile function
        if (result == Fw::Success::SUCCESS) {
            this->sequencer_sendSignal_compile_success();
        } else {
            this->sequencer_sendSignal_compile_failure();
        }
        //this->sequencer_sendSignal_compile_success();
    }

    void LLVMSequencer::Components_LLVMSequencer_LLVMSequencerStateMachine_action_runSequence(
        SmId smId,
        Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    ){
        Fw::Success result = this->run(); //TODO - Implement run function
        if (result == Fw::Success::SUCCESS) {
            this->sequencer_sendSignal_run_success();
        } else {
            this->sequencer_sendSignal_run_failure();
        }
        //this->sequencer_sendSignal_run_success();
    }

    void LLVMSequencer::Components_LLVMSequencer_LLVMSequencerStateMachine_action_signalEntered(
      SmId smId,
      Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    ){
        // stub
    }
}
