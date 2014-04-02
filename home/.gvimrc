"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
"set background=dark
"colorscheme solarized
colorscheme my-hybrid
"colorscheme iceberg
"colorscheme base16-ocean
"colorscheme my-base16-ocean

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimのGUI版で使用するフォントのリスト。
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
":set guifont=Inconsolata:h13
":set guifontwide=Takaoゴシック:h13
set guifont=Ricty\ for\ Powerline:h13
set guifontwide=Ricty\ for\ Powerline:h13

"画面上の列幅を設定する。
"set columns=110
"画面上の行数。
"set lines=50

"コマンドラインに使われる画面上の行数。
set cmdheight=1

" このオプションは、いつタブページのラベルを表示するかを指定する。
"  0:表示しない
" 1:２個以上のタブページがあるときのみ表示
" 2:常に表示
set showtabline=2

" 前回の検索パータンが存在するとき、それにマッチするテキストを全て強調表示する。
"  (有効:hlsearch/無効:nohlsearch)
set hlsearch

" Visual選択で選択されたテキストが、自動的にクリップボードレジスタ"*"にコピーされる。
"set guioptions+=a
"set guioptions-=m

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MacVim用設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('gui_macvim')
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
