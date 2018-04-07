#!/bin/bash

SDK=./tmp/deploy/sdk/poky-glibc-x86_64-lr-cdpf-image-dev-cortexa9hf-neon-toolchain-2.1.3.sh

if [[ ! -e ${SDK} ]]; then
    echo "File not found ${SDK}"
    exit
fi

bash ${SDK} <<EOF
/data/sdk
y
EOF
