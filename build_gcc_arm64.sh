#!/bin/bash
set -e

rm -rf build
mkdir -p build 2>/dev/null
cd build

cmake -DCMAKE_TOOLCHAIN_FILE=../cmake/toolchain-gcc-arm64.cmake ..

make
