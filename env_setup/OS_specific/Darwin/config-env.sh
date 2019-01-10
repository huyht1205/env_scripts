#!/bin/bash

function enable_hold_to_repeat() {
    echo ${FUNCNAME[0]}
    defaults write -g ApplePressAndHoldEnabled -bool false
}

function main() {
    enable_hold_to_repeat
}

main