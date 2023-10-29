# vim: set ft=zsh:

######################################################
# User PATH
#######################################################

typeset -U path PATH

eval $(/opt/homebrew/bin/brew shellenv -f)

export PATH="$HOME/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"

export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# rust
if [ -e "$HOME/.cargo/env" ]; then
	. "$HOME/.cargo/env"
fi

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/ruby/lib/pkgconfig"

# mocword
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

# pnpm
export PNPM_HOME="/Users/satoru/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

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
alias colorpallet='msgcat --color=test'
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

if [ -e ~/.config/broot/launcher/bash/br ]; then
	source ~/.config/broot/launcher/bash/br
fi

#######################################################
# starship 
# prompt
#######################################################

eval "$(starship init zsh)"

#######################################################
# Github Copilot
#######################################################

# eval "$(npx @githubnext/github-copilot-cli@latest alias -- "$0")"
eval "$(github-copilot-cli alias -- "$0")"

#######################################################
# sheldon
#######################################################

eval "$(sheldon source)"

#######################################################
# keymap
#######################################################

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
bindkey '^[' fzf-ghq

# docker
# source ~/ghq/github.com/kwhrtsk/docker-fzf-completion/docker-fzf.zsh

