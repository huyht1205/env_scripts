#!/bin/bash

function Lr_up()
{
	ssh root@192.168.10.190 'lr_power_control.sh up'
}

function Lr_down()
{
	ssh root@192.168.10.190 'lr_power_control.sh down'
}

function Lr_reset()
{
	ssh root@192.168.10.190 'lr_power_control.sh reset'
}

function Lr_setup()
{
	ssh root@192.168.10.190 'lr_power_control.sh setup'
}

function Change_IP_class()
{
    sudo ifconfig enx84afec7365aa 192.168.${1}.191
}

function Rootfs_deploy()
{
    MMC_DEV=${1}
    IMAGE=${2}

    if [[ -z ${1} || -z ${2} ]]; then
        print_info "Usage: Deploy_rootfs <device> <image.tar>\n"
        exit 1
    fi

    if [[ ! $(file ${IMAGE}) = *"POSIX tar archive (GNU)" ]]; then
        print_error "${IMAGE} is not tar archive file\n"
        exit 1
    fi

    MOUNT_POINT=/mnt

    sudo mkfs.ext4 ${MMC_DEV}
    sudo mount ${MMC_DEV} ${MOUNT_POINT} || exit 1
    sudo tar xf ${IMAGE} -C ${MOUNT_POINT} || exit 1
    sync
    sudo umount ${MMC_DEV}

    print_info "Finish. SDCard is unmounted.\n"
}

function Uboot_deploy()
{
    if [[ -z ${1} || -z ${2} ]]; then
        print_info "Usage: Uboot_deploy <u-boot> <dev>\n"
    fi

    if [[ ! -e ${1} ]]; then
        print_error "${1} is NOT found\n"
        return 1
    fi

    if [[ ! -e ${2} ]]; then
        print_error "${2} is NOT found\n"
        return 1
    fi

    sudo dd if=${1} of=${2} bs=1K seek=1 conv=fsync
    sync
}

function get_local_account()
{
    _USERNAME=$(head ${1} -n1)
    _PASSWORD=$(tail ${1} -n1)
}

function MountNetDrive()
{
    _ACCOUNT_FILE=${HOME}/.local_account
    get_local_account ${_ACCOUNT_FILE}

    _USER=$(whoami)
    _MOUNT_OPTS='-t cifs -o username='${_USERNAME}',password='${_PASSWORD}',rw,user,uid='${_USER}' -o vers=1.0'
    _SERVER_IP='192.168.1.12'
    _MOUNT_LOCATION='/data/ibridge'

    _DRIVE_LIST=(
        LRapp
        release
        common
        iBJ
    )

    for drive in "${_DRIVE_LIST[@]}"; do
        print_info "Mount ${drive}\n"
        sudo mount ${_MOUNT_OPTS} //${_SERVER_IP}/${drive} ${_MOUNT_LOCATION}/${drive}
    done
}
