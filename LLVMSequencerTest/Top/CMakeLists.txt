####
# F prime CMakeLists.txt:
#
# SOURCE_FILES: combined list of source and autocoding files
# MOD_DEPS: (optional) module dependencies
####

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCE_FILES
  "${CMAKE_CURRENT_LIST_DIR}/instances.fpp"
  # Note: Uncomment when using Svc:TlmPacketizer
  #"${CMAKE_CURRENT_LIST_DIR}/LLVMSequencerTestPackets.xml"
  "${CMAKE_CURRENT_LIST_DIR}/topology.fpp"
  "${CMAKE_CURRENT_LIST_DIR}/LLVMSequencerTestTopology.cpp"
)
set(MOD_DEPS
  Fw/Logger
  # Communication Implementations
  Drv/Udp
  Drv/TcpClient
)

register_fprime_module()
