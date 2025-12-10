SHELL := /bin/bash

riscv:
	. venv/bin/activate && \
	rm -rf build-fprime-automatic-riscv && \
	CC=clang CXX=clang++ fprime-util generate riscv \
	  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
	  -DLLVM_DIR="$(PWD)/cmake/toolchain/llvm-project/build/lib/cmake/llvm" \
	  -DUSE_SYSTEM_SPDLOG=ON \
	  -Dspdlog_DIR="$(PWD)/cmake/toolchain/spdlog/build" && \
	fprime-util build riscv && \
	llvm-strip --strip-unneeded ./build-artifacts/riscv/BPFPrimeTest/bin/BPFPrimeTest

.PHONY: riscv
