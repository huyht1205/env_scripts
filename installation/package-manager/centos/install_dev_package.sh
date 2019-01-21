#!/bin/bash

function main
{
	install-sshfs
	install-packages
}

function install-sshfs
{
	modprobe fuse
	yum install epel-release
	yum install sshfs
}

function install-packages
{
	MY_PKG=" \
		openssh-server avahi picocom sshfs ctags network-manager-applet \
	"

	YOCTO_DEV=" \
		gawk make wget tar bzip2 gzip python unzip perl patch \
		diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo \
		chrpath socat SDL-devel xterm \
	"

	KERNEL_DEV=" \
		u-boot-tools lzop ncurses \
	"

	AUTOTOOLS=" \
		autoconf automake libtool \
	"

	yum install ${MY_PKG} ${YOCTO_DEV} ${KERNEL_DEV}
}

main
