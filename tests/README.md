# Paper tests

## Building tests
We need to use our fork of LLVM with the BPF float patches to build the binaries for this test.

```bash
# Generate LLVM bitcode
clang -emit-llvm -S program.bpf.c -O0 -target aarch64-unknown-linux

# Convert LLVM IR into BPF
llc -march=bpf -mcpu=duotronic -O0 -filetype=obj -o program.bpf.o program.bpf.ll --print-after-isel -bpf-stack-size=10000

# Strip out non-text sections of the generated ELF object file
llvm-objcopy -O binary --only-section=.text program.bpf.o a.o
```
