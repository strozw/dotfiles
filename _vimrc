""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype plugin indent off

if has('vim_starting')
	set runtimepath+=~/.vim/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle/'))
endif

" sudo.vim
NeoBundle 'sudo.vim'
" vim-fugitive
NeoBundle 'git://github.com/tpope/vim-fugitive'
" neocomplcache.vim
NeoBundle 'git://github.com/Shougo/neocomplcache'
" neocomplcache snippet
NeoBundle 'git://github.com/Shougo/neocomplcache-snippets-complete'
" vimproc
NeoBundle 'git://github.com/Shougo/vimproc'
" unite.vim
NeoBundle 'git://github.com/Shougo/unite.vim'
" vimfiler.vim
NeoBundle 'git://github.com/Shougo/vimfiler'
" vimshell.vim
NeoBundle 'git://github.com/Shougo/vimshell'
" unite-outline
NeoBundle 'git://github.com/h1mesuke/unite-outline'
" unite-help
NeoBundle 'git://github.com/tsukkee/unite-help'
" unite-tag
NeoBundle 'git://github.com/tsukkee/unite-tag'
" quickrun.vim
NeoBundle 'git://github.com/thinca/vim-quickrun'
" open-browser.vim
NeoBundle 'git://github.com/tyru/open-browser.vim'
" zencoding.vim
NeoBundle 'git://github.com/mattn/zencoding-vim'
" mattn/benchvimrc-vim
NeoBundle 'git://github.com/mattn/benchvimrc-vim'
" html5.vim
NeoBundle 'git://github.com/othree/html5.vim'
" hail2u/vim-css3-syntax
NeoBundle 'git://github.com/hail2u/vim-css3-syntax'
" vim colors solarized
NeoBundle 'git://github.com/altercation/vim-colors-solarized'
" vim powerline
NeoBundle 'git://github.com/Lokaltog/vim-powerline'
" phplint.vim
NeoBundle 'git://github.com/Jonty/phplint.vim'
" smartword
NeoBundle 'smartword'
" remote php debugger
"NeoBundle 'DBGp-Remote-Debugger-Interface'
" prefixer
" NeoBundle 'prefixer.vim'
" webapi.vim
NeoBundle 'git://github.com/mattn/webapi-vim'
" vimplenote.vim
NeoBundle 'git://github.com/mattn/vimplenote-vim'
" surround.vim
NeoBundle 'surround.vim'
" scrooloose/syntastic.vim
NeoBundle 'scrooloose/syntastic'
"Tagbar
NeoBundle 'git://github.com/majutsushi/tagbar'

"ファイルタイプ インデント プラグイン使用する
filetype plugin indent on

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
" vim-poerline で 代用
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"文字コードの自動認識
"適当な文字コード判別
set termencoding=utf-8
set encoding=utf-8
" MacVimの場合 gauche_guess により、自動的に文字コードの判別を行うので不要
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"UTF-8の□や○でカーソル位置がずれないようにする
if exists("&ambiwidth")
  set ambiwidth=double
endif

"改行コードの自動認識
set fileformats=unix,dos,mac

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

" grep
set grepprg=internal

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

" 補完キー
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
inoremap <expr><CR>    pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" Snnipets
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'

" neoconplecache snippet keybindings
"------------------
" snippets expand key
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"
"補完に辞書ファイル追加
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete =.,b,w,u,k,i,t

"
"コマンド補完
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"コマンド補完を強化
"set wildmenu
"リスト表示、最長マッチ
"set wildmode=longest,list,full


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
"Call Processing Apple Script
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"imap <C-G> <ESC>:w<CR>:call system('osascript /Users/satoru/bin/run_processing.scpt')<CR><CR>a
"nmap <C-G> :w<CR>:call system('osascript /Users/satoru/bin/run_processing.scpt')<CR><CR>

"
" File Syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.mxml set filetype=mxml
au BufNewFile,BufRead *.mkd setfiletype markdown
au BufNewFile,BufRead *.md setfiletype markdown 

"
" 相対行切り替え
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 703
  nnoremap  <silent> <Space>n :<C-u>ToggleNumber<CR>
  vnoremap  <silent> <Space>n :<C-u>ToggleNumber<CR> gv
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &number
      set relativenumber
    else
      set number
    endif
  endfunction
endif

"
"Align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"日本語でちょうど良く整形系させるために
let g:Align_xstrlen = 3

"
"Zen-Cording.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:user_zen_leader_key = '<c-e>'

"
"unite.vim
"参考：http://www.karakaram.com/vim/unite/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"unite prefix key.
nnoremap [unite] <Nop>
nmap <Space>f [unite]

"unite general settings
"インサートモード開始
"let g:unite_enable_start_insert = 1
"最近開いたファイル履歴お保存数
let g:unite_source_file_mru_limit = 15

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークを追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
" ライン
nnoremap <silent> [unite]l :<C-u>Unite line<CR>
" アウトライン
nnoremap <silent> [unite]ol :<C-u>Unite outline<CR>
" grep
nnoremap <silent> [unite]g :<C-u>Unite grep<CR>
"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
	"ESCでuniteでを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのきctrl+wでバックスラッシュも削除
	imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+jで縦に分割して開く
	nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"ctrl+lで横横に分割して開く
	nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <o> unite#do_action('open')
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
endfunction"}}}

syntax enable

"
" Unite-tag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C-] にマッピング
autocmd BufEnter *
\   if empty(&buftype)
\|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|  endif

"
" vimfiler.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default File Explorer
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

" Edit file by tabedit.
let g:vimfiler_edit_action = 'tabopen'

" Like Textmate icons.
let g:vimfiler_tree_leaf_icon = ' '
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '*'

" filename column min size
let g:vimfiler_min_filename_width = 30

" filename column max size
let g:vimfiler_max_filename_width = 60

" vim current dir を vimfilerに追従させる
let g:vimfiler_enable_auto_cd = 1

" VimFiler をNERDTreeっぽく使う方法
" 参考: http://d.hatena.ne.jp/hrsh7th/20120229/1330525683
nnoremap <F2> :VimFiler -buffer-name=explorer -split -winwidth=45 -toggle -no-quit -auto-cd<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
endfunction

let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

let my_action = { 'is_selectable' : 1 }                     
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

"
"quickrun.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
	\ 'type': 'markdown/pandoc',
	\ 'outputter': 'browser',
	\ 'cmdopt': '-s'
	\ }

"
"vim-powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Powerline_symbols = 'compatible'

"
" syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=1

"
" TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" タグバーの開閉を<F8>にマッピング
nmap <F8> :TagbarToggle<CR>


