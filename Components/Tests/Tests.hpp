// ======================================================================
// \title  Tests.hpp
// \author ezrak
// \brief  hpp file for Tests component implementation class
// ======================================================================

#ifndef Components_Tests_HPP
#define Components_Tests_HPP

#include "Components/Tests/TestsComponentAc.hpp"

namespace Components {

class Tests final : public TestsComponentBase {
  public:
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct Tests object
    Tests(const char* const compName  //!< The component name
    );

    //! Destroy Tests object
    ~Tests();

  private:
    // ----------------------------------------------------------------------
    // Handler implementations for commands
    // ----------------------------------------------------------------------

    //! Handler implementation for command COMMAND
    void COMMAND_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                            U32 cmdSeq            //!< The command sequence number
                            ) override;
};

}  // namespace Components

#endif
