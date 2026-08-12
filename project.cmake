# This CMake file is intended to register project-wide objects.
# This allows for reuse between deployments, or other projects.

add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/Ports/")
add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/Components")
add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/BPFPrimeTest/")

# Standalone on-target microbenchmarks -- plain executables, not fprime modules.
add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/tests")
