#!/bin/bash

MY_PKG=" \
	openssh avahi picocom sshfs ctags make gcc \
"

KERNEL_DEV=" \
	uboot-tools lzop ncurses \
"

AUTOTOOLS=" \
	autoconf automake libtool \
"

pacman -S ${MY_PKG} ${KERNEL_DEV} ${AUTOTOOLS}

# Java virtual machin
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get install oracle-java8-installer oracle-java8-set-default 
