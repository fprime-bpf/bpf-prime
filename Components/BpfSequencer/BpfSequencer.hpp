// ======================================================================
// \title  BpfSequencer.hpp
// \author ezrak, pendergrast
// \brief  hpp file for BpfSequencer component implementation class
// ======================================================================

#ifndef Components_BpfSequencer_HPP
#define Components_BpfSequencer_HPP

#include "Components/BpfSequencer/BpfSequencerComponentAc.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include "Os/File.hpp"
#include "Fw/Types/StringBase.hpp"
#include "Fw/Types/SuccessEnumAc.hpp"
#include "maps/maps.hpp"

namespace Components {

struct BpfSequencerVM {
    bpftime::llvmbpf_vm bpf_vm;
    uint64_t res = 0;
    std::unique_ptr<uint8_t[]> bpf_mem = nullptr;
    size_t bpf_mem_size = 0;
    std::string sequenceFilePath;
};

class BpfSequencer : public BpfSequencerComponentBase {
  public:
    inline static Components::maps maps;
    // ----------------------------------------------------------------------
    // Component construction and destruction
    // ----------------------------------------------------------------------

    //! Construct BpfSequencer object
    BpfSequencer(const char* const compName  //!< The component name
    );

    //! Destroy BpfSequencer object
    ~BpfSequencer();

    // User will set up rate groups via this function
    void configure(U32 rate_groups[5], U32 timer_freq_hz);

  private:
    BpfSequencerVM *vms[64];
    U8* buffer = nullptr;
    U64 ticks = 0;
    bool configured = false;
    U32 k_max_rate_groups = 5;
    U32 num_rate_groups = 0;
    U32 rate_group_intervals[5] = {};
    U32 timer_freq_hz = 1000; // Default to 1kHz

    // boolean arrays for different rate groups
    bool rate_group_map[5][64] = {};
    
    // ----------------------------------------------------------------------
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------


    void schedIn_handler(FwIndexType portNum, U32 context) override;

    //! Handler implementation for getVmBenchmark
    //!
    //! Run vm benchmark, return runtime (IN)
    F64 getVmBenchmark_handler(FwIndexType portNum,  //!< The port number
                               const Components::BENCHMARK_TEST& test,
                               bool compile) override;

    //! Handler implementation for pingIn
    //!
    //! Ping in port - highest priority
    void pingIn_handler(FwIndexType portNum,  //!< The port number
                        U32 key               //!< Value to return to pinger
                        ) override;

  private:
    // ----------------------------------------------------------------------
    // Handler implementations for commands
    // ----------------------------------------------------------------------

    //! Handler implementation for command LOAD_SEQUENCE
    //!
    //! Load and compile a sequence


    
    void LOAD_SEQUENCE_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  U32 vmId,             //!< The index of the selected BPF VM (0-63)
                                  const Fw::CmdStringArg& sequenceFilePath) override;

    //! Handler implementation for command RUN_SEQUENCE
    //!
    //! Runs a sequence
    void RUN_SEQUENCE_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                 U32 cmdSeq,           //!< The command sequence number
                                 U32 vmId              //!< The index of the selected BPF VM (0-63)
                                 ) override;
    
    void SetVMRateGroup_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  U32 vm_id,
                                  U32 rate_group_hz) override; 
                                  
    void StopRateGroup_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  U32 vm_id) override;

    //! Handler implementation for command BPF_MAP_CREATE
    //!
    //! Create a map
    void BPF_MAP_CREATE_cmdHandler(FwOpcodeType opCode,                          //!< The opcode
                                   U32 cmdSeq,                                   //!< The command sequence number
                                   U32 fd,                                       //!< Map file descriptor
                                   Components::BpfSequencer_BPF_MAP_TYPE type,  //!< Map type
                                   U32 key_size,                                 //!< Size of map keys (in bytes)
                                   U32 value_size,                               //!< Size of map values (in bytes)
                                   U32 max_entries,                              //!< Maximum amount of entries
                                   U32 map_flags                                 //!< Map flags
                                   ) override;
                                   

    //! Handler implementation for command BPF_MAP_LOOKUP_ELEM
    //!
    //! Lookup an element in a map
    //! @note The actual value of `key` is dependent on the endianness of your system
    void BPF_MAP_LOOKUP_ELEM_cmdHandler(
        FwOpcodeType opCode,                 //!< The opcode
        U32 cmdSeq,                          //!< The command sequence number
        U32 fd,                              //!< File descriptor
        const Fw::CmdStringArg& key,         //!< Key data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
        const Fw::CmdStringArg& output_path  //!< File path to output element
        ) override;

    //! Handler implementation for command BPF_MAP_UPDATE_ELEM
    //!
    //! Update an element in a map
    //! @note The actual value of `key` is dependent on the endianness of your system
    //! @note The actual value of `value` is dependent on the endianness of your system
    void BPF_MAP_UPDATE_ELEM_cmdHandler(
        FwOpcodeType opCode,            //!< The opcode
        U32 cmdSeq,                     //!< The command sequence number
        U32 fd,                         //!< File descriptor
        const Fw::CmdStringArg& key,    //!< Key data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
        const Fw::CmdStringArg& value,  //!< Value data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
        U64 flags                       //!< Map-specific flags
        ) override;

    //! Handler implementation for command BPF_MAP_DELETE_ELEM
    //!
    //! Delete an element in a map
    //! @note The actual value of `key` is dependent on the endianness of your system
    void BPF_MAP_DELETE_ELEM_cmdHandler(
        FwOpcodeType opCode,         //!< The opcode
        U32 cmdSeq,                  //!< The command sequence number
        U32 fd,                      //!< File descriptor
        const Fw::CmdStringArg& key  //!< Key data as whitespace-separated hex bytes, e.g. "01 02 03 A0 B0 C0"
        ) override;

    // ----------------------------------------------------------------------
    // Handler implementations for wrapper functions
    // ----------------------------------------------------------------------
    
    Fw::Success load(U32 vmId, const char* sequenceFilePath);

    Fw::Success run(U32 vmId, bool log_time = false);

    Fw::Success map_create(const bpf_map_def& map_def, U32 fd);
    
    Fw::Success map_lookup_elem(U32 fd, U8 *key, U32 key_size, const char *output_path);
    
    Fw::Success map_update_elem(U32 fd, U8 *key, U32 key_size, U8 *value, U32 value_size, U64 flags);
    
    Fw::Success map_delete_elem(U32 fd, U8 *key, U32 key_size);

    F64 get_benchmark_vm(BENCHMARK_TEST test, bool compile);

  public:
    static Fw::CmdResponse result_to_response(Fw::Success result);
    
  private:
    bool validate_vm_id(U32 vmId);

    bool get_map_by_fd(U32 fd, map*& map, Fw::LogStringArg& command_name);

    bool validate_data_size(U32 size, bool key, map* map, Fw::LogStringArg& command_name);
};

}  // namespace Components

#endif
