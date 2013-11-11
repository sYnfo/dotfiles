# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# https://github.com/rupa/z
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

# cd to directories just by typing their name
shopt -s autocd
# correct spelling mistakes
shopt -s cdspell
shopt -s dirspell

HISTSIZE=100000
HISTFILESIZE=100000

# use vi bindings
set -o vi
alias :q=exit
alias :wq=exit

alias la="ls -a"

source /usr/share/git-core/contrib/completion/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true

# makes interactive text after prompt bold, which makes it easier to see
# where the output of a command ends and where the prompt begins when looking
# for something
#trap 'tput sgr0' DEBUG
export PS1='[\u : \W$(declare -F __git_ps1 &>/dev/null && __git_ps1 " (%s)")]\$ '

#solarized colors for tty
export CLICOLORS=1

# 073642 034   base02  
# 586e75 567   base01  grey with a blue tint
# 657b83 678   base00  light grey with a blue tint
# 93a1a1 9aa   base1   lighter bluish grey
# eee8d5       base2   white
# fdf6e3 ffe   base3   bright white
# b58900 b80   yellow
# cb4b16 c41   orange
# dc322f d32   red
# d33682 d38   magenta
# 6c71c4 67c   violet
# 268bd2 28d   blue
# 2aa198 2a9   cyan
# 859900 890   green

if [ "$TERM" = "linux" ]; then
    echo -en "\e]P0002b36" # console background (dark blue)
    echo -en "\e]P7839496" # console foreground text (light grey)
    echo -en "\e]PC2aa198" # ls directory color, vim message color (cyan)

    echo -en "\e]P593a1a1" # xresources keywords
    echo -en "\e]P3268bd2" # xresources key names

    echo -en "\e]P9cb4b16" # vim variables
    echo -en "\e]P62aa198" # xresources values, vim strings, search bg color
    echo -en "\e]PA586e75" # vim comments
    echo -en "\e]P2859900" # vim keywords, selection bg, bracket matching bg
    echo -en "\e]P1dc322f" # vim escape characters, whitespace in git show, untracked files in git status
    echo -en "\e]PB657b83" # vim empty line markers ~
    echo -en "\e]P4cb4b16" # vim constants, cursor, mode indicator, sqbracket match fg
    echo -en "\e]P8073642" # vim selection fg

    echo -en "\e]PF859900" # command executed in git show

    echo -en "\e]PDd33682" # magenta
    echo -en "\e]PE0000ff" # debug blue

    #this is an attempt at working utf8 line drawing chars in the linux-console
    #export TERM=linux+utf8
    clear #hmm, yeah we need this or else we get funky background collisions

    setfont /lib/kbd/consolefonts/ter-u18b.psf.gz
fi
