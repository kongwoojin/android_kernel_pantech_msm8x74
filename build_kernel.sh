#!/bin/bash
###############################################################################
#
#                           Kernel Build Script 
#
###############################################################################

##############################################################################
# set toolchain
##############################################################################

if [ -z "$1"  ]; then
        echo "USAGE: $0 <device_defconfig>"
        echo "Example: $0 LineageOS_ef63_defconfig"
else

export ARCH=arm
export PATH=/home/chautruongthinh/cm-14.1/prebuilts/gcc/linux-x86/arm/arm-linux-androideabi-4.9/bin:$PATH
export CROSS_COMPILE=arm-linux-androideabi-

##############################################################################
# make zImage
##############################################################################
mkdir -p ./obj/KERNEL_OBJ/
make ARCH=arm O=./obj/KERNEL_OBJ/ $1
make -j8 ARCH=arm O=./obj/KERNEL_OBJ/ 2>&1 | tee kernel_log.txt

##############################################################################
# Make dt.img & copy zImage
##############################################################################
./mkdt.sh

fi
