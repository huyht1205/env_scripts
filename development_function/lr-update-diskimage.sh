#!/bin/bash

ROOT_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
source ${ROOT_DIR}/../env_setup/common/utils.sh

MOUNT_POINT=/mnt

if [[ -z ${1} || ! -e ${1} || -z ${2} || ! -e ${2} ]]; then
    print_info "Usage: $(basename ${0}) <disk image> <output dir>\n"
    exit -1
fi
DISK_IMAGE=$(realpath ${1})
OUTPUT_DIR=$(realpath ${2})

sudo kpartx -a ${DISK_IMAGE}

sleep 1

sudo mount   /dev/mapper/loop0p2    ${MOUNT_POINT}
sudo cp -rf  ${OUTPUT_DIR}/*        ${MOUNT_POINT}
sync

cd ${MOUNT_POINT}
sudo md5sum -c md5sum 1>/dev/null
if [[ ! ${?} -eq 0 ]]; then
    print_error "Fatal!!!\n"
fi

cd ${OLDPWD}
sudo umount ${MOUNT_POINT}

sudo kpartx -d ${DISK_IMAGE}