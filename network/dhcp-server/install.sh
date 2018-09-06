#!/bin/bash

THIS_DIR=$(dirname $(realpath ${0}))
SYSTEMD_SERVICE_PATH=/lib/systemd/system
SERVICE=isc-dhcp-server.service
SERVICE_DIR=systemd-service

if [[ -e ${SYSTEMD_SERVICE_PATH}/${SERVICE} ]]; then
    echo "Backup current service"
    sudo mv -v ${SYSTEMD_SERVICE_PATH}/${SERVICE} ${SYSTEMD_SERVICE_PATH}/${SERVICE}.bak
fi
sudo ln -sv ${THIS_DIR}/${SERVICE_DIR}/${SERVICE} --target-directory=${SYSTEMD_SERVICE_PATH}

