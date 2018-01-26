#!/bin/bash

ROOT_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
source ${ROOT_DIR}/../env_setup/common/utils.sh

if [[ -z ${1} ]]; then
    print_info "Usage: $(basename ${0}) <release date>\n"
    exit -1
fi
RELEASE_DATE=${1}

ZIP_NAME=CDPF_DiskImage_${RELEASE_DATE}.zip
DISK_IMAGE_PREFIX=lr-cdpf-image_release
NEW_DISK_IMAGE=${DISK_IMAGE_PREFIX}-${RELEASE_DATE}.img
OLD_DISK_IMAGE=$(ls ${DISK_IMAGE_PREFIX}*)

mv ${OLD_DISK_IMAGE} ${NEW_DISK_IMAGE}
md5sum ${NEW_DISK_IMAGE} > ${NEW_DISK_IMAGE}.md5sum

FILE_LIST=(
    "3rd-party"
    "${NEW_DISK_IMAGE}"
    "${NEW_DISK_IMAGE}.md5sum"
    )

for f in "${FILE_LIST[@]}"; do
    if [[ ! -e ${f} ]]; then
        print_error "${f} is NOT found\n"
        exit -1
    fi
done

zip -r ${ZIP_NAME} ${FILE_LIST[@]}
md5sum ${ZIP_NAME} > ${ZIP_NAME}.md5sum

for f in "${FILE_LIST[@]}"; do
    rm -rf ${f}
done