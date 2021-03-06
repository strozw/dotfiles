set -x LC_ALL ja_JP.UTF-8
set -x LANG ja_JP.UTF-8
set -x TERM xterm-256color
set -x COLORTERM truecolor
set -x SHELL /usr/local/bin/fish
set -x EDITOR nvim
set -x NEXTWORD_DATA_PATH ~/share/nextword-data-large/
#set -x SHELL /usr/local/bin/fish

#######################################################
# path
#######################################################
set -g PATH /usr/local/bin $PATH
set -g PATH /usr/local/sbin $PATH
set -g PATH /usr/local/opt/coreutils/libexec/gnubin $PATH
set -g PATH ~/Library/Python/2.7/bin $PATH
set -g PATH ~/Library/Python/3.7/bin $PATH
set -g PATH ~/go/bin $PATH
set -g PATH ~/bin $PATH

set -x MANPATH /usr/local/opt/coreutils/libexec/gnuman $MANPATH

# golang
set -x GOPATH $HOME/go

# rust
source $HOME/.cargo/env


#set -x JAVA_HOME `/usr/libexec/java_home --version=1.8`
set -g PATH "/usr/local/opt/imagemagick@6/bin" $PATH
set -g PATH $HOME/.fzf/bin $PATH

#######################################################
# anyenv
#######################################################

# anyenv 
set -g PATH $HOME/.anyenv/bin $PATH
eval (anyenv init - | source)

#######################################################
# for Ruby puma thread
#######################################################
set -x OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES

#######################################################
# alias
#######################################################

alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias rm='gomi'
alias ls='gls -GAF --color=auto'
#alias ll='ls -l'
alias ll='exa -lgh --git'
alias exa='exa -aF'
alias less='less -R'
alias bat='bat --theme TwoDark'

#######################################################
# keybinding
#######################################################

function fish_user_key_bindings
  bind \c_ 'fzf-ghq'
  bind \c\@ 'fzf-ghq'
  bind \c^ 'fzf-z'
  bind \cz 'fzf-z'
  #bind \cb 'fzf-git-checkout-branch'
end

#######################################################
# starship
#######################################################
starship init fish | source


#######################################################
# spacefish
#######################################################

# set -g theme_nerd_fonts yes
# set -x SPACEFISH_KUBECONTEXT_SHOW false
# set -x SPACEFISH_PACKAGE_SHOW false
# 
# set -x SPACEFISH_PROMPT_DEFAULT_PREFIX ''
# set -x SPACEFISH_GIT_SYMBOL (printf '\ue702 ')
# set -x SPACEFISH_RUBY_SYMBOL (printf '\Ue739')
# set -x SPACEFISH_NODE_SYMBOL (printf '\ue718 ')
# set -x SPACEFISH_DOCKER_SYMBOL (printf '\Ue7b0 ')



#######################################################
# fzf
#######################################################

set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --follow --glob "!.git/*"'
set -x FZF_LEGACY_KEYBINDINGS 1

function _gen_fzf_default_opts
  set color00 '#282c34'
  set color01 '#353b45'
  set color02 '#3e4451'
  set color03 '#545862'
  set color04 '#565c64'
  set color05 '#abb2bf'
  set color06 '#b6bdca'
  set color07 '#c8ccd4'
  set color08 '#e06c75'
  set color09 '#d19a66'
  set color0A '#e5c07b'
  set color0B '#98c379'
  set color0C '#56b6c2'
  set color0D '#61afef'
  set color0E '#c678dd'
  set color0F '#be5046'

  # set -x FZF_DEFAULT_OPTS "\
  #   --layout=reverse \
  #   --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D \
  #   --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C \
  #   --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D \
  # "
  set -x FZF_DEFAULT_OPTS "$FZF_DEFAULT_OPTS --color=bg+:#1e2132,bg:#161821,spinner:#84a0c6,hl:#6b7089,fg:#c6c8d1,header:#6b7089,info:#b4be82,pointer:#84a0c6,marker:#84a0c6,fg+:#c6c8d1,prompt:#84a0c6,hl+:#84a0c6"
end

_gen_fzf_default_opts

function fzf-git-checkout-branch -d "Fuzzy-find and checkout a branch"
  git branch | grep -v HEAD | string trim | fzf | read -l result; and git checkout "$result"
  commandline -f repaint
end

alias cb fzf-git-checkout-branch

function fzf-ssh -d "Fuzzy-find ssh host via ag and ssh into it"
  ag --ignore-case '^host [^*]' ~/.ssh/config | cut -d ' ' -f 2 | fzf | read -l result; and ssh "$result"
end

alias fssh fzf-ssh

alias fzf-ghq __ghq_repository_search

function fzf-z -d "Fuzzy-find z"
   z -tl | sort -nr | awk '{ print $2 }' | fzf | read -l result; and cd "$result"
  commandline -f repaint
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
