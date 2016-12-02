#!/bin/bash

MY_PKG="openssh-server avahi-daemon avahi-discover avahi-dnsconfd avahi-utils picocom ctags"
YOCTO_DEV="gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm"
KERNEL_DEV="u-boot-tools lzop libncurses5 libncurses5-dev"
AUTOTOOLS="autoconf automake libtool"

apt-get install ${MY_PKG} ${YOCTO_DEV} ${KERNEL_DEV}
