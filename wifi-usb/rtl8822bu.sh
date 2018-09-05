#!/bin/bash

MODULE_NAME=rtl8822bu
MODULE_BUILD_DIR=${MODULE_NAME}
MODULE_PATH=/lib/modules/$(uname -r)

if [[ ! -e ${MODULE_PATH}/${MODULE_NAME}.ko ]]; then
    git clone https://github.com/ulli-kroll/rtl8822bu.git ${MODULE_NAME}
    make -C ${MODULE_BUILD_DIR}
    sudo cp ${MODULE_BUILD_DIR}/rtl8822bu.ko ${MODULE_PATH}
    rm -rf ${MODULE_BUILD_DIR}
fi

sudo modprobe cfg80211
sudo insmod ${MODULE_PATH}/rtl8822bu.ko
