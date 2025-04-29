# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-src"
  "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-build"
  "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-subbuild/spdlog-populate-prefix"
  "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-subbuild/spdlog-populate-prefix/tmp"
  "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-subbuild/spdlog-populate-prefix/src/spdlog-populate-stamp"
  "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-subbuild/spdlog-populate-prefix/src"
  "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-subbuild/spdlog-populate-prefix/src/spdlog-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-subbuild/spdlog-populate-prefix/src/spdlog-populate-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/rpendergrast/llvmSeq/LLVMSequencer/lib/fprime/Svc/FpySequencer/llvmbpf/build/_deps/spdlog-subbuild/spdlog-populate-prefix/src/spdlog-populate-stamp${cfgdir}") # cfgdir has leading slash
endif()
