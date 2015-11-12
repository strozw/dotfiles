# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

ZSH_THEME="my-ys"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

#plugins=(git ruby osx bundler brew rails emoji-clock)
plugins=(sudo themes git osx brew svn-fast-info)

source $ZSH/oh-my-zsh.sh

# 補完に使用するファイルチェックをスルー
compinit -u

# I want use jorke command
#unalias sl


###############################################
# ruby, php ,node
###############################################
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which phpenv > /dev/null; then eval "$(phpenv init -)"; fi
if which ndenv > /dev/null; then eval "$(ndenv init -)"; fi


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

###############################################
# zsh-autosuggestions
###############################################
source ~/.zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically
function zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init

# zsh-autosuggestions is designed to be unobtrusive)
#bindkey '^T' autosuggest-toggle

# Accept suggestions without leaving insert mode
#bindkey '^f' vi-forward-word
# or
#bindkey '^f' vi-forward-blank-word

##############################################
# zsh-notify
##############################################
#source ~/.zsh.d/zsh-notify/notify.plugin.zsh

###############################################
# aliases
###############################################
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='gls -GAF --color=auto'
alias less='less -R'
#export LESS='-R'
#export LESSOPEN='| src-hilite-lesspipe.sh %s'

# vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# composer
#alias composer='hhvm ~/bin/composer.phar'

# pgssql
alias pgstart="pg_ctl -l /usr/local/var/postgres/server.log start"
alias pgstop="pg_ctl -D /usr/local/var/postgres stop -s -m fast"

#alias brew="env PATH=${PATH/\/Users\/takc923\/\.phpenv\/shims:/} brew"

###############################################
# dircolosr
###############################################
eval `gdircolors ~/.dircolors/dircolors.ansi-dark`
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi


###############################################
# Zsh Utility Function
###############################################
# コマンドをEDITORで記述し、実行
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line

###############################################
# Utility
###############################################
# z
. `brew --prefix`/etc/profile.d/z.sh
. `brew --prefix`/etc/grc.bashrc

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
        cd ${selected_dir}
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-cdr
#bindkey '^@' peco-cdr

# peco z
function peco-z () {
    local selected_dir=$(z -t | sort -nr | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        #BUFFER="cd ${selected_dir}"
        cd ${selected_dir}
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-z
bindkey '^@' peco-z

# peco homesick
function peco-homesick () {
    local selected_dir=$(homesick list | awk '{ print $1 }' | peco)
    if [ -n "$selected_dir" ]; then
        homesick cd ${selected_dir}
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

# tmux attach session
function peco-tmux-attach-session() {
	local sid=$(tmux ls | peco | awk '{ print $1 }' | cut -d':' -f1)
	tmux attach-session -t $sid
}
alias pta="peco-tmux-attach-session"

#archey -c

