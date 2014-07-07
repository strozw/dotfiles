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
#ZSH_THEME="dst"
#ZSH_THEME="juanghurtado"
#ZSH_THEME="re5et"
#ZSH_THEME="pygmalion"

# aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -G -A -F --color=auto'
alias less='less -R'

# vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias vimdiff='/Applications/MacVim.app/Contents/MacOS/vimdiff'
alias view='/Applications/MacVim.app/Contents/MacOS/view'

# composer
#alias composer='hhvm ~/bin/composer.phar'

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
plugins=(sudo themes git npm svn osx brew vagrant z git-flow laravel composer)

source $ZSH/oh-my-zsh.sh

###############################################
# cdr
###############################################
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*' recent-dirs-max 5000
  zstyle ':chpwd:*' recent-dirs-default yes
  zstyle ':completion:*' recent-dirs-insert both
fi

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

##############################################
# zsh-notify
##############################################
source ~/.zsh.d/zsh-notify/notify.plugin.zsh
export SYS_NOTIFIER="/usr/local/bin/terminal-notifier"
export NOTIFY_COMMAND_COMPLETE_TIMEOUT=10

##############################################
# zaw
##############################################
source ~/.zsh.d/zaw/zaw.zsh

###############################################
# PATH
###############################################
# macvim
export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH
export PATH=/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/:$PATH

export PATH=/usr/bin:$PATH
export PATH=/usr/sbin:$PATH

# homebrew path
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
#export PATH=/usr/local/opt/ruby/bin/:$PATH

# gnu-tar (installed by homebrew)
export PATH="/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

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

# ndenv
export PATH="${HOME}/.ndenv/bin:${HOME}/.ndenv/shims:${PATH}"
if which ndenv > /dev/null; then eval "$(ndenv init -)"; fi



# php composer
export PATH=$HOME/.composer/vendor/bin:$PATH

###############################################
# go path
###############################################
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin


###############################################
# OTHER ENV
###############################################
#export CC=/usr/local/bin/gcc-4.2

# android-sdk
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# AWS
export AWS_CONFIG_FILE=~/.aws/credentials

# git
export GIT_EDITOR=vim

# editor
export EDITOR=vim

# for PostgreSQL
export PGDATA=/usr/local/var/postgres

###############################################
# Util
###############################################
# z
. `brew --prefix`/etc/profile.d/z.sh

###############################################
# peco Utitlity
###############################################
# peco hitory
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(history | cut -c 8- | eval $tac | peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# peco cdr
function peco-cdr () {
    local selected_dir=$(cdr -l | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
bindkey '^@' peco-cdr

# peco z
function peco-z () {
    local selected_dir=$(z -t | sort -nr | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-z
bindkey '^z' peco-z

# peco homesick
function peco-homesick () {
    local selected_dir=$(homesick list | awk '{ print $1 }' | peco)
    if [ -n "$selected_dir" ]; then
        BUFFER="homesick cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-homesick
bindkey '^h' peco-homesick

# process kill
function peco-pkill() {
  for pid in `ps aux | peco | awk '{ print $2 }'`
  do
    kill $pid
    echo "Killed ${pid}"
  done
}
alias pk="peco-pkill"

################################################
# SHELL
################################################
export SHELL=/usr/local/bin/zsh

#archey -c

################################################
# Base16 Shell
################################################
#BASE16_SCHEME="ocean"
#BASE16_SHELL="$HOME/.config/base16-shell/base16-$BASE16_SCHEME.dark.sh"
#[[ -s $BASE16_SHELL ]] && . $BASE16_SHELL


###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

if type complete &>/dev/null; then
  _npm_completion () {
    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$COMP_CWORD" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${COMP_WORDS[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

