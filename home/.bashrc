################################################
# SHELL
################################################
export SHELL=/usr/local/bin/bash
export BASH=/usr/local/bin/bash

################################################
# BASH COMPLETION 2.x
################################################
if [ -f `brew --prefix`/share/bash-completion/bash_completion ]; then
	. `brew --prefix`/share/bash-completion/bash_completion
fi

################################################
# PATH
################################################

# macvim
export PATH=/Applications/MacVim.app/Contents/MacOS:$PATH

# homebrew path
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=~/bin:$PATH
export PATH=/usr/local/opt/ruby/bin/:$PATH

# flex path
export PATH=/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec/bin:$PATH


################################################
# OTHER ENV
################################################
# GCC
export CC=/usr/local/bin/gcc-4.2

# JAVA_OPTIONS
# export _JAVA_OPTIONS=-Dfile.encoding=UTF-8

# flash log
export FLASH_LOG=~/Library/Preferences/Macromedia/Flash\ Player/Logs/flashlog.txt

# flex sdk home
export FLEX_HOME=/usr/local/Cellar/flex_sdk/4.6.0.23201/libexec

# android-sdk
export ANDROID_SDK_ROOT=/usr/local/opt/android-sdk
export ANDROID_HOME=/usr/local/opt/android-sdk

# homebrew byobu
#export BYOBU_PREFIX=$(brew --prefix)

# rbenv
export PATH="${HOME}/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# phpenv
export PATH="${HOME}/.phpenv/bin:${HOME}/.phpenv/shims:${PATH}"
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi

# php composer
export PATH=$HOME/.composer/vendor/bin:$PATH

# php global composer packages
export PATH=~/composer-packages/vendor/bin:$PATH

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# mysqlenv
#source ~/.mysqlenv/etc/bashrc

# AWS
export AWS_CONFIG_FILE=~/.aws/credentials

# git
export GIT_EDITOR=vim

# CLI COLOR
export CLICOLOR_FORCE=1

# pager
#export PAGER=less
#export PAGER=vimpager

# PS1
PS1='\H:\W \u\$ '

# tmux  ps1
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#I_#P") "$PWD")'

# z
. `brew --prefix`/etc/profile.d/z.sh

# for PostgreSQL
export PGDATA=/usr/local/var/postgres
alias pgstart="pg_ctl -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

################################################
# ALIAS
################################################
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -G'
#alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim';
#alias vim='/Applications/MacVim.app/Contents/MacOS/Vim';
alias ctags='ctags -f .tags'
alias less='less -R'
alias myrascut='rascut --log="$FLASH_LOG" -c "-debug=true -static-link-runtime-shared-libraries=true"'
#alias pbcopy='reattach-to-user-namespace pbcopy'
#alias pbpaste='reattach-to-user-namespace pbpaste'