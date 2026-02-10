// ======================================================================
// \title  WasmSequencer.hpp
// \author ezrak
// \brief  hpp file for WasmSequencer component implementation class
// ======================================================================

#ifndef Components_WasmSequencer_HPP
#define Components_WasmSequencer_HPP

#include "Components/WasmSequencer/WasmSequencerComponentAc.hpp"
#include "Fw/Types/SuccessEnumAc.hpp"

namespace Components {

class WasmSequencer final : public WasmSequencerComponentBase {
  public:
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct WasmSequencer object
    WasmSequencer(const char* const compName  //!< The component name
    );

    //! Destroy WasmSequencer object
    ~WasmSequencer();

  private:
    // ----------------------------------------------------------------------
    // Handler implementations for commands
    // ----------------------------------------------------------------------

    //! Handler implementation for command LOAD_SEQUENCE
    //!
    //! Load and compile a sequence
    void LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  const Fw::CmdStringArg& sequenceFilePath) override;

    //! Handler implementation for command RUN_SEQUENCE
    //!
    //! Runs a sequence
    void RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                 U32 cmdSeq            //!< The command sequence number
                                 ) override;

  private:
    Fw::Success load(const char *sequenceFilePath);
    Fw::Success run();
};

}  // namespace Components

#endif
