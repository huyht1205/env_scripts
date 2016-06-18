#!/bin/bash

export ENV='ABI=64'

D=/Users/hoangtrunghuy/workspace/mac_rootfs
if [[ ! -d ${D} ]]; then
	mkdir -m 775 ${D}
fi

DIR='--prefix='${D}
FEATURE='--disable-static --enable-cxx'
OPTIMIZE='--enable-fat'

./configure ${DIR} ${FEATURE} ${OPTIMIZE}
make -j4

