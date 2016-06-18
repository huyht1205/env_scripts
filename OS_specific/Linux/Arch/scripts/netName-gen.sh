#!/bin/bash

declare -i count=0

#UDEV_PATH=/etc/udev/rules.d
UDEV_PATH=.
UDEV_RULE=${UDEV_PATH}/10-network.rules
if [[ ! -f ${UDEV_RULE} ]]; then
	for dev in $(ls /sys/class/net | grep en); do
		address=$(cat /sys/class/net/${dev}/address)
		printf "SUBSYSTEM==\"net\", ACTION==\"add\", ATTR{address}==\"${address}\", NAME=\"net${count}\"\n" 
		let count+=1
	done
fi
