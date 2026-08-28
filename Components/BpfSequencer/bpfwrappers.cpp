#include "Components/BpfSequencer/BpfSequencer.hpp"
#include "Components/BpfSequencer/cpu_cycles.hpp"
#include "Components/BpfSequencer/llvmbpf/include/llvmbpf.hpp"
#include "bpf.hpp"
#include "maps/maps.hpp"

#include <algorithm>
#include <cctype>
#include <chrono>
#include <cstring>
#include <filesystem>
#include <fstream>
#include <limits>
#include <memory>
#include <new>
#include <stdexcept>
#include <string>
#include <utility>
#include <vector>

#define CREATE_ERRNO_MSG(res) Fw::LogStringArg(std::strerror(-res))

namespace Components {

namespace {

std::string trim(const std::string& value) {
    const auto first = std::find_if_not(value.begin(), value.end(), [](unsigned char ch) { return std::isspace(ch); });
    const auto last = std::find_if_not(value.rbegin(), value.rend(), [](unsigned char ch) { return std::isspace(ch); }).base();
    return first < last ? std::string(first, last) : std::string();
}

long long parse_integer(const std::string& value, const char* field, std::size_t line_number) {
    std::size_t parsed = 0;
    long long result;

    try {
        result = std::stoll(value, &parsed);
    } catch (const std::exception&) {
        throw std::runtime_error("invalid " + std::string(field) + " at line " + std::to_string(line_number));
    }

    if (parsed != value.size()) {
        throw std::runtime_error("invalid " + std::string(field) + " at line " + std::to_string(line_number));
    }
    return result;
}

std::vector<bpftime::TimeLoc> load_snapshot_locations(const std::filesystem::path& path,
                                                       const std::filesystem::path& program_dir,
                                                       U16 expected_split) {
    std::ifstream input(path);
    if (!input) {
        throw std::runtime_error("cannot open " + path.string());
    }

    enum class Section { NONE, META, DATA };
    Section section = Section::NONE;
    std::string configured_dir;
    long long configured_split = -1;
    std::vector<bpftime::TimeLoc> locations;
    bpftime::TimeLoc* current = nullptr;
    std::string line;
    std::size_t line_number = 0;

    while (std::getline(input, line)) {
        ++line_number;
        const auto content = trim(line);
        if (content.empty() || content.front() == '#') {
            continue;
        }
        if (content == "meta:") {
            section = Section::META;
            continue;
        }
        if (content == "data:") {
            section = Section::DATA;
            continue;
        }

        if (section == Section::META) {
            const auto separator = content.find(':');
            if (separator == std::string::npos) {
                throw std::runtime_error("invalid metadata at line " + std::to_string(line_number));
            }
            const auto key = trim(content.substr(0, separator));
            const auto value = trim(content.substr(separator + 1));
            if (key == "dir") {
                configured_dir = value;
            } else if (key == "split") {
                configured_split = parse_integer(value, "split", line_number);
            }
            continue;
        }

        if (section != Section::DATA || content.rfind("- ", 0) != 0) {
            throw std::runtime_error("invalid configuration at line " + std::to_string(line_number));
        }

        auto item = trim(content.substr(2));
        const auto separator = item.find(':');
        if (separator == std::string::npos) {
            const auto pc = parse_integer(item, "program counter", line_number);
            if (pc < 0 || pc > std::numeric_limits<uint16_t>::max()) {
                throw std::runtime_error("program counter is out of range at line " + std::to_string(line_number));
            }
            locations.push_back({static_cast<uint16_t>(pc), {}});
            current = &locations.back();
            continue;
        }

        const auto key = trim(item.substr(0, separator));
        const auto value = trim(item.substr(separator + 1));
        if (value.empty()) {
            const auto pc = parse_integer(key, "program counter", line_number);
            if (pc < 0 || pc > std::numeric_limits<uint16_t>::max()) {
                throw std::runtime_error("program counter is out of range at line " + std::to_string(line_number));
            }
            locations.push_back({static_cast<uint16_t>(pc), {}});
            current = &locations.back();
            continue;
        }

        if (current == nullptr) {
            throw std::runtime_error("loop location has no program counter at line " + std::to_string(line_number));
        }
        const auto offset = parse_integer(key, "loop offset", line_number);
        const auto iteration = parse_integer(value, "loop iteration", line_number);
        if (offset < std::numeric_limits<int16_t>::min() || offset > std::numeric_limits<int16_t>::max()) {
            throw std::runtime_error("loop offset is out of range at line " + std::to_string(line_number));
        }
        current->time.push_back({static_cast<int16_t>(offset), iteration});
    }

    if (configured_dir.empty() || configured_split < 0) {
        throw std::runtime_error("configuration metadata is incomplete");
    }
    if (std::filesystem::path(configured_dir).lexically_normal() != program_dir.lexically_normal()) {
        throw std::runtime_error("configuration program does not match " + program_dir.string());
    }
    if (configured_split != expected_split) {
        throw std::runtime_error("configuration split does not match its file name");
    }
    if (locations.size() != expected_split) {
        throw std::runtime_error("configuration data count does not match split");
    }
    return locations;
}

}  // namespace

Fw::Success BpfSequencer::load(U32 vmId,
                               const char* sequenceFilePath,
                               U16 splitInto,
                               const char* benchmark_output_file) {
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
        this->log_WARNING_HI_RegisterFunctionsFailed(vmId, Fw::LogStringArg(std::strerror(-res)));
        return Fw::Success::FAILURE;
    }

