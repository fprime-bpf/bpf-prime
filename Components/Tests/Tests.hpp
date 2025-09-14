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

    //! Handler implementation for command KALMAN
    //!
    //! Run kalman filter test natively, without an eBPF runtime
    void KALMAN_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                           U32 cmdSeq            //!< The command sequence number
                           ) override;

    //! Handler implementation for command LOW_PASS_FILTER
    //!
    //! Run low pass filter test natively, without an eBPF runtime
    void LOW_PASS_FILTER_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                    U32 cmdSeq            //!< The command sequence number
                                    ) override;

    //! Handler implementation for command MATMUL
    //!
    //! Run matmul test natively, without an eBPF runtime
    void MATMUL_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                           U32 cmdSeq            //!< The command sequence number
                           ) override;

    // ----------------------------------------------------------------------
    // Handler implementations for wrapper functions
    // ----------------------------------------------------------------------
  private:
    Fw::CmdResponse test_status_to_response(const char *test_name, I32 result);
};

}  // namespace Components

#endif
