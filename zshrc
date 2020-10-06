#######################################################
# User PATH
#######################################################

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# rust
source $HOME/.cargo/env

export JAVA_HOME=$(/usr/libexec/java_home --version=1.8)

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

#######################################################
# alias
#######################################################

alias cp='cp -i'
alias mv='mv -i'
# alias rm='rm -i'
alias rm='gomi'
alias ls='gls -GAF --color=auto'
#alias ll='ls -l'
alias ll='exa -lgh --git'
alias exa='exa -aF'
alias less='less -R'
alias bat='bat --theme TwoDark'

#######################################################
# dircolors
#######################################################

eval `dircolors -b`
eval `dircolors ~/.ghq/github.com/seebi/dircolors-solarized/dircolors.ansi-dark`

#######################################################
# zplug 
#######################################################
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# A lightweight start point of shell configuration
zplug "yous/vanilli.sh"

#------------------------------------------------------
# colors
#------------------------------------------------------

# enable 256 colors
#zplug "chrissicool/zsh-256color", defer:2

# syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting", defer:2

# url highlighting
zplug "ascii-soup/zsh-url-highlighter", defer:2

#------------------------------------------------------
# themes
#------------------------------------------------------

# Theme
zplug 'mafredri/zsh-async', from:github
eval "$(starship init zsh)"

#------------------------------------------------------
# tools
#------------------------------------------------------

# notification
zplug "marzocchi/zsh-notify"

# Tracks your most used directories, based on 'frecency'.
zplug "rupa/z", use:"*.sh"

# This plugin adds many useful aliases and functions.
zplug "plugins/git", from:oh-my-zsh

#------------------------------------------------------
# completions
#------------------------------------------------------

# Additional completion definitions for Zsh
zplug "zsh-users/zsh-completions"

# ZSH port of Fish shell's history search feature
zplug "zsh-users/zsh-history-substring-search", defer:2

# Autosuggestions
zplug "zsh-users/zsh-autosuggestions", defer:2

zplug "docker/compose", use:contrib/completion/zsh

# manual installed third party completions
if [ -e ~/.zsh/completions ]; then
  fpath=(~/.zsh/completions $fpath)
fi

autoload -U compinit
compinit


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

#------------------------------------------------------
# keymap
#------------------------------------------------------

# emacs mode
# If bindkey is undefined and EDITOR enviroment is vim in zshrc or zprofile, key binding seems to be in vim mode in child process zsh.
# ref: https://web-salad.hateblo.jp/entry/2014/12/07/090000
bindkey -e

#------------------------------------------------------
# fzf
#------------------------------------------------------
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_LEGACY_KEYBINDINGS=1

_gen_fzf_default_opts() {
  export FZF_DEFAULT_OPTS="
    --layout=reverse 
  "
  # export FZF_DEFAULT_OPTS="
  #   $FZF_DEFAULT_OPTS
  #   --layout=reverse 
  #   --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  #   --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  #   --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
  # "

  # export FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --color=bg+:#1e2132,bg:#161821,spinner:#84a0c6,hl:#6b7089,fg:#c6c8d1,header:#6b7089,info:#b4be82,pointer:#84a0c6,marker:#84a0c6,fg+:#c6c8d1,prompt:#84a0c6,hl+:#84a0c6"
}

_gen_fzf_default_opts

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

function fzf-ghq () {
    cd $(ghq list -p | fzf)
}
zle -N fzf-ghq
bindkey '^_' fzf-ghq

# docker
source ~/.ghq/github.com/kwhrtsk/docker-fzf-completion/docker-fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/satoruohzawa/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/satoruohzawa/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/satoruohzawa/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/satoruohzawa/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/satoruohzawa/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/satoruohzawa/node_modules/tabtab/.completions/slss.zshtest -e /Users/satoruohzawa/.iterm2_shell_integration.zsh && source /Users/satoruohzawa/.iterm2_shell_integration.zsh || true
