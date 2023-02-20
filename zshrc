######################################################
# User PATH
#######################################################
#export PATH="/usr/local/bin:$PATH"
#export PATH="/usr/local/sbin:$PATH"

# rust
source $HOME/.cargo/env

# ruby
# export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
# export PATH="/usr/local/opt/ruby/bin:$PATH" 
# export LDFLAGS="-L/usr/local/opt/ruby/lib" 
# export CPPFLAGS="-I/usr/local/opt/ruby/include"
# export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

export PATH="$HOME/Library/Python/2.7/bin:$PATH"

export PATH="/opt/homebrew/bin:$PATH"

#######################################################
# anyenv
#######################################################

# export PATH="$HOME/.anyenv/bin:$PATH"
# eval "$(anyenv init -)"

#######################################################
# nextword ( deprecated! )
#######################################################
export NEXTWORD_DATA_PATH="$HOME/.config/nextword/nextword-data-small"

#######################################################
# mocword
#######################################################
export MOCWORD_DATA="$HOME/.config/mocword/mocword.sqlite"

#######################################################
# asdf
#######################################################

. $(brew --prefix asdf)/libexec/asdf.sh
#. ~/.asdf/plugins/java/set-java-home.zsh

# for ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"
export optflags="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

#######################################################
# direnv
#######################################################

eval "$(direnv hook zsh)"

#######################################################
# alias
#######################################################

alias cp='cp -i'
alias mv='mv -i'
# alias rm='rm -i'
alias rm='gomi'
# alias ls='gls -GAF --color=auto'
alias ls='lsd -AF'
alias ll='ls -l'
# alias ll='exa -lgh --git'
# alias exa='exa -aF'
alias less='less -R'
alias bat='bat --theme TwoDark'
alias rg='rg --hidden'
# FZF_PREVIEW_PREVIEW_BAT_THEME=base16


#######################################################
# tabtab (https://github.com/mklabs/tabtab)
# tab completion helper by node.js
#######################################################

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

#######################################################
# broot (https://github.com/Canop/broot)
#######################################################
# source /Users/satoruohzawa/.config/broot/launcher/bash/br

#------------------------------------------------------
# keymap
#------------------------------------------------------

# emacs mode
# If bindkey is undefined and EDITOR enviroment is vim in zshrc or zprofile, key binding seems to be in vim mode in child process zsh.
# ref: https://web-salad.hateblo.jp/entry/2014/12/07/090000
bindkey -e

#######################################################
# fzf
#######################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_LEGACY_KEYBINDINGS=1
export FZF_DEFAULT_OPTS='
  --bind="F2:toggle-preview"
  --layout=reverse 
  --preview "bat --theme={} --color=always"
'

# fzf z
function fzf-z () {
    local selected_dir=$(z -t | sort -nr | awk '{ print $2 }' | fzf)
    if [ -n "$selected_dir" ]; then
        #buffer="cd ${selected_dir}"
        cd ${selected_dir}
        zle accept-line
    fi
    zle clear-screen
}
zle -N fzf-z
bindkey '^@' fzf-z

# ghq
function fzf-ghq () {
	cd $(ghq list -p | fzf)
	zle accept-line
	zle clear-screen
}
zle -N fzf-ghq
bindkey '^_' fzf-ghq

# docker
source ~/ghq/github.com/kwhrtsk/docker-fzf-completion/docker-fzf.zsh


#######################################################
# starship 
# prompt
#######################################################

eval "$(starship init zsh)"

#######################################################
# zinit
#######################################################

# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

