#!/usr/bin/env bash
source ~ / env / color / color_print.sh

path = "$(cd $(dirname $0) && pwd)"

if [ ! -d "${path}/build" ]; then
	echo "del CMakeCache.txt"
	rm -f ${path} / build/CMakeCache.txt
fi

LLVM=/home/jayson/jayson/buddy-mlir/llvm

cmake -B build \
  -DCMAKE_BUILD_TYPE=Debug \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
  -DCMAKE_PREFIX_PATH=${LLVM}/build/lib/cmake/mlir \
  -S./ \
  -GNinja

cmake --build build