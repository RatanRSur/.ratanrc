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
# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
        if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
                # We have color support; assume it's compliant with Ecma-48
                # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
                # a case would tend to support setf rather than setaf.)
                color_prompt=yes
        else
                color_prompt=
        fi
fi

#if [ "$color_prompt" = yes ]; then
PS1="\[\e[00;37m\]\u@\h: \[\e[0m\]\[\e[00;36m\]\w\[\e[0m\]\[\e[00;37m\] \\$ \[\e[0m\]"
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
        xterm*|rxvt*)
                PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
                ;;
        *)
                ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias ls='ls -G'
        alias dir='dir --color=auto'
        alias vdir='vdir --color=auto'

        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
fi

#directory colors linux
LS_COLORS=$LS_COLORS:'di=0;36:' ; export LS_COLORS

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
alias tmux='tmux -2'
alias brewup='brew update -all && brew upgrade --all ; brew cask list | xargs brew cask install ; brew cleanup'
if [ -f ~/.bash_aliases ]; then
        . ~/.bash_aliases
fi

function mkcd
{
        dir="$*";
        mkdir -p "$dir" && cd "$dir";
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
        if [ -f /usr/share/bash-completion/bash_completion ]; then
                . /usr/share/bash-completion/bash_completion
        elif [ -f /etc/bash_completion ]; then
                . /etc/bash_completion
        fi
fi
export PATH=/usr/local/bin:$PATH


#brew tab autocompletion
#source $(brew --repository)/Library/Contributions/brew_bash_completion.sh

#FUCK
alias fuck='$(thefuck $(fc -ln -1))'
alias FUCK='fuck'

#function for pdflatex compilation with entr
latexedit()
{
        ls "$1" | entr -c pdflatex --halt-on-error "$1"
}
