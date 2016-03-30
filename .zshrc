# Path to your oh-my-zsh installation.

os=`uname -s`
case $os in
        "Darwin" )
                export ZSH=/Users/ratan/.oh-my-zsh;;
        "Linux" )
                export ZSH=/home/ratan/.oh-my-zsh;;
esac
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dieter"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump brew)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/Library/TeX/texbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
####################
# my stuff
case $os in
        "Darwin" )
                #color output
                export CLICOLOR=1
                export LSCOLORS=exfxcxdxbxegedabagacad
                #ls aliases
                alias l='ls -GAlFh'
                alias la='ls -GA'
                #brew stuff
                alias brewup="brew update -all && brew upgrade --all ; brew cask list | xargs brew cask install ; brew cleanup"
                ## check if this can be done in zsh
                #source $(brew --repository)/Library/Contributions/brew_bash_completion.sh
                #nasa apod stuff
                rm -f ~/Pictures/apod/.DS_store
                [ "$(ls -A ~/Pictures/apod)" ] && echo "You have astronomy pictures for review!"
                ;;
        "Linux" )
                #color output
                export LS_COLORS=$LS_COLORS:'di=0;36:ow=0;37'
                #ls aliases
                alias l='ls -AlhF'
                alias la='ls -A'
                export VISUAL="nvim"
                ;;
esac
#other aliases
alias tmux='tmux -2'
alias rr='rm -r'
alias gs='git status'
alias gd='git diff'
alias gl='git log --decorate --graph --oneline'
alias grl='git --no-pager log --decorate --graph --oneline'
alias g11='g++ --std=c++11'
alias g14='g++ --std=c++14'

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

#syntax highlighting
case $os in
        "Darwin" )
                source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
                ;;
        "Linux" )
                source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
                export PATH=$PATH:/opt/anaconda2/bin
                export PATH=$PATH:/usr/bin/vendor_perl
                ;;
esac
