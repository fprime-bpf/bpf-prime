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
