#!/bin/bash

HOME_DIR=${PWD}

TARGET_LIST=(
    Code
    )

REMOVE_FROM_LIST=(
    install.sh
    )

for d in ${REMOVE_FROM_LIST[@]}; do
    TARGET_LIST=( "${TARGET_LIST[@]/$d}" )
done

for t in ${TARGET_LIST[@]}; do
    INSTALL_PATH="${HOME}/.config/${t}"
    cd ${t}
    INSTALL_LIST=(
        $(cat install_list)
        )

    for d in "${INSTALL_LIST[@]}"; do
        if [[ -e ${INSTALL_PATH}/${d} ]]; then
            TARGET=$(realpath ${d})
            rm ${INSTALL_PATH}/${d} -rf
            ln -s ${TARGET} ${INSTALL_PATH}/${d}
        fi
    done
    cd ${HOME_DIR}
done
