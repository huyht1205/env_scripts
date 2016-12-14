#!/bin/bash

if [[ $(which brew) = "" ]]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

NORMAL_LIST=" \
	coreutils autoconf automake bash-completion ctags gawk \
	gettext git gnu-sed iperf picocom ssh-copy-id sshfs unrar \
	wget xz \
"

CASK_LIST=" \
	osxfuse \
"

brew tap homebrew/fuse
brew tap Caskroom/cask

brew install ${NORMAL_LIST}

brew cask install ${CASK_LIST}
