"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Install Settings (vim plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:plugDir = $HOME . '/.vim/plugged'

" plug settings {{{

call plug#begin(s:plugDir)

Plug 'sudo.vim'

" 非同期タスク実行 (unite等で利用)
"Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" 非同期タスク実行(vim-tags の非同期実行に使用)
"Plug 'tpope/vim-dispatch'

" タグ生成
Plug 'szw/vim-tags'

" webapi.vim (各種web apiをvimから利用)
Plug 'mattn/webapi-vim'

" surround.vim (テキストオブジェクトを使いやすく)
Plug 'tpope/vim-surround'

" 直感的にテキスト置換
Plug 'osyo-manga/vim-over'

" smartword (全角文字の単語認識)
Plug 'kana/vim-smartword'

" コメントアウト
Plug 'tpope/vim-commentary'

" emmet (zencodingの利用)
Plug 'mattn/emmet-vim/'

" 括弧のオートクローズ
Plug 'kana/vim-smartinput'

" end系のオートクローズ
Plug 'cohama/vim-smartinput-endwise'

" ag (silver seacher による grep)
Plug 'rking/ag.vim'

Plug 'thinca/vim-qfreplace'

" editorconfig
Plug 'editorconfig/editorconfig-vim'

" タブ等による均等整形
Plug 'junegunn/vim-easy-align'

" ビジュアル選択後のrによる置換のアレを改善する
Plug 'kana/vim-niceblock'

" 軽量のpowerline系プラグイン
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" minimap
Plug 'severin-lemaignan/vim-minimap'

" color table
Plug 'guns/xterm-color-table.vim'

" 統合インターフェース (unite)
Plug 'Shougo/unite.vim'

" ファジーファインダ
Plug 'ctrlpvim/ctrlp.vim'

" スクリプト実行
Plug 'thinca/vim-quickrun'

" vimscript 向け console
"Plug 'rbtnn/vimconsole.vim'

" ブラウザ・オープン
Plug 'tyru/open-browser.vim'

Plug 'shime/vim-livedown'

" font size変更
Plug 'thinca/vim-fontzoom'

" scrooloose/syntastic.vim (各種ファイルタイプのシンタックスエラーの検出・表示)
Plug 'scrooloose/syntastic'

" Tagbar (ctagを見やすく表示) javascriptで利用時にnodeがhung
Plug 'majutsushi/tagbar'

" vim-fugitive (git コマンド利用)
Plug 'tpope/vim-fugitive'

" git log view (tig相当 fugitive依存) 
Plug 'gregsexton/gitv'

" vcsのステータス表示
Plug 'mhinz/vim-signify'

" dir単位のdiff
Plug 'vim-scripts/DirDiff.vim'

" インデント見やすく
Plug 'Yggdroot/indentLine'

" vim icon いろいろ
"Plug 'ryanoasis/vim-devicons'

Plug 'vim-scripts/Tabmerge'

" emji selector
Plug 'mattn/emoji-vim'

" ファイラUI
Plug 'Shougo/vimfiler'

" Tree viewr
Plug 'scrooloose/nerdtree'

" NERDTreeを各Tabで固定化
Plug 'jistr/vim-nerdtree-tabs'

" NERDTreeにgit statusを表示
Plug 'Xuyuanp/nerdtree-git-plugin'

" シェルUI
Plug 'Shougo/vimshell.vim'

" シェルUI拡張
Plug 'supermomonga/vimshell-pure.vim'

" vimshell と vimfiler でsshを利用するための拡張
Plug 'Shougo/neossh.vim'

" ===  Unite Source === {{{

" 最近使用したファイル
Plug 'Shougo/neomru.vim'

" unite-outline (Unite:アウトラインソース)
Plug 'Shougo/unite-outline'

" unite-help (Unite:ヘルプソース)
Plug 'tsukkee/unite-help'

" unite-tag (Unite:ctagソース)
Plug 'tsukkee/unite-tag'

" Unite vcs
Plug 'hrsh7th/vim-versions'

" unite-variable 追加
Plug 'thinca/vim-editvar'

" }}}

" === Syntax === {{{

" コンテキストによってfiletypeを自動で変更 
"Plug 'osyo-manga/vim-precious'
"Plug 'Shougo/context_filetype.vim'

Plug 'sheerun/vim-polyglot'

" sql
Plug 'vim-scripts/SQLComplete.vim'

"Plug 'plasticboy/vim-markdown'
Plug 'jtratner/vim-flavored-markdown'

" === Completion === {{{

" snipet
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Completion Framework
Plug 'Valloric/YouCompleteMe', { 'build': './install.py --all' }

" java Omni補完
Plug 'artur-shaik/vim-javacomplete2'

" }}}

" === Color Scheme === {{{
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'cocopon/iceberg.vim'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'joshdick/airline-onedark.vim'
Plug 'rakr/vim-one'
Plug 'edkolev/tmuxline.vim'

" }}}


" === PHP === {{{
Plug 'vim-scripts/tagbar-phpctags', {'for': 'php'}
" php.vim のfork版 (php syntax, 補完)
"Plug 'StanAngeloff/php.vim'

Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}

Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}

Plug 'drwX/php-doc.vim', {'for': 'php'}

Plug 'vim-php/vim-php-refactoring', {'for': 'php'}

Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}

" laravle blade
Plug 'xsbeats/vim-blade'
" }}}

" === JS === {{{
" javascript syntax
"Plug 'jelera/vim-javascript-syntax'

" es6のハイライト
Plug 'othree/yajs.vim'

" stage-0 のsyntax highlight
Plug 'othree/es.next.syntax.vim'

" jsdoc
Plug 'heavenshell/vim-jsdoc', {'for': 'javascript'}

" jsx (react)
Plug 'mxw/vim-jsx'

" vue
Plug 'posva/vim-vue'

" go lang
Plug 'fatih/vim-go'

"}}}


call plug#end()
" }}}
"


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

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" 行ハイライト
set nocursorline
"set cursorline

" 列ハイライト
set nocursorcolumn

set background=dark
set t_Co=256
"let g:hybrid_use_Xresources = 1
"let g:hybrid_use_iTerm_colors = 1
"let base16colorspace=16

"colorscheme hybrid
"colorscheme iceberg
"colorscheme base16-ocean
"colorscheme one

colorscheme onedark
let g:onedark_termcolors = 256
"let g:onedark_termcolors = 16
let g:onedark_terminal_italics = 1

" plugin settings
runtime! user/plugins/*.vim

" プロジェクトローカルなvimrc
set exrc
set secure

"augroup vimrc-local
"  autocmd!
"  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
"augroup END
"
"function! s:vimrc_local(loc)
"  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
"  for i in reverse(filter(files, 'filereadable(v:val)'))
"    source `=i`
"  endfor
"endfunction

