# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

HOMEBREW_REPOSITORY=${HOMEBREW_REPOSITORY:-"/usr/local"}

export LC_ALL=en_US.UTF-8
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$HOME/.mix/escripts:$PATH
export PATH=$HOME/.emacs.d/bin:$PATH
export PATH="$HOMEBREW_REPOSITORY/opt/gnu-sed/libexec/gnubin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
# Custom GO version
export PATH="$HOMEBREW_REPOSITORY/opt/go@1.17/bin:$PATH"
# Installing libpq
export PATH="$HOMEBREW_REPOSITORY/opt/libpq/bin:$PATH"

# Disable homebrew autoupdate
export HOMEBREW_NO_AUTO_UPDATE=1

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/anaconda3/bin" ] ; then
    PATH="$HOME/anaconda3/bin:$PATH"
fi

if [ -d "$HOME/.foundry/bin" ] ; then
    PATH="$PATH:$HOME/.foundry/bin"
fi

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="gitster"

ZSH_DISABLE_COMPFIX="true"

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
plugins=(zsh-autosuggestions git mix npm docker docker-compose kubectl)

if [ -s $ZSH/oh-my-zsh.sh ]; then
    source $ZSH/oh-my-zsh.sh
fi

if [ -x "$(command -v kubectl)" ]; then
	source <(kubectl completion zsh)
fi
# source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ----------------------
# Node.js aliases
# ----------------------
alias ns='npm start'
alias nt='npm test'
alias ntm='npm run mocha'

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -D'
alias gc='git commit'
alias gca='git commit -a'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gcod='git checkout develop'
alias gd='git diff'
alias gda='git diff HEAD'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias gpu='git pull upstream $(git rev-parse --abbrev-ref HEAD)'
alias gpo='git pull origin'
alias gpod='git pull origin develop'
alias gpom='git pull origin master'
alias gpum='git pull upstream master'
alias gps='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias gpsa='git push --all'
alias gpst='git push --tags'
alias gpsu='git push upstream $(git rev-parse --abbrev-ref HEAD)'
alias gpsum='git push upstream master'
alias gs='git status'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias ccl='clear'
alias vv='vim .'
alias nvv='nvim .'

# ----------------------
# Elixir/Erlang aliases
# ----------------------
alias iexm='iex -S mix'
alias iexmp='iex -S mix phx.server'
alias mf='mix format'
alias mt='mix test'
alias mi='mix deps.get'

# ----------------------
# Docker aliases
# ----------------------
alias doc='docker'
alias dcom='docker-compose'
alias dsa='docker stop $(docker ps -q)'
alias docker-all-stop='docker stop $(docker ps -q)'
alias docker-all-remove='docker rm $(docker ps -aq)'

# ----------------------
# Terraform aliases
# ----------------------
alias tf='terraform'
alias tfaa='terraform apply -auto-approve'
alias tfda='terraform destroy -auto-approve'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }
function gsro() { git remote set-url origin $1; }
function gcca() { git commit -am $1; }
function gcsa() { git commit -S -am $1; }
function gtt() { git tag $1 && git push --tags; }
function gch() { git checkout $1; }
function release_notes { curl -L -s http://bit.ly/2CIE31y | python - $1 develop; }


# ----------------------
# Other functionality
# ----------------------
alias qq='exit'

# added by Nix installer
# if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi 

# added by travis gem
# [ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash
[ -f $HOMEBREW_REPOSITORY/opt/asdf/libexec/asdf.sh ] && . $HOMEBREW_REPOSITORY/opt/asdf/libexec/asdf.sh


# New nvm installation
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_REPOSITORY/opt/nvm/nvm.sh" ] && . "$HOMEBREW_REPOSITORY/opt/nvm/nvm.sh"  # This loads nvm
[ -s "$HOMEBREW_REPOSITORY/opt/nvm/etc/bash_completion.d/nvm" ] && . "$HOMEBREW_REPOSITORY/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Z installation
[ -f "$HOMEBREW_REPOSITORY/etc/profile.d/z.sh" ] && . "$HOMEBREW_REPOSITORY/etc/profile.d/z.sh";

# Rust configuration
[ -s $HOME/.cargo/env ] && . "$HOME/.cargo/env"
export CARGO_NET_GIT_FETCH_WITH_CLI=true

unsetopt nomatch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [ -d "$HOMEBREW_REPOSITORY/Caskroom/miniconda" ]; then
    __conda_setup="$(''${HOMEBREW_REPOSITORY}'/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOMEBREW_REPOSITORY/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
            . "$HOMEBREW_REPOSITORY/Caskroom/miniconda/base/etc/profile.d/conda.sh"
        else
            export PATH="$HOMEBREW_REPOSITORY/Caskroom/miniconda/base/bin:$PATH"
        fi
    fi
    unset __conda_setup
elif [ -d "$HOME/opt/miniconda3" ]; then
    __conda_setup="$(''${HOME}'/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "$HOME/opt/miniconda3/etc/profile.d/conda.sh" ]; then
            . "$HOME/opt/miniconda3/etc/profile.d/conda.sh"
        else
            export PATH="$HOME/opt/miniconda3/bin:$PATH"
        fi
    fi
    unset __conda_setup
fi
# <<< conda initialize <<<

