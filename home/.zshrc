# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="agnoster"
#ZSH_THEME="blinks"
#ZSH_THEME="dst"
#ZSH_THEME="wedisagree"
#ZSH_THEME="bureau"
#ZSH_THEME="fishy"
#ZSH_THEME="frisk"
#ZSH_THEME="norm"
ZSH_THEME="ys"

# aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -G'
alias ctags='ctags -f .tags'
alias less='less -R'

# vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# composer
alias composer='hhvm ~/bin/composer.phar'

# pgssql
alias pgstart="pg_ctl -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
#COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(git ruby osx bundler brew rails emoji-clock)
plugins=(sudo git osx brew vagrant z)

source $ZSH/oh-my-zsh.sh

###############################################
# zsh-syntax-highlighting
###############################################
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

###############################################
# zsh-history-substring-search
###############################################
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# bind P and N for EMACS mode
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# bind k and j for VI mode
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

###############################################
# PATH
###############################################
# macvim
export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH

export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH

# homebrew path
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
#export PATH=/usr/local/opt/ruby/bin/:$PATH

# user bin path
export PATH=~/bin:$PATH

# rbenv
export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
# rbenv no rehash ver
#if which rbenv > /dev/null; then eval "$(rbenv init - --no-rehash)"; fi

# phpenv
export PATH="${HOME}/.phpenv/bin:${HOME}/.phpenv/shims:${PATH}"
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi
# phpenv no rehash ver
#if which phpenv > /dev/null; then eval "$(phpenv init - --no-rehash)"; fi

export PATH="$HOME/.jenv/bin:$PATH"
if which phpenv > /dev/null; then eval "$(jenv init -)"; fi

# php composer
export PATH=$HOME/.composer/vendor/bin:$PATH

###############################################
# OTHER ENV
###############################################
# GCC
#export CC=/usr/local/bin/gcc-4.2

# android-sdk
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# AWS
export AWS_CONFIG_FILE=~/.aws/credentials

# git
export GIT_EDITOR=vim

# for PostgreSQL
export PGDATA=/usr/local/var/postgres

###############################################
# Util
###############################################
# z
. `brew --prefix`/etc/profile.d/z.sh


################################################
# SHELL
################################################
export SHELL=/usr/local/bin/zsh



