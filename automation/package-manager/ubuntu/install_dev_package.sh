#!/bin/bash

APT_SOURCES_D=/etc/apt/sources.list.d

add-repo_sublime-text() { if [[ ! -e ${APT_SOURCES_D}/sublime-text.list ]]; then
		wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
		sudo apt-get install apt-transport-https
		echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
		sudo apt update
	fi
}

add-repo_google-chrome-stable()
{
	if [[ ! -e ${APT_SOURCES_D}/google.list ]]; then
		wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
		sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
		sudo apt update
	fi
}

add-repo_visual-studio-code()
{
	if [[ ! -e ${APT_SOURCES_D}/ ]]; then
		curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
		sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
		sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
	fi
}

MY_PKG=" \
	openssh-server avahi-daemon avahi-discover avahi-dnsconfd avahi-utils \
	picocom ctags sshfs ctags clang libclang-dev \
    cmake \
"

YOCTO_DEV=" \
	gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential \
	chrpath socat libsdl1.2-dev xterm \
"

KERNEL_DEV=" \
	u-boot-tools lzop libncurses5 libncurses5-dev device-tree-compiler\
"

AUTOTOOLS=" \
	autoconf automake libtool \
"

# add-repo_sublime-text
# add-repo_google-chrome-stable
# add-repo_visual-studio-code
apt-get install ${MY_PKG} ${YOCTO_DEV} ${KERNEL_DEV}

# Java virtual machin
#sudo add-apt-repository ppa:webupd8team/java
#sudo apt-get update
#sudo apt-get install oracle-java8-installer oracle-java8-set-default
