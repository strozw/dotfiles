######################################################
# User PATH
#######################################################
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# rust
source $HOME/.cargo/env

export JAVA_HOME=$(/usr/libexec/java_home --version=1.8)

export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"

export PATH="/usr/local/opt/ruby/bin:$PATH" export LDFLAGS="-L/usr/local/opt/ruby/lib" export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"


#######################################################
# anyenv
#######################################################

# export PATH="$HOME/.anyenv/bin:$PATH"
# eval "$(anyenv init -)"

#######################################################
# asdf
#######################################################

. $HOME/.asdf/asdf.sh

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
source /Users/satoruohzawa/.config/broot/launcher/bash/br

#------------------------------------------------------
# keymap
#------------------------------------------------------

# emacs mode
# If bindkey is undefined and EDITOR enviroment is vim in zshrc or zprofile, key binding seems to be in vim mode in child process zsh.
# ref: https://web-salad.hateblo.jp/entry/2014/12/07/090000
bindkey -e

#######################################################
# zinit
#######################################################

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zinit light yous/vanilli.sh

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
      ascii-soup/zsh-url-highlighter \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit light agkozak/zsh-z

# completion for git
zinit wait lucid is-snippet for \
  OMZL::git.zsh \
  OMZP::git

zinit wait lucid is-snippet as"completion" for \
      OMZP::docker/_docker \
      OMZP::docker-compose/_docker-compose \

#######################################################
# fzf
#######################################################

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

bindkey '^X^T' fzf-file-widget
bindkey '^T' transpose-chars

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

