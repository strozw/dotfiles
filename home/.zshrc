
###############################################
# aliases
###############################################

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='gls -GAF --color=auto'
alias ll='ls -l'
alias less='less -R'
#export LESS='-R'
#export LESSOPEN='| src-hilite-lesspipe.sh %s'


###############################################
# zplug settings
###############################################

# check zplug 
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

# enhancd config
# export ENHANCD_COMMAND=ed
export ENHANCD_FILTER=ENHANCD_FILTER=fzy:fzf:peco

# Vanilla shell
zplug "yous/vanilli.sh"

zplug "marzocchi/zsh-notify"
zplug "chrissicool/zsh-256color"

# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"

# Syntax highlighting bundle. zsh-syntax-highlighting must be loaded after
# excuting compinit command and sourcing other plugins.
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# ZSH port of Fish shell's history search feature
zplug "zsh-users/zsh-history-substring-search", defer:2

# Autosuggestions
zplug "zsh-users/zsh-autosuggestions", defer:2

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"*.sh"

# A next-generation cd command with an interactive filter
zplug "b4b4r07/enhancd", use:init.sh

# This plugin adds many useful aliases and functions.
zplug "plugins/git", from:oh-my-zsh

# Theme
zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load


###############################################
# dircolosr
###############################################
eval `gdircolors ~/.dircolors/dircolors.ansi-dark`
if [ -n "$LS_COLORS" ]; then
    zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
fi

# vim
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'


###############################################
# peco utitlity
###############################################

#
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# peco z
function peco-z () {
    local selected_dir=$(z -t | sort -nr | awk '{ print $2 }' | peco)
    if [ -n "$selected_dir" ]; then
        #buffer="cd ${selected_dir}"
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
    echo "killed ${pid}"
  done
}
alias pk="peco-pkill"

# tmux attach session
function peco-tmux-attach-session() {
	local sid=$(tmux ls | peco | awk '{ print $1 }' | cut -d':' -f1)
	tmux attach-session -t $sid
}
alias pta="peco-tmux-attach-session"

function peco-ghq () {
	cd $(ghq list -p | peco)
    #local selected_dir=$(ghq list -p | peco --query "$lbuffer")
    #if [ -n "$selected_dir" ]; then
	#	buffer="cd ${selected_dir}"
	#	zle accept-line
	#fi
    #zle clear-screen
}
zle -N peco-ghq
bindkey '^]' peco-ghq
alias peco-src="peco-ghq"


#archey -c

