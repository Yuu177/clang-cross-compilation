set(TOOLCHAIN_PATH /opt/toolchains/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu)

set(CMAKE_CXX_COMPILER_FORCED 1) # fix error: is not able to compile a simple test program
set(CMAKE_C_COMPILER_FORCED 1)

set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

set(TARGET_TRIPLE aarch64-linux-gnu)
set(CMAKE_C_COMPILER_TARGET ${TARGET_TRIPLE})
set(CMAKE_CXX_COMPILER_TARGET ${TARGET_TRIPLE})

add_compile_options(
    --gcc-toolchain=${TOOLCHAIN_PATH}
    --sysroot ${TOOLCHAIN_PATH}/aarch64-none-linux-gnu/libc
    # -v # 输出详细的 debug 信息
)

add_link_options(
    --gcc-toolchain=${TOOLCHAIN_PATH}
    --sysroot ${TOOLCHAIN_PATH}/aarch64-none-linux-gnu/libc
    -fuse-ld=${TOOLCHAIN_PATH}/bin/aarch64-none-linux-gnu-ld
    # -v
)
