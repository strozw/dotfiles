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

export FPATH=~/.config/zsh/completions:$FPATH


# zstyle ':completion:*' ignore-parents 'parent pwd directory'
# zstyle ':completion:*' special-dirs true

# fpath
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi

#######################################################
# mise | asdf
#######################################################

# mise を利用する場合
eval "$(mise activate zsh)"
# export PATH="$HOME/.local/share/mise/shims:$PATH"

# adf を利用する場合
# . $(brew --prefix asdf)/libexec/asdf.sh
# . ~/.asdf/plugins/java/set-java-home.zsh

# for ruby build
export RUBY_CFLAGS="-w"
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export LDFLAGS="-L/opt/homebrew/opt/readline/lib"
export CPPFLAGS="-I/opt/homebrew/opt/readline/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/readline/lib/pkgconfig"
export optflags="-Wno-error=implicit-function-declaration"
export LDFLAGS="-L/opt/homebrew/opt/libffi/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libffi/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
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
alias ls='gls -GAF --color=auto'
alias eza='eza -aF --icons'
#alias ls='eza'
alias ll='eza -aglH --git'
alias less='less -R'
alias bat='bat --theme TwoDark'
alias rg='rg --hidden'
alias colorpallet='msgcat --color=test'
# FZF_PREVIEW_PREVIEW_BAT_THEME=base16

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

# eval "$(github-copilot-cli alias -- "$0")"

#######################################################
# sheldon
#######################################################

eval "$(sheldon source)"

#######################################################
# wezterm
#######################################################

if type wezterm &>/dev/null; then
	eval "$(wezterm shell-completion --shell zsh)"
fi

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
export FZF_DEFAULT_OPTS='
  --bind="F2:toggle-preview"
  --layout=reverse 
  --preview "bat --theme={} --color=always"
'

# fzf z
function fzf-z () {
    local selected_dir=$(z -t | sort -nr | awk '{ print $2 }' | fzf)
    if [ -n "$selected_dir" ]; then
			cd ${selected_dir}
			zle accept-line
    	zle clear-screen
    fi
}
zle -N fzf-z
bindkey '^@' fzf-z

# ghq
function fzf-ghq () {
	local selected_dir=$(ghq list -p | fzf)

	if [ -n "$selected_dir" ]; then
		cd ${selected_dir}
		zle accept-line
		zle clear-screen
	fi
}
zle -N fzf-ghq
bindkey '^_' fzf-ghq


# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
