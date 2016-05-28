
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ディレクトリ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vimdir = $HOME . '/.vim'
let s:vim_tmp = $HOME . '/tmp/vim'
let s:undodir = s:vim_tmp . '/undo'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" swap & undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" via :set directory
let &directory = s:vim_tmp
" via :set undodir
let &undodir = s:undodir


"ファイルを上書きする前にバックアップを作る。
"書き込みが成功してバックアップはそのまま取っておく。
"(有効:backup/無効:nobackup)
set nobackup

"ファイルの上書きの前にバックアップを作る。
"オプション'backup'がオンでない限り、バックアップは上書きに成功した後削除される。
"(有効:writebackup/無効nowritebackup)
set writebackup

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Character
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"文字コードの自動認識
"適当な文字コード判別
set termencoding=utf-8
set encoding=utf-8

if !has('mac')
  " MacVimの場合 gauche_guess により、自動的に文字コードの判別を行うので不要
  set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
endif

" タブ 空白表示
"set list
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"UTF-8の□や○でカーソル位置がずれないようにする
if exists("&ambiwidth")
  set ambiwidth=double
endif

if has('mac')
  " UTF-8-MACの濁点、半濁点を含む文字を強調して表示する
  highlight Opaques term=underline ctermbg=DarkGreen guibg=DarkGreen
  match Opaques /\(\%u3099\|%u309a\)/
endif

set fileformat=unix

"改行コードの自動認識
set fileformats=unix,dos,mac

" 折りたたみ(フォールド設定)
set foldmethod=syntax
set foldlevel=100
set nofoldenable

"Insertモードで<tab>を挿入するとき、代わりに適切な数の空白を使う。
set noexpandtab

"入力されているテキストの最大幅。行がそれより長くなると、
"この幅を超えない様に空白の後で改行される。
"値を0に設定すると無効になる。
set textwidth=0

" textwidthが0の時にかってに改行してしまうのを止める
set formatoptions=q

"新しい行を開始したとき(Insertモードで<CR>を打ち込むか、コマンド"o"や"0"を使った時)
"新しい行のインデントを現在の行と同じくする。
"(有効:autoindent/無効:noautoindent)
set autoindent

"ファイル内の<tab>が対応する空白の数。
set tabstop=4

"<Tab>の挿入や<BS>の使用等の編集操作をするときに、<Tab>が対応する空白の数。
set softtabstop=4

"autoindent時のタブの幅半角空白で指定する。
set shiftwidth=4

"オンの時は、ウィンドウの幅より長い行は折り返され、次の行に続けて表示される。
"(有効:wrap/無効:nowrap)
set wrap

set display=lastline

" インサート時のbackspace
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 検索内容をハイライト
set hlsearch

" 検索ハイライトを解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"検索パターンにおいて大文字と小文字を区別しない。
set noignorecase

"検索パターンが大文字を含んでいたらオプション 'ignorecase'を上書きする。
set nosmartcase

"検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。
"(有効:wrapscan/無効:nowrapscan)
set wrapscan

" grepは外部コマンドを使用する
set grepprg=internal


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  GUI 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show line number
set number

"カーソルが何行目の何列目に置かれているかを表示する。
set ruler


"閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプルする。
set showmatch

"最下ウィンドウにいつステータス行が表示されるかを設定する。
"    0:全く表示しない
"    1:ウィンドウの数が2以上の時のみ表示
"    2:常に表示
set laststatus=2

"ステータスバーに文字コードと改行コード表示
" airline で 代用
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"コマンド(の一部)を画面の最下行に表示する。
set showcmd

" 1. コマンドライン 

" コマンド補完を強化
set wildmenu

" リスト表示、最長マッチ
"set wildmode=longest,list,full
set wildmode=longest,full

" 補完に辞書ファイル追加
"set complete =.,b,w,u,k,i,t

" コマンドラインの高さ
set cmdheight=2

" 2. クリップボード
set clipboard=unnamed,unnamedplus


" 3. マウス
set mouse=a

" 4. 補完
" 補完表示設定
set completeopt=menu,preview,menuone

" 折りたたみ
" 折りたたみ(フォールド設定)
set foldmethod=syntax
set foldlevel=100
set nofoldenable

" ウィンドウを分割で開く際に、右側に表示する。
set splitright

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイル・タイプ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ghmarkdown
"autocmd BufNewFile,BufRead *.mkd set filetype=ghmarkdown
"autocmd BufNewFile,BufRead *.md set filetype=ghmarkdown
"autocmd BufNewFile,BufRead *.md.txt set filetype=ghmarkdown

" markdown
autocmd BufNewFile,BufRead *.mkd set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md.txt set filetype=markdown

" html.erb
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html

" jsx
autocmd BufNewFile,BufRead *.jsx set filetype=javascript.jsx



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" タグファイルの場所
set tags=tags
set tags+=*.tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" keybinding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" leader key
let mapleader=','


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ビジュアルモード範囲内検索
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 範囲内検索をデフォルトに
vnoremap / <ESC>/\%V
vnoremap ? <ESC>?\%V

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorsheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on

if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

" 行ハイライト
"set cursorline
set nocursorline

" 列ハイライト
set nocursorcolumn

set background=dark
set t_Co=256
let base16colorspace=256
let g:solarized_termcolors = 256
let g:solarized_contrast = 'high'
let g:hybrid_use_Xresources = 1
let g:hybrid_use_iTerm_colors = 1
let base16colorspace=256

"colorscheme solarized
"colorscheme hybrid
"colorscheme iceberg
colorscheme base16-ocean
"colorscheme spacegray



