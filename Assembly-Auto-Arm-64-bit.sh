#!/bin/bash

# Check if aarch64-linux-gnu-as is installed
if ! which aarch64-linux-gnu-as > /dev/null; then
    echo "The ARM64 assembler is not installed. Attempting to install..."
    sudo apt-get update
    sudo apt-get install -y gcc-aarch64-linux-gnu
fi

# Check if aarch64-linux-gnu-ld is installed
if ! which aarch64-linux-gnu-ld > /dev/null; then
    echo "The ARM64 linker is not installed. Attempting to install..."
    sudo apt-get update
    sudo apt-get install -y binutils-aarch64-linux-gnu
fi

read -p "Enter the full path of the ARM64 assembly file (e.g., /path/to/Arm64/hello.s): " ASSEMBLY_PATH

if [ ! -f "$ASSEMBLY_PATH" ]; then
    echo "Assembly file '$ASSEMBLY_PATH' not found."
    exit 1
fi

ASSEMBLY_DIR=$(dirname "$ASSEMBLY_PATH")
ASSEMBLY_FILENAME=$(basename -- "$ASSEMBLY_PATH")
BINARY_FILENAME="${ASSEMBLY_FILENAME%.*}"

aarch64-linux-gnu-as -o "$ASSEMBLY_DIR/$BINARY_FILENAME.o" "$ASSEMBLY_PATH"
if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

aarch64-linux-gnu-ld -o "$ASSEMBLY_DIR/$BINARY_FILENAME" "$ASSEMBLY_DIR/$BINARY_FILENAME.o"
if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi

rm "$ASSEMBLY_DIR/$BINARY_FILENAME.o"
echo "Assembly and linking completed. Binary file '$ASSEMBLY_DIR/$BINARY_FILENAME' created."

