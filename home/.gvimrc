"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable

set background=dark
"colorscheme my-hybrid
"colorscheme iceberg

let g:enable_bold_font = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimのGUI版で使用するフォントのリスト。
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
":set guifont=Inconsolata:h13
":set guifontwide=Takaoゴシック:h13
set linespace=3

"画面上の列幅を設定する。
"set columns=110
"画面上の行数。
"set lines=50


" Visual選択で選択されたテキストが、自動的にクリップボードレジスタ"*"にコピーされる。
"set guioptions+=a
"set guioptions-=m

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:airline#extensions#tabline#enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim用設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim')

  set guifont=Ricty\ for\ Powerline:h12
  set guifontwide=Ricty\ for\ Powerline:h12
  set printfont=Ricty\ for\ Powerline:h12

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

  "起動時にフルスクリーン化
  "if has("gui_running")
  "	set fuoptions=maxvert,maxhorz
  "	au GUIEnter * set fullscreen
  "endif
endif

