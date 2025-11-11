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

    // Create the VM
    if (!validate_vm_id(vmId))
        return Fw::Success::FAILURE;

    this->vms[vmId].reset();
    this->vms[vmId] = std::make_shared<BpfSequencerVM>();

    if (!vms[vmId]) {
        Fw::LogStringArg errMsg("Failed to allocate VM");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }
    auto vm = this->vms[vmId];
    
    I32 res = this->register_external_functions(vm->bpf_vm);
    if (res) {
        this->log_WARNING_HI_RegisterFunctionsFailed(
            vmId,
            Fw::LogStringArg(std::strerror(-res))
        );
        return Fw::Success::FAILURE;
    }

    I32 res = maps.register_functions(vm->bpf_vm);
    if (res) {
        this->log_WARNING_HI_RegisterFunctionsFailed(Fw::LogStringArg(std::strerror(-res)));
        return Fw::Success::FAILURE;
    }

    // Open the file
    Os::File file;
    Os::File::Status openStatus = file.open(sequenceFilePath, Os::File::OPEN_READ);
    if (openStatus != Os::File::OP_OK) {
        // File open failed, return error
        Fw::LogStringArg errMsg("Failed to open file");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    // Get the size of the file
    FwSizeType size_result = 0;
    Os::File::Status sizeStatus = file.size(size_result);
    if (sizeStatus != Os::File::OP_OK) {
        // File size retrieval failed, return error
        file.close();
        Fw::LogStringArg errMsg("Failed to retrieve file size");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    // Allocate memory for the buffer
    this->buffer = new (std::nothrow) U8[size_result];
    if (this->buffer == nullptr) {
        // Memory allocation failed, return error
        file.close();
        Fw::LogStringArg errMsg("Failed to allocate file buffer");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    // Read the sequence file into memory
    Os::File::Status readStatus = file.read(this->buffer, size_result, Os::File::WAIT);
    if (readStatus != Os::File::OP_OK) {
        // File read failed, return error
        delete[] this->buffer;
        file.close();
        Fw::LogStringArg errMsg("Failed to read file into buffer");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    file.flush();
    file.close();

    vm->bpf_mem_size = size_result;
    vm->bpf_mem = std::make_unique<uint8_t[]>(vm->bpf_mem_size);
    std::memcpy(vm->bpf_mem.get(), buffer, vm->bpf_mem_size);
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

    // Close the file and return successful command response
    this->log_ACTIVITY_HI_CommandLoaded(loggerFilePath, vmId);
    return Fw::Success::SUCCESS;
}

Fw::Success BpfSequencer::run(U32 vmId, bool log_time) {
    uint64_t err = 0;
    timer::time_point start, end;

    // Get VM instance
    if (!validate_vm_id(vmId))
        return Fw::Success::FAILURE;

    if (!vms[vmId]) {
        Fw::LogStringArg errMsg("VM ID Invalid");
        this->log_ACTIVITY_HI_CommandRunFailed(vmId, errMsg);
        return Fw::Success::FAILURE;
    }
    auto vm = this->vms[vmId];

    if (log_time)
        start = timer::now();
    // Run the compiled sequence
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

bool BpfSequencer::validate_vm_id(U32 vmId) {
    if (vmId >= BPF_PRIME_VM_COUNT) {
        Fw::LogStringArg errMsg("VM ID Invalid");
        this->log_ACTIVITY_HI_VmValidateFailed(vmId, errMsg);
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
