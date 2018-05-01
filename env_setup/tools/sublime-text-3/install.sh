#!/bin/bash

INSTALL_PATH="${HOME}/.config/sublime-text-3"
INSTALL_LIST=(
    Packages/User
    )

for d in "${INSTALL_LIST[@]}"; do
    if [[ -e ${INSTALL_PATH}/${d} ]]; then
        TARGET=$(realpath ${d})
        rm ${INSTALL_PATH}/${d} -rf
        ln -s ${TARGET} ${INSTALL_PATH}/${d}
    fi
done