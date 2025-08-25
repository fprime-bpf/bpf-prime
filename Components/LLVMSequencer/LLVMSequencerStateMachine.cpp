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
        this->vm->unload_code();
    }
}
