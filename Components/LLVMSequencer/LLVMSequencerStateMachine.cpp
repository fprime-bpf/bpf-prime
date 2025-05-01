#include "Components/LLVMSequencer/LLVMSequencer.hpp"


namespace Components {
    // Command handlers

    //Handler for sending the entered signal
    void LLVMSequencer::Components_LLVMSequencer_SequencerStateMachine_action_signalEntered(
        SmId smId,
        Components_LLVMSequencer_SequencerStateMachineState::signal signal
    ){
        this->sequencer_sendSignal_entered();
    }

    void LLVMSequencer::Components_LLVMSequencer_SequencerStateMachine_action_setSequenceFilePath

    //Handler for sending the execution error response
    void LLVMSequencer::Components_LLVMSequencer_SequencerStateMachine_action_sendCmdResponse_EXECUTION_ERROR(
        SmId smId,
        Components_LLVMSequencer_SequencerStateMachineState::signal signal
    ){
        //TODO - Figure out the opcodes
        this->cmdResponse_out(FwOpcodeType(0), 0, Fw::CmdResponse::EXECUTION_ERROR);
    }
    
    //Action for action load of state machine
    //Performs all the necessary states for sequence loading and then raises a signal
    //load_success or load_failure
    void LLVMSequencer::Components_LLVMSequencer_SequencerStateMachine_action_loadSequence(
        SmId smId,
        Components_LLVMSequencer_SequencerStateMachineState::signal signal
    ){
        Fw::Success result = this->load(); //TODO - Implement load function
        if (result == Fw::SUCCESS) {
            this->sequencer_sendSignal_load_success();
        } else {
            this->sequencer_sendSignal_load_failure();
        }
    }
}