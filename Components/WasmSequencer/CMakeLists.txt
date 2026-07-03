####
# F Prime CMakeLists.txt:
#
# SOURCES: list of source files (to be compiled)
# AUTOCODER_INPUTS: list of files to be passed to the autocoders
# DEPENDS: list of libraries that this module depends on
#
# More information in the F´ CMake API documentation:
# https://fprime.jpl.nasa.gov/latest/docs/reference/api/cmake/API/
#
####

# Module names are derived from the path from the nearest project/library/framework
# root when not specifically overridden by the developer, i.e. the module defined by
# `MyProj/Some/Path/CMakeLists.txt` will be named `MyProj_Some_Path`.

set(WAMR_BUILD_JIT 1)
set(WAMR_BUILD_SIMD 1)
set(WAMR_BUILD_LIBC_WASI 1)
set(WAMR_BUILD_PLATFORM "linux")
set(WAMR_ROOT_DIR "${CMAKE_CURRENT_SOURCE_DIR}/wasm-micro-runtime")

find_package(LLVM REQUIRED CONFIG)

llvm_map_components_to_libnames(LLVM_LIBS
    Core
    Support
    Analysis
    ExecutionEngine
    MCJIT
    OrcJIT
    RuntimeDyld
    Target
    IRReader
    TransformUtils
    Passes
)

include(${WAMR_ROOT_DIR}/build-scripts/runtime_lib.cmake)
add_library(vmlib ${WAMR_RUNTIME_LIB_SOURCE})
target_include_directories(vmlib PUBLIC ${WAMR_ROOT_DIR}/core/iwasm/include)
target_link_libraries(vmlib PUBLIC ${LLVM_LIBS})

include (${SHARED_DIR}/utils/uncommon/shared_uncommon.cmake)

register_fprime_library(
    AUTOCODER_INPUTS
        "${CMAKE_CURRENT_LIST_DIR}/WasmSequencer.fpp"
    SOURCES
        "${CMAKE_CURRENT_LIST_DIR}/WasmSequencer.cpp"
        "${CMAKE_CURRENT_LIST_DIR}/wasmWrappers.cpp"
  DEPENDS
      Components_BpfSequencer
)

target_link_libraries("${MODULE_NAME}" PUBLIC vmlib -lm)

### Unit Tests ###
# register_fprime_ut(
#     AUTOCODER_INPUTS
#         "${CMAKE_CURRENT_LIST_DIR}/WasmSequencer.fpp"
#     SOURCES
#         "${CMAKE_CURRENT_LIST_DIR}/test/ut/WasmSequencerTestMain.cpp"
#         "${CMAKE_CURRENT_LIST_DIR}/test/ut/WasmSequencerTester.cpp"
#     DEPENDS
#         STest # For rules-based testing
#     UT_AUTO_HELPERS
# )
