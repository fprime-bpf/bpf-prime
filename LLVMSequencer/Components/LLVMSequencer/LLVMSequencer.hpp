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

namespace Components {

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
                                  const char* sequenceFilePath);

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
                                 U32 cmdSeq,           //!< The command sequence number
                                 const Fw::CmdStringArg& fileName) override;
    
    
};

}  // namespace Components

#endif
