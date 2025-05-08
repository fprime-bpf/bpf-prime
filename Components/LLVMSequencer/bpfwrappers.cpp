#include "Components/LLVMSequencer/LLVMSequencer.hpp"
#include "Components/LLVMSequencer/llvmbpf/include/llvmbpf.hpp"

namespace Components {

   Fw::Success LLVMSequencer::load(const char* sequenceFilePath) {
       // Open the file
       Os::File file;
       Os::File::Status openStatus = file.open(sequenceFilePath, Os::File::OPEN_READ);
       if (openStatus != Os::File::OP_OK) {
           // File open failed, return error
           return Fw::CmdResponse::EXECUTION_ERROR;
       }

       // Get the size of the file
       U32 size_result = 0;
       Os::File::Status sizeStatus = file.getSize(size_result);
       if (sizeStatus != Os::File::OP_OK) {
           // File size retrieval failed, return error
           file.close();
           return Fw::CmdResponse::EXECUTION_ERROR;
       }

       // Allocate memory for the buffer
       U8* buffer = new U8[size_result];
       if (buffer == nullptr) {
           // Memory allocation failed, return error
           this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
           file.close();
           return Fw::CmdResponse::EXECUTION_ERROR;
       }

       // Read the sequence file into memory
       Os::File::Status readStatus = file.read(buffer, size_result, Os::File::WAIT);
       if (readStatus != Os::File::OP_OK) {
           // File read failed, return error
           this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
           delete[] buffer;
           file.close();
           return Fw::CmdResponse::EXECUTION_ERROR;
       }
      
       file.flush();
       file.close();

       bpf_mem_size = size_result;
       bpf_mem = std::make_unique<uint8_t[]>(bpf_mem_size);
       std::memcpy(bpf_mem.get(), buffer, bpf_mem_size);

       // Load the binary into the VM
       res = vm.load_code(buffer, size_result);
       if (res) {
           this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::EXECUTION_ERROR);
           delete[] buffer;
           return Fw::CmdResponse::EXECUTION_ERROR;
       }

       // Close the file and return successful command response
       delete[] buffer;
       this->cmdResponse_out(opCode, cmdSeq, Fw::CmdResponse::OK);
   }
   Fw::Success LLVMSequencer::compile() {
       // Compile the loaded sequence
       uint64_t res = vm.compile();
       if (res) {
           return Fw::CmdResponse::EXECUTION_ERROR;
       }
       return Fw::CmdResponse::OK;
   }

   Fw::Success LLVMSequencer::run() {
       // Run the compiled sequence
       uint64_t res = vm.run();
       if (res) {
           return Fw::CmdResponse::EXECUTION_ERROR;
       }
       return Fw::CmdResponse::OK;
   }

}

