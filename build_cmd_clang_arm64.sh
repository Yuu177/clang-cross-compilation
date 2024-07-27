#!/bin/bash
set -e

TOOLCHAIN_PATH=/opt/toolchains/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu
clang++ --gcc-toolchain=${TOOLCHAIN_PATH} \
        --sysroot ${TOOLCHAIN_PATH}/aarch64-none-linux-gnu/libc \
        --target=aarch64-linux-gnu \
        -fuse-ld=${TOOLCHAIN_PATH}/bin/aarch64-none-linux-gnu-ld \
        -v \
        main.cpp
