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
#include "Os/Generic/PriorityQueue.hpp"
#include "Fw/Types/StringBase.hpp"
#include "Fw/Types/SuccessEnumAc.hpp"
#include "maps/maps.hpp"
#include <mutex>
#include <condition_variable>
#include <thread>
#include <map>
#include <queue>
#include <array>

#define BPF_PRIME_VM_COUNT 64

namespace Components {

// Job entry for the shared priority queue
struct ScheduledJob {
    F32 deadline;  // Deadline in ms (0.0 to 1000.0)
    U32 vm_id;
};

// VM-specific data structure
struct BpfSequencerVM {
    bpftime::llvmbpf_vm bpf_vm;
    uint64_t res = 0;
    std::unique_ptr<uint8_t[]> bpf_mem = nullptr;
    size_t bpf_mem_size = 0;
    std::string sequenceFilePath;
    
    // VM scheduling info
    U32 rate_group_id = static_cast<U32>(-1);  // Which rate group this VM belongs to (-1 = none)
    F32 runtime_ms = 0.0f;  // Estimated runtime in ms
    F32 latest_run_time = 0.0f;  // Latest time this VM can run in the current cycle
    
    // Per-job running flag, true if this VM's job is currently executing, used to detect slips
    std::atomic<bool> is_running{false};
    
    ~BpfSequencerVM();
};

struct VmExternalFunction {
  void *fn;
  const char *name;
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

    // Allows user to register bpf helper functions
    // Note: Indices 1-3 are used internally for eBPF map helper functions. Start with index 4
    void register_bpf_helper(U32 index, const VmExternalFunction& helper);
    void register_bpf_helpers(const std::vector<std::pair<U32, VmExternalFunction>>& helpers);
    
  private:
    // CONSTANTS
    static constexpr U8 k_num_vms = 64;
    static constexpr U8 k_max_rate_groups = 5;
    static constexpr F32 k_cycle_period_ms = 1000.0f;  // One full scheduling cycle in ms
    
    bool running = false;

    // VM array - each VM has its own scheduling data now
    std::shared_ptr<BpfSequencerVM> vms[k_num_vms];
    
    // Rate group configuration
    U32 rate_group_intervals[k_max_rate_groups] = {};
    U32 num_rate_groups = 0;
    U32 timer_freq_hz = 1000;

    // Legacy member variables for bpf_mem (kept for backward compatibility with single-VM execution)
    uint64_t res;
    std::unique_ptr<uint8_t[]> bpf_mem;
    size_t bpf_mem_size;
    std::string sequenceFilePath;

    U8* buffer = nullptr;
    U64 ticks = 0;
    bool configured = false;

    I32 QUEUE_MAGIC_NUMBER = 116;

    // BPF helper functions
    std::unordered_map<U32, VmExternalFunction> bpf_helpers;

    // ========== Multithreading with EDF Scheduling ==========
    
    // Shared priority queue for earliest-deadline-first scheduling
    // All executors pop from this shared queue
    static const FwSizeType MAX_JOBS = 64;

    Os::Generic::PriorityQueue job_queue;
    
    // Slip detection: atomic integer that stores the VM ID that slipped
    // Value of -1 means no slip detected
    std::array<std::atomic<bool>, k_num_vms> slip_detected{};
    
    // Worker threads
    std::vector<std::thread> workers;
    std::vector<bool> worker_enabled;
    F32 runtime_overflow = 0.0f;
    U32 num_workers = 2;

    // Use an array for the schedule (faster access than a map)
    std::array<std::vector<U32>, 1000> schedule;
    
    // Current position in the scheduling cycle (in ticks)
    U32 cycle_tick = 0;
    
    // Worker function that pops jobs from shared queue and executes
    void run_worker(U32 worker_id);
    
    // Rebuild the deadline schedule based on all VMs' rate groups and runtimes
    void rebuild_deadline_schedule();
    
    // Push jobs for the current tick into the shared queue
    void schedule_jobs_for_tick(U32 tick);

    // Register all external functions for new vm instance
    U32 register_external_functions(bpftime::llvmbpf_vm& vm);

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
    
    //! Handler for SetVMRateGroup command
    //! @param runtime_ms Expected runtime of the VM in milliseconds
    void SetVMRateGroup_cmdHandler(FwOpcodeType opCode,  //!< The opcode
                                  U32 cmdSeq,           //!< The command sequence number
                                  U32 vm_id,
                                  F32 rate_group_hz,
                                  F32 runtime_ms) override;
                                  
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

  public:
    struct bpf_iter_num;
    
    static U32 bpf_iter_num_new(struct bpf_iter_num *it, I32 start, I32 end) noexcept;

    static I32 *bpf_iter_num_next(struct bpf_iter_num *it) noexcept;
    
    static void bpf_iter_num_destroy(struct bpf_iter_num *it) noexcept;

    F64 get_benchmark_vm(BENCHMARK_TEST test, bool compile);

  public:
    static Fw::CmdResponse result_to_response(Fw::Success result);

    static U8 *read_from_file(const char *fn, FwSizeType& size, const char*& err_msg);
    
  private:
    bool validate_vm_id(U32 vmId);

    bool get_map_by_fd(U32 fd, map*& map, Fw::LogStringArg& command_name);

    bool validate_data_size(U32 size, bool key, map* map, Fw::LogStringArg& command_name);
};

struct BpfSequencer::bpf_iter_num {
    I32 fd;
    I32 start;
    I32 end;
    I32 curr;
};

}  // namespace Components

#endif
