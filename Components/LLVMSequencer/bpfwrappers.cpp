#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"

namespace Components {

   Fw::Success LLVMSequencer::load(const char* sequenceFilePath) {
       delete[] this->buffer;
       Fw::LogStringArg loggerFilePath(sequenceFilePath);

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
       FwSignedSizeType size_result = 0;
       Os::File::Status sizeStatus = file.size(size_result);
       if (sizeStatus != Os::File::OP_OK) {
           // File size retrieval failed, return error
           file.close();
           Fw::LogStringArg errMsg("Failed to retrieve file size");
           this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
           return Fw::Success::FAILURE;
       }

       // Allocate memory for the buffer
       this->buffer = new U8[size_result];
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

       bpf_mem_size = size_result;
       bpf_mem = std::make_unique<uint8_t[]>(bpf_mem_size);
       std::memcpy(bpf_mem.get(), buffer, bpf_mem_size);

       // Load the binary into the VM
       auto load_res = vm.load_code(buffer, size_result);
       if (load_res) {
           delete[] this->buffer;
           Fw::LogStringArg errMsg(std::string("Failed to load binary into VM - " + vm.get_error_message()).c_str());
           this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
           return Fw::Success::FAILURE;
       }

       auto compile_res = vm.compile();
       if (!compile_res) {
           Fw::LogStringArg errMsg(std::string("Failed to compile BPF program - " + vm.get_error_message()).c_str());
           this->log_ACTIVITY_HI_CommandLoadFailed(loggerFilePath, errMsg);
           return Fw::Success::FAILURE;
       }

       // Close the file and return successful command response
       this->log_DIAGNOSTIC_CommandLoaded(loggerFilePath);
       return Fw::Success::SUCCESS; 
   }

   Fw::Success LLVMSequencer::run() {
       // Run the compiled sequence
       uint64_t res = 0, err = 0;
       Fw::LogStringArg loggerFilePath(sequenceFilePath.c_str());

       err = vm.exec(&bpf_mem, bpf_mem_size, res);
       if (err) {
           Fw::LogStringArg errMsg(vm.get_error_message().c_str());
           this->log_ACTIVITY_HI_CommandRunFailed(loggerFilePath, errMsg);
           return Fw::Success::FAILURE;
       }
       return Fw::Success::SUCCESS;
   }
}

