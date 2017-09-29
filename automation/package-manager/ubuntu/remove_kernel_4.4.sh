#!/bin/bash

RM_KERNEL="linux-headers-4.4.0-31 linux-headers-4.4.0-31-generic linux-headers-4.4.0-45 linux-headers-4.4.0-45-generic linux-image-4.4.0-31-generic linux-image-4.4.0-45-generic "

apt-get purge ${RM_KERNEL}
