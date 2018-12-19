#!/bin/bash

LIST=(
    code            https://go.microsoft.com/fwlink/?LinkID=760868
    stride          https://desktop-downloads.stride.com/linux/deb/64/prod/stride_amd64.deb
    google-chrome   https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
)

function install_deb_packages() {
    for ((i = 0; i < ${#LIST[@]}; i+=2)); do
        _BIN=${LIST[i]}
        _LINK=${LIST[i+1]}
        echo "--- Installing ${_BIN} ---"
        if [[ ! -z $(which ${_BIN}) ]]; then
            echo "${_BIN} is already installed!"
            continue
        fi

        wget ${_LINK} -O ${_BIN}
        sudo dpkg -i ${_BIN}
        sudo apt -y --fix-broken install
        sudo dpkg -i ${_BIN}
        rm ${_BIN}

    done
}

function main() {
    install_deb_packages
}

main
