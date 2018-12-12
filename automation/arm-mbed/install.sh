#!/bin/bash

function install_deps() {
    sudo apt -y install python3-pip
}

function install_mbed_cli() {
    pip3 install mbed-cli
}

function install_bash_completion() {
    git clone --depth 1 https://github.com/ARMmbed/mbed-cli.git
    sudo cp mbed-cli/tools/bash_completion/mbed /usr/share/bash-completion/completions
    rm -rf mbed-cli
}

function main() {
    install_deps
    install_mbed_cli
    install_bash_completion
}

main