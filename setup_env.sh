#!/bin/bash

function main() {
	git_config
	git_alias
	initScript_copy bash_aliases 'common'
	initScript_copy vimrc 'common'
	initScript_copy bash_aliases_$(uname) 'OS_specific/mac'
}

function git_config() {
	printf "${FUNCNAME}($1)..."
	git config --global user.name "Hoang Trung Huy"
	git config --global user.email "huyht1205@gmail.com"
	git config --global core.editor "vim"
	printf "finished.\n"
}

function git_alias() {
	printf "${FUNCNAME}($1)..."
	git config --global alias.s status
	git config --global alias.l log
	git config --global alias.b branch
	printf "finished.\n"
}

function initScript_copy() {
	printf "${FUNCNAME}($1)..."
	NAME=$1
	PREFIX=$2
	TARGET=${PREFIX}/${NAME}
	if [[ -e ./${TARGET} ]]; then
		cp ./${TARGET} ~/.${NAME}
		printf "finished.\n"
	else
		printf "\e[31mERROR: File not found!\e[0m\n"
	fi
}

main "$@"
