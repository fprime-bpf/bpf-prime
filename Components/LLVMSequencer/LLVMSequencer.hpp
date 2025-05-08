// ======================================================================
// \title  LLVMSequencer.hpp
// \author rpendergrast
// \brief  hpp file for LLVMSequencer component implementation class
// ======================================================================

#ifndef Components_LLVMSequencer_HPP
#define Components_LLVMSequencer_HPP

#include "Components/LLVMSequencer/LLVMSequencerComponentAc.hpp"
#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"
#include "Os/File.hpp"
#include "Fw/Types/StringBase.hpp"
#include "Fw/Types/SuccessEnumAc.hpp"


namespace Components {

using Signal = LLVMSequencer_LLVMSequencerStateMachineStateMachineBase::Signal;
using State = LLVMSequencer_LLVMSequencerStateMachineStateMachineBase::State;

class LLVMSequencer : public LLVMSequencerComponentBase {
  public:
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct LLVMSequencer object
    LLVMSequencer(const char* const compName  //!< The component name
    );

    //! Destroy LLVMSequencer object
    ~LLVMSequencer();

  PRIVATE:
    bpftime::llvmbpf_vm vm;  
    uint64_t res;
    std::unique_ptr<uint8_t[]> bpf_mem;
    size_t bpf_mem_size;
    const char* sequenceFilePath;
    // ----------------------------------------------------------------------
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------

    //! Handler implementation for checkTimers
    //!
    //! Port to check the timers
    void checkTimers_handler(FwIndexType portNum,  //!< The port number
                             U32 context           //!< The call order
                             ) override;

    //! Handler implementation for cmdResponseIn
    //!
    //! responses back from commands from the sequencer
    void cmdResponseIn_handler(FwIndexType portNum,             //!< The port number
                               FwOpcodeType opCode,             //!< Command Op Code
                               U32 cmdSeq,                      //!< Command Sequence
                               const Fw::CmdResponse& response  //!< The command response argument
                               ) override;

    //! Handler implementation for pingIn
    //!
    //! Ping in port - highest priority
    void pingIn_handler(FwIndexType portNum,  //!< The port number
                        U32 key               //!< Value to return to pinger
                        ) override;

    //! Handler implementation for writeTlm
    //!
    //! Port to write all telemetry
    void writeTlm_handler(FwIndexType portNum,  //!< The port number
                          U32 context           //!< The call order
                          ) override;

  PRIVATE:
    // ----------------------------------------------------------------------
    // Handler implementations for commands
    // ----------------------------------------------------------------------

    //! Handler implementation for command LOAD_SEQUENCE
    //!
    //! Load a sequence
    void LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  const Fw::CmdStringArg& sequenceFilePath);

    //! Handler implementation for command COMPILE_SEQUENCE
    //!
    //! Compile a sequence
    void COMPILE_SEQUENCE_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                     U32 cmdSeq           //!< The command sequence number
                                     );

    //! Handler implementation for command RUN_SEQUENCE
    //!
    //! Runs a sequence
    void RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                 U32 cmdSeq           //!< The command sequence number
                                 );
    // ----------------------------------------------------------------------
    // Handler implementations for state machine actions
    // ----------------------------------------------------------------------
    void Components_LLVMSequencer_LLVMSequencerStateMachine_action_setSequenceFilePath(
      SmId smId,
      Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal,
      const char* filePath //!< The sequence file path
    );

    //Handler for sending the execution error response
    void Components_LLVMSequencer_LLVMSequencerStateMachine_action_sendCmdResponse_EXECUTION_ERROR(
      SmId smId,
      Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    );

    //Action for action load of state machine
    void Components_LLVMSequencer_LLVMSequencerStateMachine_action_loadSequence(
      SmId smId,
      Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    );

    void Components_LLVMSequencer_LLVMSequencerStateMachine_action_compileSequence(
      SmId smId,
      Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    );

    void Components_LLVMSequencer_LLVMSequencerStateMachine_action_runSequence(
      SmId smId,
      Components_LLVMSequencer_LLVMSequencerStateMachine::Signal signal
    );

    // ----------------------------------------------------------------------
    // Handler implementations for wrapper functions
    // ----------------------------------------------------------------------
    
    Fw::Success load(const char* sequenceFilePath);

    Fw::Success compile();

    Fw::Success run();

};

}  // namespace Components

#endif
