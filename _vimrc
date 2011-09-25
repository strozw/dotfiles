""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let $PYTHON_DLL="/System/Library/Frameworks/Python.framework/Versions/2.6/Python"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/vundle.git
call vundle#rc()

" git.vim
Bundle 'motemen/git-vim'
" neocomplcache.vim
Bundle 'Shougo/neocomplcache'
" unite.vim
Bundle 'Shougo/unite.vim'
" html5.vim
Bundle 'html5.vim'
" NERDTree
Bundle 'scrooloose/nerdtree'
" quickrun.vim
Bundle 'ujihisa/quickrun'
" zencoding.vim
Bundle 'mattn/zencoding-vim'
" css3.vim
Bundle 'css3'
" remote php debugger
Bundle 'DBGp-Remote-Debugger-Interface'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" debuggerのpythonファイル
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"pyfile ~/.vim/bundle/remote-PHP-debugger/plugin/debugger.py

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
".vimrc設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" .swap ファイルの出力先
set directory=~/tmp/vim
"検索パターンにおいて大文字と小文字を区別しない。
"(有効:ignorecase/無効:noignorecase)
set noignorecase
"検索パターンが大文字を含んでいたらオプション 'ignorecase'を上書きする。
"(有効:smartcase/無効nosmartcase)
set nosmartcase

"ファイル内の<tab>が対応する空白の数。
set tabstop=4
"<Tab>の挿入や<BS>の使用等の編集操作をするときに、<Tab>が対応する空白の数。
set softtabstop=4
"Insertモードで<tab>を挿入するとき、代わりに適切な数の空白を使う。
"(有効:expandtab/無効:noexpandtab)
set noexpandtab

"入力されているテキストの最大幅。行がそれより長くなると、
"この幅を超えない様に空白の後で改行される。
"値を0に設定すると無効になる。
set textwidth=0
"新しい行を開始したとき(Insertモードで<CR>を打ち込むか、コマンド"o"や"0"を使った時)
"新しい行のインデントを現在の行と同じくする。
"(有効:autoindent/無効:noautoindent)
set autoindent

"autoindent時のタブの幅半角空白で指定する。
set shiftwidth=4

"オンの時は、ウィンドウの幅より長い行は折り返され、次の行に続けて表示される。
"(有効:wrap/無効:nowrap)
set wrap

"検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。
"(有効:wrapscan/無効:nowrapscan)
set wrapscan
"オンのとき、コマンドライン補完が拡張モードで行われる。
"(有効:wildmenu/無効:nowildmenu)
set wildmenu

"閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプルする。
"(有効:showmatch/無効:noshowmatch)
set showmatch

"毎行の前に行番号を表示する。
"(有効:number/無効:nonumber)
set number
"カーソルが何行目の何列目に置かれているかを表示する。
"(有効:ruler/無効:noruler)
set ruler
"タブ文字をCTRL-Iで表示し、行末に$で表示する。
"(有効:list/無効:nolist)
set nolist
"Listモード(訳注:オプション'list'がオンのとき)に使われる文字を設定する。
":set listchars=tab:>-,extends:<,trail:-,eol:<

"最下ウィンドウにいつステータス行が表示されるかを設定する。
"	0:全く表示しない
"	1:ウィンドウの数が2以上の時のみ表示
"	2:常に表示
set laststatus=2
"コマンド(の一部)を画面の最下行に表示する。
"(有効:shocmd/無効:noshowcmd)
set showcmd

"ファイルを上書きする前にバックアップを作る。
"書き込みが成功してバックアップはそのまま取っておく。
"(有効:backup/無効:nobackup)
set nobackup
"ファイルの上書きの前にバックアップを作る。
"オプション'backup'がオンでない限り、バックアップは上書きに成功した後削除される。
"(有効:writebackup/無効nowritebackup)
set writebackup

"エンコーディング関連
"ステータスバーに文字コードと改行コード表示
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set ffs=unix,dos,mac " 改行文字

"文字コードの自動認識
"適当な文字コード判別
set termencoding=utf-8
set encoding=utf-8
" MacVimの場合 gauche_guess により、自動的に文字コードの判別を行うので不要
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"UTF-8の□や○でカーソル位置がずれないようにする
if exists("&ambiwidth")
  set ambiwidth=double
endif

"改行コードの自動認識
set fileformats=unix,dos,mac

"UTF-8の□や○でカーソル位置がずれないようにする
"Terminal.appはどっちにしてもダメ，PrivatePortsのiTermでやる
set ambiwidth=double
"シンタックスカラーリングオン
syntax on 

" ※MacのQuicklookでVimで保存したUTF-8テキストが文字化けする対策。
" UTF-8を保存する際、
" UTF-8エンコーディングを表す拡張属性をを追加する。
au BufWritePost * call SetUTF8Xattr(expand("<afile>"))
function! SetUTF8Xattr(file)
	let isutf8 = &fileencoding == "utf-8" || ( &fileencoding == "" && &encoding == "utf-8")
	if has("unix") && match(system("uname"),'Darwin') != -1 && isutf8
		call system("xattr -w com.apple.TextEncoding 'utf-8;134217984' '" . a:file . "'")
	endif
endfunction



"
"neocomplcache
"参考：http://vim-users.jp/2010/10/hack177/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AutoComplepop OFF
let g:acp_enableAtStartup = 0
"let g:AutoComplPop_NotEnableAtStartup = 1
"NeoComplCache起動
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Don't use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 0 
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_keyword_length = 3 
 " Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
  \'default':'',
  \}
" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif
" 英数字の単語の頭文字
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
" Snnipets
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'

" neocon keybindings
"------------------
" <TAB> completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" snippets expand key
imap <silent> <C-s> <Plug>(neocomplcache_snippets_expand)
smap <silent> <C-s> <Plug>(neocomplcache_snippets_expand)

"
"補完に辞書ファイル追加
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete =.,b,w,u,k,i,t
"ファイルタイプによるインデントを行う
filetype indent on 
"ファイルタイプごとのプラグインを使う
filetype plugin on 

"
"コマンド補完
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"コマンド補完を強化
"set wildmenu			
"リスト表示、最長マッチ
"set wildmode=list:full

"
"Omni補完関連
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"補完表示設定
set completeopt=menu,preview,menuone

"ポップアップメニューの色
highlight Pmenu ctermbg=lightcyan ctermfg=black
highlight PmenuSel ctermbg=blue ctermfg=black
highlight PmenuSbar ctermbg=darkgray
highlight PmenuThumb ctermbg=lightgray

"
"NERDtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>d :execute 'NERDTreeToggle ' . getcwd()<CR>

"
"Call Processing Apple Script
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"imap <C-G> <ESC>:w<CR>:call system('osascript /Users/satoru/bin/run_processing.scpt')<CR><CR>a
"nmap <C-G> :w<CR>:call system('osascript /Users/satoru/bin/run_processing.scpt')<CR><CR>

"
"Actionscript Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.mxml set filetype=mxml

"
"Align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"日本語でちょうど良く整形系させるために
let g:Align_xstrlen = 3

"
"Zen-Cording.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:usr_zen_expandword_key = '<c-e>'


