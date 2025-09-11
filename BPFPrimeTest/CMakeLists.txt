#####
# 'BPFPrimeTest' Deployment:
#
# This registers the 'BPFPrimeTest' deployment to the build system. 
# Custom components that have not been added at the project-level should be added to 
# the list below.
#
#####

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

###
# Topology and Components
###

add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/Top/")

# Add custom components to this specific deployment here
# add_fprime_subdirectory("${CMAKE_CURRENT_LIST_DIR}/MyComponent/")

include_directories(${PROJECT_SOURCE_DIR}/Components/BpfSequencer/llvmbpf)
include_directories(${CMAKE_BINARY_DIR}/llvmbpf)
include_directories(${PROJECT_SOURCE_DIR}/Components/BpfSequencer/llvmbpf/src)

register_fprime_deployment(
    SOURCES
        "${CMAKE_CURRENT_LIST_DIR}/Main.cpp"
    DEPENDS
        ${FPRIME_CURRENT_MODULE}_Top
)
