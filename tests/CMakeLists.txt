# Standalone on-target microbenchmark, not an fprime module -- just an
# executable that links against BpfSequencer's iter_num helpers and
# shared_mutex for its Section 4/5 measurements. register_fprime_executable
# (not plain add_executable) is required so it picks up the same OS/platform
# implementation selection (Os::MutexInterface delegate, etc.) the
# BPFPrimeTest deployment gets automatically.
register_fprime_executable(
    latency_test
    SOURCES
        "${CMAKE_CURRENT_LIST_DIR}/latency_test.cpp"
    DEPENDS
        Components_BpfSequencer
)

# Standalone WAMR JIT diagnostic (see wasm_jit_diag.cpp) -- links directly
# against vmlib (WasmSequencer's WAMR build) instead of going through
# Components_WasmSequencer/BPFPrimeTest, so it stays a throwaway tool with no
# footprint on the deployed test binary. Also depends on Components_BpfSequencer
# purely to pull in its LLVM "nativecodegen" component (RISCV target init) --
# vmlib's own LLVM_LIBS list omits it and only resolves inside BPFPrimeTest
# because llvmbpf's libraries happen to be linked into the same binary there.
register_fprime_executable(
    wasm_jit_diag
    SOURCES
        "${CMAKE_CURRENT_LIST_DIR}/wasm_jit_diag.cpp"
    DEPENDS
        Components_BpfSequencer
)
target_link_libraries(wasm_jit_diag PUBLIC vmlib -lm)
