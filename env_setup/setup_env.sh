#!/bin/bash

function main() {
	git_config
	git_alias
	initScript
	copy_etc
}

function git_config() {
	printf "${FUNCNAME}($1)..."
	#git config --global user.name "Hoang Trung Huy"
	#git config --global user.email "huyht1205@gmail.com"
	git config --global core.editor "vim"
	git config --global push.default simple
	printf "finished.\n"
}

function git_alias() {
	printf "${FUNCNAME}($1)..."
	git config --global alias.s status
	git config --global alias.l log
	git config --global alias.b branch
	git config --global alias.a add
	printf "finished.\n"
}

function do_link() {
	printf "${FUNCNAME}($1)..."
	NAME=$1
	LOCATION=$2
	TARGET=./${LOCATION}/${NAME}
	if [[ -e ${TARGET} ]]; then
		ln -sf ${PWD}/${TARGET} ~/.${NAME}
		printf "finished.\n"
	else
		printf "\e[31mERROR: ${TARGET} not found!\e[0m\n"
	fi
}

function initScript() {
	#copy common
	do_link bash_aliases 'common'
	do_link vimrc 'common'

	#copy specific
	U_NAME=$(uname)
	LOCATION=OS_specific/${U_NAME}
	do_link bash_aliases_${U_NAME} ${LOCATION}
	
	if [[ ${U_NAME} = "Darwin" ]]; then
		do_link git-completion.bash ${LOCATION}
	fi
}

function copy_etc() {
	printf "${FUNCNAME}($1)..."
	cp ./common/etc -rf /

	U_NAME=$(uname)
	LOCATION=OS_specific/${U_NAME}
	OS_NAME=$(uname -v)
	
	if [[ ${U_NAME} = "Linux" && "${OS_NAME}" == *"Ubuntu"* ]]; then
		printf " coping Ubuntu etc..."
		cp -rf ./OS_specific/Linux/etc /
	fi
	printf "finished.\n"
}

main "$@"
