# Check if arm-linux-gnueabi-as is installed
if ! which arm-linux-gnueabi-as > /dev/null; then
    echo "The ARM assembler is not installed. Attempting to install..."
    sudo apt-get update
    sudo apt-get install -y gcc-arm-linux-gnueabi
fi

# Check if arm-linux-gnueabi-ld is installed
if ! which arm-linux-gnueabi-ld > /dev/null; then
    echo "The ARM linker is not installed. Attempting to install..."
    sudo apt-get update
    sudo apt-get install -y binutils-arm-linux-gnueabi
fi

read -p "Enter the full path of the ARM assembly file (e.g., /path/to/Arm/hello.s): " ASSEMBLY_PATH

if [ ! -f "$ASSEMBLY_PATH" ]; then
    echo "Assembly file '$ASSEMBLY_PATH' not found."
    exit 1
fi

ASSEMBLY_DIR=$(dirname "$ASSEMBLY_PATH")
ASSEMBLY_FILENAME=$(basename -- "$ASSEMBLY_PATH")
BINARY_FILENAME="${ASSEMBLY_FILENAME%.*}"

arm-linux-gnueabi-as -o "$ASSEMBLY_DIR/$BINARY_FILENAME.o" "$ASSEMBLY_PATH"
if [ $? -ne 0 ]; then
    echo "Assembly failed."
    exit 1
fi

arm-linux-gnueabi-ld -o "$ASSEMBLY_DIR/$BINARY_FILENAME" "$ASSEMBLY_DIR/$BINARY_FILENAME.o"
if [ $? -ne 0 ]; then
    echo "Linking failed."
    exit 1
fi

rm "$ASSEMBLY_DIR/$BINARY_FILENAME.o"
echo "Assembly and linking completed. Binary file '$ASSEMBLY_DIR/$BINARY_FILENAME' created."
