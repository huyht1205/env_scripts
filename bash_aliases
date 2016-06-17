#!/bin/bash

complete -cf sudo
complete -cf which

export VISUAL=vim
export PS1='\[\033[37;1m\]\w\[\033[0m\]\$ '

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -la'
alias df='df -Th'
alias mkdir='mkdir -p -m 775'
alias addAlias='vim ~/.bash_aliases ; source ~/.bash_aliases'
alias addAliasPrivate='vim ~/.bash_aliases_$(uname) ; source ~/.bash_aliases_$(uname)'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias df='df -Th'

source /usr/local/etc/bash_completion.d/git-completion.bash
source ~/.bash_aliases_$(uname)