    // Read sequence file into buffer
    FwSizeType size_result;
    const char* err_msg;
    this->buffer = read_from_file(sequenceFilePath, size_result, err_msg);
    if (!this->buffer) {
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, Fw::LogStringArg(err_msg));
        return Fw::Success::FAILURE;
    }

    // vm->bpf_mem_size = 40000;
    // vm->bpf_mem = std::make_unique<uint8_t[]>(vm->bpf_mem_size);
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

    if (splitInto == 0) {
        Fw::LogStringArg errMsg("splitInto must be non-zero");
        this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
        return Fw::Success::FAILURE;
    }

    alignas(8) static std::byte ds[50000], cs[200];  // hardcode size for now.
    static bpftime::ExecState a{.heap = nullptr, .dataStack = ds, .callStack = cs};

    std::vector<bpftime::TimeLoc> snapshot_locations;
    if (benchmark_output_file != nullptr) {
        const std::filesystem::path program_dir = std::filesystem::path(sequenceFilePath).parent_path();
        const auto program_name = program_dir.filename().string();
        const auto config_path =
            std::filesystem::path("configs") / (program_name + "-" + std::to_string(splitInto) + ".yml");
        try {
            snapshot_locations = load_snapshot_locations(config_path, program_dir, splitInto);
        } catch (const std::exception& error) {
            Fw::LogStringArg errMsg(error.what());
            this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
            delete[] this->buffer;
            this->buffer = nullptr;
            return Fw::Success::FAILURE;
        }
    }

    auto compile_res = vm->bpf_vm.compileWithSS2(&a, 4, 10000, snapshot_locations);
    // auto compile_res = vm->bpf_vm.compile(&a);
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
    uint64_t start, end;

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
        start = get_cpu_cycles();

    // Run the compiled sequence using VM's own bpf_mem
    err = vm->bpf_vm.exec(nullptr, 0, vm->res);  // lol this is bugged, should be vm->bpf_mem.get(). this didn't cause
                                                 // any problem bc no tests used this mem.

    if (log_time)
        end = get_cpu_cycles();

    if (err) {
        Fw::LogStringArg errMsg(vm->bpf_vm.get_error_message().c_str());
        this->log_ACTIVITY_HI_CommandRunFailed(vmId, errMsg);
        return Fw::Success::FAILURE;
    }

    if (log_time)
        this->log_ACTIVITY_LO_CommandRunSuccess(vmId, cpu_cycles_to_ns(end - start) / 1e6);
    return Fw::Success::SUCCESS;
}

U8* BpfSequencer::read_from_file(const char* fn, FwSizeType& size, const char*& err_msg) {
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
    U8* buffer = new (std::nothrow) U8[size];
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
