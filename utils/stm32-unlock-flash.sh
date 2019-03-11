#!/bin/bash

#######################################################################
#                            DEFINES                                  #
#######################################################################
THIS=$(basename ${BASH_SOURCE[0]})
THIS_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
STM32_PROG="/data/sdk/STMicroelectronics/atollic/Servers/STM32CubeProgrammer/bin/STM32_Programmer_CLI -c port=swd"

#######################################################################
#                            INCLUDES                                 #
#######################################################################

#######################################################################
#                             USAGE                                   #
#######################################################################
OPTS=(
    -h ""        "print this message"
    )
function print_usage()
{
    printf "$(basename ${BASH_SOURCE[0]}) [OPTIONS]\n"
    printf "Unlock all option bytes\n"
    printf "OPTIONS:\n"
    for ((i=0; i < ${#OPTS[@]}; i+=3)); do
        _OPT=${OPTS[i]}
        _ARG=${OPTS[i+1]}
        _DESC=${OPTS[i+2]}
        printf "\n"
        printf "    %s %-15s: %s\n" "${_OPT}" "${_ARG}" "${_DESC}"
    done
}
while getopts ha: opt; do
    case "${opt}" in
        h)
            print_usage ${OPTS[@]}
            exit 0
            ;;
    esac
done

shift $((OPTIND - 1))
ARGS=(${@})

#######################################################################
#                           FUNCTIONS                                 #
#######################################################################

function check_input()
{
    :
}

#######################################################################
#                              MAIN                                   #
#######################################################################
function main()
{
    for ((i=0; i<=7; ++i)); do
        ${STM32_PROG} -ob nWRP${i}=0x01
    done
    ${STM32_PROG} -ob RDP=0xAA
    ${STM32_PROG} -ob displ
}

main
