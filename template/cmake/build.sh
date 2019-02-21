#!/bin/bash

#######################################################################
#                            DEFINES                                  #
#######################################################################
THIS=$(basename ${BASH_SOURCE[0]})
THIS_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
BD=./_build

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
    printf "Build with cmake. Build dir is \"${BD}\"\n"
    printf "OPTIONS:\n"
    for ((i=0; i < ${#OPTS[@]}; i+=3)); do
        _OPT=${OPTS[i]}
        _ARG=${OPTS[i+1]}
        _DESC=${OPTS[i+2]}
        printf "\n"
        printf "    %s %-15s: %s\n" "${_OPT}" "${_ARG}" "${_DESC}"
    done
}
while getopts h opt; do
    case "${opt}" in
        h)
            print_usage ${OPTS[@]}
            exit 0
            ;;
    esac
done

#######################################################################
#                           FUNCTIONS                                 #
#######################################################################

function check_input()
{
    :
}

function init_cmake()
{
    if [[ ! -e ${BD} ]]; then
        mkdir ${BD}
    fi

    if [[ ! -e ${BD}/Makefile ]]; then
        pushd ${BD}
        cmake ..
        popd
    fi
}

#######################################################################
#                              MAIN                                   #
#######################################################################
function main()
{
    init_cmake 
    make -C ${BD}
}

main
