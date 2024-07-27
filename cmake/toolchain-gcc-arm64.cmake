# set(CMAKE_SYSTEM_NAME Linux)
# set(CMAKE_SYSTEM_PROCESSOR aarch64)

set(TOOLCHAIN_PATH /opt/toolchains/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin)
set(CMAKE_C_COMPILER ${TOOLCHAIN_PATH}/aarch64-none-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PATH}/aarch64-none-linux-gnu-g++)
