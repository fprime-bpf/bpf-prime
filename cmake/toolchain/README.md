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
./configure --build=x86_64-linux-gnu --host=riscv64-unknown-linux-gnu --prefix=$(pwd)/../riscv/sysroot --enable-maintainer-mode
make && make install
```

It may fail at `libcpu`, but that's fine since we only need the `libelf` library to be linked. Cross-compiling is a pain sometimes.

Our last dependency is the custom fork of LLVM we use to compile BPF programs. We'll also need to build this in the same way.
```bash
cd llvm-project
mkdir build && cd build
CC=clang CXX=clang++ cmake -G Ninja -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DCMAKE_BUILD_TYPE=Release -DLLVM_TARGETS_TO_BUILD=BPF\;RISCV -DLLVM_USE_LINKER=lld -DCMAKE_TOOLCHAIN_FILE=../../riscv.cmake -DHAVE_POSIX_REGEX=0 -DHAVE_STEADY_CLOCK=0 -DLLVM_HOST_TRIPLE=riscv64-linux-gnu -DLLVM_TARGET_ARCH=riscv64 -DLLVM_USE_HOST_TOOLS=ON ../llvm
ninja
```
To generate code for RISC-V, we need to set `LLVM_TARGETS_TO_BUILD`. We also need to set `LLVM_HOST_TRIPLE` and `LLVM_TARGET_ARCH` to tell the JIT that we're compiling for RISC-V. `LLVM_USE_LINKER=lld` uses the LLVM `lld` instead of the GCC `ld` to link, which speeds up cross-compile builds. We also turn off `HAVE_POSIX_REGEX` and `HAVE_STEADY_CLOCK` as the toolchain doesn't include these libs. Since we're cross compiling, we need to generate native versions of `llvm-tblgen` to compile the `.td` files that LLVM uses for code generation info.

Finally, we can target RISC-V when generating our BPF-Prime deployment by linking in our cross-compiled LLVM libs:
```bash
virtualenv venv
source venv/bin/activate
pip install -r lib/fprime/requirements.txt

CC=clang CXX=clang++ fprime-util generate riscv -DCMAKE_EXPORT_COMPILE_COMMANDS=ON -DLLVM_DIR=$(pwd)/cmake/toolchain/llvm-project/build/lib/cmake/llvm
fprime-util build riscv
```
