#!/bin/bash

# UTILS DEFINES
HOME_DIR=${PWD}
INFO_COLOR="\e[37m"
ERROR_COLOR="\e[31m"
WARNING_COLOR="\e[33m"
NORMAL_COLOR="\e[0m"

function print_info
{
    printf "${INFO_COLOR}${1}${NORMAL_COLOR}"
}

function print_warn
{
    printf "${WARNING_COLOR}WARNING: ${1}${NORMAL_COLOR}"
}

function print_error
{
    printf "${ERROR_COLOR}ERROR: ${1}${NORMAL_COLOR}"
}

function exit_if_error
{
    RESULT=$?
    if [[ ! ${RESULT} -eq 0 ]]; then
        print_error "Fatal!!!\n"
        exit 1
    fi
}