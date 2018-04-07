#!/bin/bash

DEPLOY_DIR=${1}
IMAGE=tmp/deploy/images/imx6qpsabresd/lr-cdpf-image-dev-imx6qpsabresd.tar

if [[ ! -e ${IMAGE} ]]; then
    echo "File not found ${IMAGE}"
    exit
fi

if [[ ${DEPLOY_DIR} == "" ]]; then
    DEPLOY_DIR=/data/netboot
fi

echo "Deploying to ${DEPLOY_DIR}"


sudo rm -rf ${DEPLOY_DIR}/*
tar xf ${IMAGE} -C ${DEPLOY_DIR}
sync
