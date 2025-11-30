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
#include <mutex>
#include <condition_variable>
#include "Utils/Types/CircularBuffer.hpp"

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
    
    static const U32 num_rate_groups = 5;
    // User will set up rate groups via this function
    void configure(U32 rate_groups[num_rate_groups], U32 timer_freq_hz);

    void run_worker(U32 worker_id);

    void generate_rate_group_schedule(U32 rg_id);

  private:
    
    // CONSTANTS
    static constexpr U8 k_num_vms = 64;
    static const U8 k_max_rate_groups = 5;
    bool running = false;

    Types::CircularBuffer buffers[k_num_vms];

    // Setup needed arrays
    bpftime::llvmbpf_vm *vms[k_num_vms] = {};  
    U32 rate_group_intervals[k_max_rate_groups] = {};
    U32 vm_to_rgId[k_num_vms] = {};
    U32 last_run_vm[k_max_rate_groups];
    F32 vm_next_deadline[k_num_vms] = {};
    U32 rate_group_schedule[k_max_rate_groups][k_num_vms] = {};
    U32 rate_group_member_count[k_max_rate_groups] = {};

    uint64_t res;
    std::unique_ptr<uint8_t[]> bpf_mem;
    size_t bpf_mem_size;
    std::string sequenceFilePath;
    U32 timer_freq_hz; 

    U8* buffer = nullptr;
    U64 ticks = 0;
    U32 num_rate_groups = 0;
    bool configured = false;


    //Stuff for Multithreading
    U32 num_workers = 2; // Default to 2 workers

    // Worker threads 
    std::vector<std::thread> workers;

    // Job Buffers
    std::vector<std::vector<U32>> job_buffers;
    U32 current_buffer = 0; 
    std::vector<std::mutex> buffer_mutex; // Vector of mutexes (per job buffer)
    std::vector<std::condition_variable> buffer_condition; // Synchronization between threads

    // ----------------------------------------------------------------------
    // Handler implementations for typed input ports
    // ----------------------------------------------------------------------


    void schedIn_handler(FwIndexType portNum, U32 context);

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
                                  F32 rate_group_hz,
                                  F32 deadline);            
                                  
    void StopRateGroup_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  U32 vm_id);

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
