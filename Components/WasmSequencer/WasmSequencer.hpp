// ======================================================================
// \title  WasmSequencer.hpp
// \author ezrak
// \brief  hpp file for WasmSequencer component implementation class
// ======================================================================

#ifndef Components_WasmSequencer_HPP
#define Components_WasmSequencer_HPP

#include "Components/WasmSequencer/WasmSequencerComponentAc.hpp"
#include "Fw/Types/SuccessEnumAc.hpp"
#include "Components/BpfSequencer/BpfSequencer.hpp"
#include <wasmtime.hh>
#include <optional>

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
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------

    //! Handler implementation for getBenchmark
    //!
    //! Run wasm benchmark, return runtime (IN)
    F64 getBenchmark_handler(FwIndexType portNum,  //!< The port number
                             const Components::BENCHMARK_TEST& test,
                             bool compile) override;
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
    wasmtime::Engine engine;
    wasmtime::Store store;
    wasmtime::Linker linker;
    std::optional<wasmtime::Func> func;
  private:
    Fw::Success load(const char *sequenceFilePath);
    Fw::Success run();
    F64 get_benchmark_wasm(Components::BENCHMARK_TEST test, bool compile);

    static uint32_t bpf_map_lookup_elem(uint64_t map_ptr, uint32_t key);
    static uint32_t bpf_map_update_elem(uint64_t map_ptr, uint32_t key, uint32_t value, uint64_t flags);
    static uint32_t bpf_map_delete_elem(uint64_t map_ptr, uint32_t key);
    static uint64_t MAP_BY_FD(uint32_t fd);
};

}  // namespace Components

#endif
