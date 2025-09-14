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

  private:
    bpftime::llvmbpf_vm *vms[64] = {};  
    uint64_t res;
    std::unique_ptr<uint8_t[]> bpf_mem;
    size_t bpf_mem_size;
    std::string sequenceFilePath;
    U8* buffer = nullptr;
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
    
    Fw::Success compile();
    
    Fw::Success run(U32 vmId);

    Fw::Success map_create(const bpf_map_def& map_def, U32 fd);
    
    Fw::Success map_lookup_elem(U32 fd, U8 *key, U32 key_size, const char *output_path);
    
    Fw::Success map_update_elem(U32 fd, U8 *key, U32 key_size, U8 *value, U32 value_size, U64 flags);
    
    Fw::Success map_delete_elem(U32 fd, U8 *key, U32 key_size);
    
  private:
    bool validate_vm_id(U32 vmId, const Fw::LogStringArg& loggerFilePath);

    bool get_map_by_fd(U32 fd, map*& map, Fw::LogStringArg& command_name);

    bool validate_data_size(U32 size, bool key, map* map, Fw::LogStringArg& command_name);
};

}  // namespace Components

#endif
