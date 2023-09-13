#!/bin/bash
# Copyright cc 2023 by p3h3n9

# init
function init() {
    echo "==========================="
    echo "= START COMPILING KERNEL  ="
    echo "==========================="
}
# Main 
function compile() {
    make -j$(nproc --all) O=out ARCH=arm64 <DEVICE>_defconfig
    make -j$(nproc --all) ARCH=arm64 O=out \
                          CROSS_COMPILE=aarch64-linux-gnu- \
                          CROSS_COMPILE_ARM32=arm-linux-gnueabi-
}
#end
function end(){
    echo "==========================="
    echo "   COPILE KERNEL COMPLETE  "
    echo "==========================="
}

# execute
init
compile
end
