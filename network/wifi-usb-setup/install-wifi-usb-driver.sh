#!/bin/bash

INSTALL_MODULE=${1}
MODULE_PATH=/lib/modules/$(uname -r)
USAGE="${0} <module-name>"

DRIVER_LIST=(
    rtl8812au 8812au.ko    https://github.com/gnab/rtl8812au.git
    rtl8812bu rtl8822bu.ko https://github.com/ulli-kroll/rtl8822bu.git 
)

for (( i=0; i < ${#DRIVER_LIST[@]}; i+=3 )); do 
    MODULE_NAME=${DRIVER_LIST[i]}
    MODULE_KO=${DRIVER_LIST[i+1]}
    DRIVER_REPO=${DRIVER_LIST[i+2]}
    MODULE_BUILD_DIR=${MODULE_NAME}

    if [[ ${MODULE_NAME} == ${INSTALL_MODULE} ]]; then
        if [[ ! -e ${MODULE_PATH}/${MODULE_KO} ]]; then
            git clone ${DRIVER_REPO} ${MODULE_BUILD_DIR}
            make -C ${MODULE_BUILD_DIR}
            sudo cp ${MODULE_BUILD_DIR}/${MODULE_KO} ${MODULE_PATH}
            rm -rf ${MODULE_BUILD_DIR}
        fi
        sudo modprobe cfg80211
        sudo insmod ${MODULE_PATH}/${MODULE_KO}
        exit 0
    fi
done

echo ${USAGE}
echo "Supported modules:"
for (( i=0; i < ${#DRIVER_LIST[@]}; i+=3 )); do 
    echo "   ${DRIVER_LIST[i]}"
done
