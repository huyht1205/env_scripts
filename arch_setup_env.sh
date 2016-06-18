#!/bin/bash
locale-gen
sed -i.bak s/#en_US.UTF-8/en_US.UTF-8/g /etc/locale.gen
echo LANG=en_US.UTF-8
printf "4\n49\n2\n1\n" | tzselect
ln -s /usr/share/zoneinfo/Asia/Ho_Chi_Minh /etc/localtime
hwclock --systohc --utc
mkinitcpio -p linux

grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable dhcpcd
systemctl start dhcpcd
