# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
        *i*) ;;
        *) return;;
esac
#set os variable
os=`uname -s`
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
        debian_chroot=$(cat /etc/debian_chroot)
fi

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white

#prompt
PS1="\[\033[38;5;208m\]\u@\h:\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[34m\]\w\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]\[\033[38;5;208m\]\\$\[$(tput sgr0)\]\[\033[38;5;15m\] \[$(tput sgr0)\]"

#platform dependent stuff
case $os in
        "Darwin" )
                export CLICOLOR=1
                export LSCOLORS=exfxcxdxbxegedabagacad
                alias ll='ls -GAlFh'
                alias la='ls -GA'
                alias l='ls -AGCF'
                alias brewup='brew update -all && brew upgrade --all ; brew cask list | xargs brew cask install ; brew cleanup'
                source $(brew --repository)/Library/Contributions/brew_bash_completion.sh;;
        "Linux" )
                export LS_COLORS=$LS_COLORS:'di=0;36:'
                alias ll='ls -AlF'
                alias la='ls -A'
                alias l='ls -ACF';;
esac

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi
