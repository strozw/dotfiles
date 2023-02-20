if &compatible
  set nocompatible " Be iMproved
endif

" Required:
" Add the dein installation directory into runtimepath
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  " Required:
  call dein#begin('~/.cache/dein')

  call dein#load_toml('~/.config/nvim/dein/dein.toml', {'lazy': 0})
  call dein#load_toml('~/.config/nvim/dein/dein_lazy.toml', {'lazy': 1})
  
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable


source ./base.vim
