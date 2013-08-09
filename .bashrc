# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

. ~/git/z/z.sh

function cd {
	builtin cd "$@" && ls
}

function ? {
	ls *$@*
}

function new {
    urxvt -e /bin/sh -c "cd `pwd` && /bin/bash" &
}

shopt -s autocd
shopt -s cdspell
shopt -s dirspell

HISTSIZE=100000
HISTFILESIZE=100000

set -o vi
alias :q=exit
alias :wq=exit

source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export PS1='[\u : \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '
