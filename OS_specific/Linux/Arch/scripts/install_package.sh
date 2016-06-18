#!/bin/bash
pacman -Syyu --noconfirm
pacman -S --needed --noconfirm \
	grub os-prober \
	wireless_tools net-tools wpa_supplicant dhclient \
	qemu vim openssh dosfstools python2 \
	awk gawk wget curl git unzip \
	virtualbox-guest-utils-nox virtualbox-guest-modules-arch
