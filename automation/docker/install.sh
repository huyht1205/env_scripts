#!/bin/bash

# INPUT
DISTRO=${1}

# CONFIG
USAGE="$(basename ${BASH_SOURCE[0]}) <distro>"
SUPPORTED_DISTRO=(
    debian
)

function check_input() {
    if [[ -z ${DISTRO} ]]; then
        echo ${USAGE}
        echo "Supported distros: ${SUPPORTED_DISTRO[@]}"
        exit 1
    fi
}

function install_deps() {
    sudo apt-get install -y apt-transport-https ca-certificates \
        curl gnupg2 software-properties-common
}

function install_key() {
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
}

function add_repo() {
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable"
}

function install_docker() {
    sudo apt update
    sudo apt install -y docker-ce
}

function main() {
    check_input
    install_deps
    install_key
    add_repo
    install_docker
}

main