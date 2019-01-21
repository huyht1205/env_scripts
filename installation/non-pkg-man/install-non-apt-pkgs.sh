#!/bin/bash

# --- INPUT --- #
INSTALLING_PKGS=()

# --- VARIABLES --- #
SCRIPT=$(basename ${BASH_SOURCE[0]})
SCRIPT_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
LIST=(
    code            https://go.microsoft.com/fwlink/?LinkID=760868
    google-chrome   https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
)

# --- ARGS --- #
USAGE="\
$(basename ${BASH_SOURCE[0]}) [OPTIONS]\n\
    -h: this message\n\
"
while getopts h opt; do
    case "${opt}" in
        h)
            printf "${USAGE}"
            exit 0
            ;;
    esac
done

# --- LOG --- #
function log()
{
        printf "[LOG] ${@}\n"
}

function warn()
{
        printf "[WARNING] ${@}\n"
}

function error()
{
        printf "[ERROR] ${@}\n"
}

# --- MAIN --- #
function main()
{
    check_input
    install_deb_packages
}

# --- SUB FUNCTIONS --- #
function check_input()
{
    :
}

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


main
