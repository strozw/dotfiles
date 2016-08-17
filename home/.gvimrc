"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim用設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim')
  set background=dark
  "colorscheme hybrid
  let g:hybrid_use_Xresources = 1
  let g:hybrid_reduced_contrast = 1

  let g:enable_bold_font = 1
  set guifont=Ricty\ Regular\ for\ Powerline\ Nerd\ Font:h12
  set guifontwide=Ricty\ Regular\ for\ Powerline\ Nerd\ Font:h12
  set printfont=Ricty\ Regular\ for\ Powerline\ Nerd\ Font:h12
  set linespace=4

  "ビジュアルベル
  set visualbell
  set showtabline=2

  "自動IMオンを無効
  set imdisable

  "ツールバーを非表示
  set guioptions-=T
  set transparency=0

  "ESCでIMEをOFFにしたあとインサートに戻った際に自動的にIMEをONにする
  "set noimdisableactivate
  "set imdisableactivate
  map <silent> <ESC> <ESC>:set iminsert=0<CR>
endif


