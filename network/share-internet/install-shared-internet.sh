#!/bin/bash

THIS_DIR=$(dirname $(realpath ${0}))
CONF_DIR=sysctl_conf
CONF=30-ipforward.conf
SYSCTL_DIR=/etc/sysctl.d
WAN=${1}
LAN=${2}
SUBNET=${3}
USAGE="${0} <WAN interface> <LAN interface> <subnet>"

function main() {
    check_args
    setup_ip_forwarding
}

function check_args() {
    echo "${FUNCNAME}"
    if [[ -z ${WAN} || -z ${LAN} || -z ${SUBNET} ]]; then
        echo ${USAGE}
        exit 1
    fi
    echo "WAN=${WAN}"
    echo "LAN=${LAN}"
    echo "SUBNET=${SUBNET}"
}

function setup_ip_forwarding() {
    echo "${FUNCNAME}"
    backup_sysctl_conf
    create_sysctl_conf
}

function backup_sysctl_conf() {
    echo "  |-- ${FUNCNAME}"
    if [[ -f ${SYSCTL_DIR}/${CONF} && ! -L ${SYSCTL_DIR}/${CONF} ]]; then
        echo "Back up old config"
        sudo mv -v ${SYSCTL_DIR}/${CONF} ${SYSCTL_DIR}/${CONF}.bak 
    fi
}

function create_sysctl_conf() {
    echo "  |-- ${FUNCNAME}"
    if [[ ! -L ${SYSCTL_DIR}/${CONF} ]]; then
        sudo ln -sv ${THIS_DIR}/${CONF_DIR}/${CONF} --target-directory=${SYSCTL_DIR}
    fi
}

main
