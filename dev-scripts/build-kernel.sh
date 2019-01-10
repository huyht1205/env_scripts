#!/bin/bash

THIS_DIR=$(realpath $(dirname ${BASH_SOURCE[0]}))
BOARD_CONF=${THIS_DIR}/board-configs
BOARD=""
CONFIG=""
TOOLCHAINS_DIR=""

SUPPORTED_BOARDS=(
    rpi3b+
)

USAGE="$(basename ${BASH_SOURCE[0]}) -b <board> -t <toolchains dir> [options]\n\
    -h : print this message\n\
    -b <target board name>\n\
        (Supported: ${SUPPORTED_BOARDS[@]})\n\
    -t <dir to toolchains>\n\
    -c <configs (menuconfig, ...)>\n\
"

while getopts hb:c:t: opt; do
    case "${opt}" in
        h)
            printf "${USAGE}"
            exit 0
            ;;
        b)
            BOARD=${OPTARG}
            if [[ ! -e ${BOARD_CONF}/${BOARD}-kernel.sh ]]; then
                echo "ERROR: ${BOARD} is not supported."
                echo "Supported boards: ${SUPPORTED_BOARDS[@]}"
                exit 1
            fi
            ;;
        c)
            CONFIG=${OPTARG}
            if [[ ${CONFIG} == "defconfig" ]]; then
                CONFIG=${KERNEL_DEFCONFIG}
            fi
            ;;
        t)
            TOOLCHAINS_DIR=${OPTARG}
            ;;
        *)
            printf "WARNING: ${opt} option is unrecognized."
            ;;
    esac
done

function check_input() {
    if [[ -z ${BOARD} ]]; then
        exit_require_argument '-b'
    fi
}

function print_settings() {
    echo ""
    echo "---SETTINGS ---"
    echo ""
    echo "   - BOARD          : ${BOARD}"
    echo "   - ARCH           : ${ARCH}"
    echo "   - CROSS_COMPILE  : ${CROSS_COMPILE}"
    echo ""
    echo "--- END OF SETTINGS ---"
    echo ""
}

function exit_require_argument() {
    _ARG=${1}
    echo "ERROR: missing argument '${_ARG}'"
    echo "Use '-h' for more information"
    exit 1
}

function init_board_config() {
    source ${BOARD_CONF}/${BOARD}-kernel.sh
}

function main() {
    check_input
    init_board_config ${TOOLCHAINS_DIR}
    print_settings
    if [[ ! -z ${CONFIG} ]]; then
        make ${CONFIG}
        exit 0 
    fi
}

main