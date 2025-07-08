#!/bin/bash

# Build script for LLVP library

set -e

echo "Building LLVP library..."

# Create build directory
mkdir -p build
cd build

# Configure with CMake
cmake ..

# Build
make -j$(sysctl -n hw.ncpu 2>/dev/null || nproc 2>/dev/null || echo 1)

echo "Build completed successfully!"
echo "To test the library, run: ./test_version" 