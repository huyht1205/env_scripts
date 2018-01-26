#!/bin/bash

ROOT_DIR=$(dirname $(realpath ${BASH_SOURCE[0]}))
source ${ROOT_DIR}/../env_setup/common/utils.sh

if [[ -z ${1} || ! -e ${1} ]]; then
    print_info "Usage: $(basename ${0}) <old release path>\n"
    exit -1
fi

RELEASE_PATH=${1}

cp -rf ${RELEASE_PATH}/* .

md5sum -c *.md5sum
exit_if_error
rm *.md5sum

unzip *.zip 1>/dev/null
exit_if_error
rm *.zip

md5sum -c *.md5sum
exit_if_error
rm *.md5sum