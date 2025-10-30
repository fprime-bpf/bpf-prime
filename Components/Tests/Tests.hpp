// ======================================================================
// \title  Tests.hpp
// \author ezrak
// \brief  hpp file for Tests component implementation class
// ======================================================================

#ifndef Components_Tests_HPP
#define Components_Tests_HPP

#include "Components/Tests/TestsComponentAc.hpp"
#include "Fw/Types/SuccessEnumAc.hpp"

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
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------

    //! Handler implementation for getNativeBenchmark
    //!
    //! Run native benchmark, return runtime
    F64 getNativeBenchmark_handler(FwIndexType portNum,  //!< The port number
                                   const Components::BENCHMARK_TEST& test) override;
                                   
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

    //! Handler implementation for command POPULATE_MAP_RANDOM
    //!
    //! Populate a BPF map with random values. Intended for arraymaps
    void POPULATE_MAP_RANDOM_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                        U32 cmdSeq,           //!< The command sequence number
                                        U32 fd,               //!< Map file descriptor
                                        U32 start,            //!< Starting index
                                        U32 length            //!< Number of entries to write
                                        ) override;

    //! Handler implementation for command BENCHMARK
    //!
    //! Run benchmarks, comparing native and vm time for each test
    void BENCHMARK_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                              U32 cmdSeq            //!< The command sequence number
                              ) override;

    // ----------------------------------------------------------------------
    // Handler implementations for wrapper functions
    // ----------------------------------------------------------------------
  private:
    Fw::CmdResponse test_status_to_response(const char *test_name, I32 result);
    Fw::Success populate_map_random(U32 fd, U32 start, U32 length);
    Fw::Success benchmark();
    Fw::Success benchmark_test(U32 passes, BENCHMARK_TEST test, const char *test_name, void (*fill_maps)(Tests*));
    F64 get_benchmark_native(BENCHMARK_TEST test);
};

}  // namespace Components

#endif
