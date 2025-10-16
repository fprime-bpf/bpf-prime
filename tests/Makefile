TARGETS := kalman low_pass_filter matmul

# example use case: 
# - PREFIX="../../llvm-project/build/bin" make all
ifndef PREFIX
$(error You must specify PREFIX=<path>, which is the path to your llvm-project bin/)
endif

all: $(TARGETS)

$(TARGETS):
	cd $@/ && \
	$(PREFIX)/clang -emit-llvm -S program.bpf.c -O3 -target bpf -mcpu=duotronic -fno-unroll-loops && \
	$(PREFIX)/llc -march=bpf -mcpu=duotronic -filetype=obj -o program.bpf.o -O0 --print-after-isel -bpf-stack-size=10000 program.bpf.ll && \
	$(PREFIX)/llvm-objcopy -O binary --only-section=.text program.bpf.o a.o

.PHONY: all $(TARGETS)
