#!/bin/bash

DEVICE=0

function main
{
	GetDev $1
}

function GetDev
{
	if [[ -z $1 ]]; then
		echo "__ERROR__: please enter device: /dev/sdX"
		exit -1
	else
		DEVICE=$1
		echo "Using ${DEVICE}"
	fi
}

main $1
