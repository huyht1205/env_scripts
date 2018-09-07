#!/bin/bash

WIRELESS="wlan0"
WAN="eth0"
SSID="MyAP"
PASS="12345678"
OPTS="--daemon --ieee80211ac -w 2 --freq-band 5 -c 40 --no-virt"

if [[ ! -z ${1} ]]; then
    WIRELESS=${1}
fi

if [[ ! -z ${2} ]]; then
    WAN=${2}
fi

sudo create_ap ${OPTS} ${WIRELESS} ${WAN} ${SSID} ${PASS}
