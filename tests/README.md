# Paper tests

## Building tests
We need to use our fork of LLVM with the BPF float patches to build the binaries for this test.

```bash
# Generate LLVM bitcode
clang -emit-llvm -S program.bpf.c -O3 -target bpf -mcpu=duotronic -fno-unroll-loops

# Convert LLVM IR into BPF
llc -march=bpf -mcpu=duotronic -filetype=obj -o program.bpf.o -O0 --print-after-isel -bpf-stack-size=10000 program.bpf.ll

# Strip out non-text sections of the generated ELF object file
llvm-objcopy -O binary --only-section=.text program.bpf.o a.o
```

## Compiling Sequences
```bash
# In bpf-prime, replace kalman with your desired test
fprime-seqgen tests/kalman/sequence.seq -d build-artifacts/Linux/BPFPrimeTest/dict/BPFPrimeTestTopologyDictionary.json
```

Pass `sequence.bin` into cmdSeq.CS_RUN 