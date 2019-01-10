#!/bin/bash

TOOLCHAINS_DIR=${1}
KERNEL_DEFCONFIG=bcm2709_defconfig
KERNEL=kernel7
ARCH=arm
CROSS_COMPILE=${TOOLCHAINS_DIR}arm-linux-gnueabihf-