# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="dieter"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(git autojump zsh-syntax-highlighting)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
####################
# my stuff
#
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
os=`uname -s`
case $os in
    "Darwin" )
        export PATH=~/anaconda3/bin:"$PATH"
        export PATH=~/anaconda2/bin:"$PATH"
        #color output
        export CLICOLOR=1
        export LSCOLORS=exfxcxdxbxegedabagacad
        #ls aliases
        alias l='ls -GAlFh'
        alias la='ls -GA'
        #brew stuff
        alias brewup="brew update -all && brew upgrade"
        alias caskup="brew cask list | xargs brew cask install"
        #nasa apod stuff
        /bin/rm -f ~/Pictures/apod/.DS_store
        [ "$(ls -A ~/Pictures/apod)" ] && echo "You have astronomy pictures for review!"
        #move to trash instead of deleting forever
        alias rm='trash'
        ;;
    "Linux" )
        #ls stuff
        export LS_COLORS=$LS_COLORS:'di=0;36:ow=0;37'
        alias l='ls -AlhF'
        alias la='ls -A'
        if hash nvim 2>/dev/null; then
            export EDITOR="nvim"
            export VISUAL="nvim"
        fi
        alias c="xclip -selection clipboard"
        alias v="xclip -o"
        export PATH=~/bin:$PATH
        export BROWSER="chromium %s"
        #work stuff
        [[ "$AZUREML_PROFILE" != "" ]] || . "$HOME/.azureml_profile"
        export PATH=/usr/local/mpi/bin:$PATH
        ;;
esac
BASE16_SHELL="$HOME/.config/base16-shell/base16-tomorrow.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#system independent exports
export FZF_DEFAULT_OPTS='--color 16'
#other aliases
alias n='nvim'
alias e='exit'
alias tmux='tmux -2'
alias rr='rm -r'
alias gs='git status'
alias gd='git diff'
alias gl='git log --graph --left-right --format="%Cgreen%h %Cblue%an %Creset%s %Cred%d%Creset"'
alias grl="gl | head -$(($(stty size | cut -d ' ' -f 1) / 2))"
alias dirty='nvim `git diff --name-only`'
alias g11='g++ --std=c++11'
alias g14='g++ --std=c++14'
alias scala='scala -Dscala.color'

backup() {
    for i
    do mv "$i" "$i.backup"
    done
}

restore() {
    for i
    do mv "$i" $(echo "$i" | sed 's/\.backup$//')
    done
}

mkcd()
{
    dir="$*";
    mkdir -p "$dir" && cd "$dir";
}

#function for pdflatex compilation with entr
latexmode()
{
    ls "$1" | entr -c pdflatex --halt-on-error "$1"
}

ssh192()
{
    username="$1"
    target="$2"
    ssh "$username"@192.168.0."$2"
}

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
