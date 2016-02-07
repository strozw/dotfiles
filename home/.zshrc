# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

ZSH_CUSTOM=$HOME/.oh-my-zsh-custom

#ZSH_THEME="my-ys"
ZSH_THEME="pure"

# zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

#plugins=(sudo themes git osx brew svn-fast-info)
plugins=(sudo themes git osx brew)

source $ZSH/oh-my-zsh.sh

# 補完に使用するファイルチェックをスルー
compinit -u

# I want use jorke command
#unalias sl


###############################################
# anyenv
###############################################
export PATH="$HOME/.anyenv/bin:$PATH"
if which anyenv > /dev/null; then eval "$(anyenv init -)"; fi

###############################################
# ruby gem exec path
###############################################
#export GEM_DIR=`gem env | grep "EXECUTABLE DIRECTORY" | awk '{print $4}'`
#export PATH=$GEM_DIR:$PATH


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
#source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
#
## bind UP and DOWN arrow keys
#zmodload zsh/terminfo
#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down
#
## bind P and N for EMACS mode
#bindkey -M emacs '^P' history-substring-search-up
#bindkey -M emacs '^N' history-substring-search-down
#
## bind k and j for VI mode
#bindkey -M vicmd 'k' history-substring-search-up
#bindkey -M vicmd 'j' history-substring-search-down

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

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
	    BUFFER="cd ${selected_dir}"
	    zle accept-line
	  fi
    zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
alias peco-src="peco-src"

#archey -c

