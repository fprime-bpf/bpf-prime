# Building BPF-Prime for Polarfire RISC-V SoCs

The ideal way to build BPF-Prime for Polarfire is to use latest Clang, while linking to the older libstdc++ used by the Polarfire SoC. First, grab
a RISCV64 glibc toolchain from [here](https://github.com/riscv-collab/riscv-gnu-toolchain/releases/tag/2021.12.22), as well as [zlib](https://zlib.net/) and [elfutils](https://sourceware.org/elfutils/)
source releases. We'll have to install those into the sysroot provided by the toolchain. Once downloaded, extract the files into this directory.

For the first build step, we'll use the toolchain's C compiler to build and install zlib, which LLVM needs:
```bash
cd zlib-1.3.1
CC=../riscv/bin/riscv64-unknown-linux-gnu-gcc ./configure --prefix=../riscv/sysroot/usr
make && make install
```

Next, let's do the same thing for the elfutils dependency, which LLVM also relies on:
```bash
cd elfutils-0.193
export PATH="$(pwd)/../riscv/bin:$PATH"
./configure --build=x86_64-linux-gnu --host=riscv64-unknown-linux-gnu --prefix=$(pwd)../riscv/sysroot --enable-maintainer-mode
make && make install
```

It may fail at `libcpu`, but that's fine since we only need the `libelf` library to be linked. Cross-compiling is a pain sometimes.

Our last dependency is the custom fork of LLVM we use to compile BPF programs. We'll also need to build this in the same way.
```bash
cd llvm-project
mkdir build && cd build
CC=clang CXX=clang++ cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=RelWithDebInfo -DLLVM_TARGETS_TO_BUILD=BPF\;RISCV -DLLVM_USE_LINKER=lld -DCMAKE_TOOLCHAIN_FILE=../../riscv.cmake -DHAVE_POSIX_REGEX=0 -DHAVE_STEADY_CLOCK=0 -DLLVM_DEFAULT_TARGET_TRIPLE=riscv64-oe-linux ../llvm
ninja
```

Finally, we can target RISC-V when generating our BPF-Prime deployment:
```bash
CC=clang CXX=clang++ fprime-util generate riscv -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DLLVM_DIR=toolchain/llvm-project/build/lib/cmake/llvm
ninja
```

