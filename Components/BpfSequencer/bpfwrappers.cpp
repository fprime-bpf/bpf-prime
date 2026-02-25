#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include "bpf.hpp"
#include "maps/maps.hpp"

#include <chrono>
#include <cstring>
#include <new>

#define CREATE_ERRNO_MSG(res) Fw::LogStringArg(std::strerror(-res))

using timer = std::chrono::high_resolution_clock;
using ms = std::chrono::milliseconds;

namespace Components {

Fw::Success BpfSequencer::load(U32 vmId, const char* sequenceFilePath) {
    delete[] this->buffer;
    Fw::LogStringArg loggerFilePath(sequenceFilePath);

    // Validate VM ID
    if (!validate_vm_id(vmId))
        return Fw::Success::FAILURE;

    // Reject reload if the VM is currently executing
    if (vms[vmId] && vms[vmId]->is_running.load(std::memory_order_acquire)) {
        Fw::LogStringArg errMsg("VM is currently running");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    // Always create a fresh VM struct to reset compiled state
    vms[vmId] = std::make_shared<BpfSequencerVM>();
    if (!vms[vmId]) {
        Fw::LogStringArg errMsg("Failed to allocate VM");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }
    auto vm = vms[vmId];

    // Register external functions
    I32 res = this->register_external_functions(vm->bpf_vm);
    if (res) {
        this->log_WARNING_HI_RegisterFunctionsFailed(
            vmId,
            Fw::LogStringArg(std::strerror(-res))
        );
        return Fw::Success::FAILURE;
    }

    // Read sequence file into buffer
    FwSizeType size_result;
    const char *err_msg;
    this->buffer = read_from_file(sequenceFilePath, size_result, err_msg);
    if (!this->buffer) {
        this->log_ACTIVITY_HI_CommandLoadFailed(
            loggerFilePath,
            Fw::LogStringArg(err_msg)
        );
        return Fw::Success::FAILURE;
    }

    vm->bpf_mem_size = 40000;
    vm->bpf_mem = std::make_unique<uint8_t[]>(vm->bpf_mem_size);
    vm->sequenceFilePath = sequenceFilePath;

    // Load the binary into the VM
    auto load_res = vm->bpf_vm.load_code(buffer, size_result);
    if (load_res) {
        delete[] this->buffer;
        Fw::LogStringArg errMsg(
            std::string("Failed to load binary into VM - " + vm->bpf_vm.get_error_message()).c_str());
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    auto compile_res = vm->bpf_vm.compile();
    if (!compile_res) {
        Fw::LogStringArg errMsg(
            std::string("Failed to compile BPF program - " + vm->bpf_vm.get_error_message()).c_str());
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    delete[] this->buffer;
    this->buffer = nullptr;

    // Success
    this->log_ACTIVITY_HI_CommandLoaded(loggerFilePath, vmId);
    return Fw::Success::SUCCESS;
}

Fw::Success BpfSequencer::run(U32 vmId, bool log_time) {
    uint64_t err = 0;
    timer::time_point start, end;

    // Validate VM ID
    if (!validate_vm_id(vmId))
        return Fw::Success::FAILURE;

    if (!vms[vmId]) {
        Fw::LogStringArg errMsg("VM not loaded");
        this->log_ACTIVITY_HI_CommandRunFailed(vmId, errMsg);
        return Fw::Success::FAILURE;
    }
    auto vm = vms[vmId];

    if (log_time)
        start = timer::now();
    
    // Run the compiled sequence using VM's own bpf_mem
    err = vm->bpf_vm.exec(&vm->bpf_mem, vm->bpf_mem_size, vm->res);
    
    if (log_time)
        end = timer::now();

    if (err) {
        Fw::LogStringArg errMsg(vm->bpf_vm.get_error_message().c_str());
        this->log_ACTIVITY_HI_CommandRunFailed(vmId, errMsg);
        return Fw::Success::FAILURE;
    }

    if (log_time)
        this->log_ACTIVITY_LO_CommandRunSuccess(vmId, std::chrono::duration<F64, ms::period>(end - start).count());
    return Fw::Success::SUCCESS;
}

U8 *BpfSequencer::read_from_file(const char *fn, FwSizeType& size, const char*& err_msg) {
    // Open the file
    Os::File file;
    Os::File::Status openStatus = file.open(fn, Os::File::OPEN_READ);
    if (openStatus != Os::File::OP_OK) {
        err_msg = "Failed to open file";
        return nullptr;
    }

    // Get the size of the file
    Os::File::Status sizeStatus = file.size(size);
    if (sizeStatus != Os::File::OP_OK) {
        file.close();
        err_msg = "Failed to retrieve file size";
        return nullptr;
    }

    // Allocate memory for the buffer
    U8 *buffer = new (std::nothrow) U8[size];
    if (buffer == nullptr) {
        file.close();
        err_msg = "Failed to allocate file buffer";
        return nullptr;
    }

    // Read the sequence file into memory
    Os::File::Status readStatus = file.read(buffer, size, Os::File::WAIT);
    if (readStatus != Os::File::OP_OK) {
        delete[] buffer;
        file.close();
        err_msg = "Failed to read file into buffer";
        return nullptr;
    }

    file.close();
    return buffer;
}

bool BpfSequencer::validate_vm_id(U32 vmId) {
    if (vmId >= k_num_vms) {
        return false;
    }
    return true;
}

bool BpfSequencer::get_map_by_fd(U32 fd, map*& map, Fw::LogStringArg& command_name) {
    map = reinterpret_cast<Components::map*>(maps::map_by_fd(fd));
    if (!map) {
        Fw::LogStringArg errMsg("Map does not exist");
        this->log_ACTIVITY_HI_MapCommandFailed(command_name, errMsg);
        return false;
    }
    return true;
}

bool BpfSequencer::validate_data_size(U32 size, bool key, map* map, Fw::LogStringArg& command_name) {
    U32 expected_size = key ? map->key_size : map->value_size;

    if (size != expected_size) {
        Fw::LogStringArg dataType(key ? "key" : "value");
        this->log_ACTIVITY_HI_MapDataSizeMismatch(command_name, dataType, expected_size, size);
        return false;
    }
    return true;
}

Fw::Success BpfSequencer::map_create(const bpf_map_def& map_def, U32 fd) {
    Fw::LogStringArg commandName("BPF_MAP_CREATE");
    I32 res;

    res = this->maps.create_map(map_def, fd);
    if (res) {
        Fw::LogStringArg errMsg("Failed to create maps");
        this->log_ACTIVITY_HI_MapCommandFailedErrno(commandName, errMsg, CREATE_ERRNO_MSG(res));
        return Fw::Success::FAILURE;
    }

    this->log_DIAGNOSTIC_MapCommandSuccess(commandName);
    this->log_ACTIVITY_HI_MapCreated(fd);
    return Fw::Success::SUCCESS;
}

Fw::Success BpfSequencer::map_lookup_elem(U32 fd, U8* key, U32 key_size, const char* output_path) {
    Fw::LogStringArg commandName("BPF_MAP_LOOKUP_ELEM");

    map* map;
    if (!get_map_by_fd(fd, map, commandName))
        return Fw::Success::FAILURE;
    if (!validate_data_size(key_size, true, map, commandName))
        return Fw::Success::FAILURE;

    FwSizeType size = map->value_size;
    auto elem = static_cast<U8*>(map->lookup_elem(key));
    if (!elem) {
        Fw::LogStringArg errMsg("Invalid key");
        this->log_ACTIVITY_HI_MapCommandFailed(commandName, errMsg);
        return Fw::Success::FAILURE;
    }

    Os::File file;
    Os::File::Status fileStatus;
    fileStatus = file.open(output_path, Os::File::OPEN_CREATE);
    if (fileStatus != Os::File::OP_OK) {
        Fw::LogStringArg errMsg("Failed to open file");
        this->log_ACTIVITY_HI_MapCommandFailed(commandName, errMsg);
        return Fw::Success::FAILURE;
    }
    fileStatus = file.write(elem, size);
    if (fileStatus != Os::File::OP_OK) {
        Fw::LogStringArg errMsg("Failed to write to file");
        this->log_ACTIVITY_HI_MapCommandFailed(commandName, errMsg);
        return Fw::Success::FAILURE;
    }
    file.flush();
    file.close();

    this->log_DIAGNOSTIC_MapCommandSuccess(commandName);
    return Fw::Success::SUCCESS;
}

Fw::Success BpfSequencer::map_update_elem(U32 fd, U8* key, U32 key_size, U8* value, U32 value_size, U64 flags) {
    Fw::LogStringArg commandName("BPF_MAP_UPDATE_ELEM");

    map* map;
    if (!get_map_by_fd(fd, map, commandName))
        return Fw::Success::FAILURE;
    if (!validate_data_size(key_size, true, map, commandName))
        return Fw::Success::FAILURE;
    if (!validate_data_size(value_size, false, map, commandName))
        return Fw::Success::FAILURE;

    auto res = map->update_elem(key, value, flags);
    if (res) {
        Fw::LogStringArg errMsg("Failed to update element");
        this->log_ACTIVITY_HI_MapCommandFailedErrno(commandName, errMsg, CREATE_ERRNO_MSG(res));
        return Fw::Success::FAILURE;
    }

    this->log_DIAGNOSTIC_MapCommandSuccess(commandName);
    return Fw::Success::SUCCESS;
}

Fw::Success BpfSequencer::map_delete_elem(U32 fd, U8* key, U32 key_size) {
    Fw::LogStringArg commandName("BPF_MAP_DELETE_ELEM");

    map* map;
    if (!get_map_by_fd(fd, map, commandName))
        return Fw::Success::FAILURE;
    if (!validate_data_size(key_size, true, map, commandName))
        return Fw::Success::FAILURE;

    auto res = map->delete_elem(key);
    if (res) {
        Fw::LogStringArg errMsg("Failed to delete element");
        this->log_ACTIVITY_HI_MapCommandFailedErrno(commandName, errMsg, CREATE_ERRNO_MSG(res));
        return Fw::Success::FAILURE;
    }

    this->log_DIAGNOSTIC_MapCommandSuccess(commandName);
    return Fw::Success::SUCCESS;
}
}  // namespace Components
