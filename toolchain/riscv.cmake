set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR riscv64)

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

set(CMAKE_AR llvm-ar)
set(CMAKE_NM llvm-nm)
set(CMAKE_RANLIB llvm-ranlib)

set(CMAKE_FIND_ROOT_PATH "${CMAKE_CURRENT_LIST_DIR}/riscv64")
set(TOOLCHAIN "${CMAKE_CURRENT_LIST_DIR}/riscv64")
set(CMAKE_SYSROOT "${TOOLCHAIN}/sysroot")

set(CMAKE_C_COMPILER_EXTERNAL_TOOLCHAIN "${TOOLCHAIN}")
set(CMAKE_CXX_COMPILER_EXTERNAL_TOOLCHAIN "${TOOLCHAIN}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

add_compile_options(
	--target=riscv64-unknown-linux-gnu
)

add_link_options(
	--target=riscv64-unknown-linux-gnu
	-fuse-ld=lld
)
