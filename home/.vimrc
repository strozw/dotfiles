" vim:set foldmethod=marker:


set modeline

"========================================================
" Directory
"========================================================
"set pythonthreedll="/usr/local/Cellar/python/3.6.5/Frameworks/Python.framework/Versions/3.6/Python"
let &pythonthreedll = findfile("Python","/usr/local/Cellar/python3/**/Frameworks/**")


"========================================================
" Directory
"========================================================
"{{{1

let s:plugDir = $HOME . '/.vim/plugged'
let s:vimdir = $HOME . '/.vim'
let s:vim_tmp = $HOME . '/tmp/vim'
let s:undodir = s:vim_tmp . '/undo'

"1}}}


"========================================================
" Vim Plug
"========================================================
"{{{1

call plug#begin(s:plugDir)

"--------------------------------------------------------
" sudo
"--------------------------------------------------------
"Plug 'sudo.vim'

" 非同期タスク実行(vim-tags の非同期実行に使用)
"Plug 'tpope/vim-dispatch'

" webapi.vim (各種web apiをvimから利用)
"Plug 'mattn/webapi-vim'

" surround.vim (テキストオブジェクトを使いやすく)
Plug 'tpope/vim-surround'

" 直感的にテキスト置換
Plug 'osyo-manga/vim-over'

" smartword (全角文字の単語認識)
Plug 'kana/vim-smartword'

" コメントアウト
Plug 'tpope/vim-commentary'

" emmet (zencodingの利用)
Plug 'mattn/emmet-vim'

" 括弧のオートクローズ
"Plug 'kana/vim-smartinput'
Plug 'tpope/vim-ragtag'

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

" タグ生成
Plug 'szw/vim-tags'

" vimscript 向け console
"Plug 'rbtnn/vimconsole.vim'

" ブラウザ・オープン
Plug 'tyru/open-browser.vim'
Plug 'shime/vim-livedown'

" font size変更
Plug 'thinca/vim-fontzoom'

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
Plug 'vim-scripts/Tabmerge'

" インデント見やすく
Plug 'Yggdroot/indentLine'

" 非同期タスク実行 (unite等で利用)
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" 検索
Plug 'dyng/ctrlsf.vim'

"--------------------------------------------------------
" fazyfinder
"--------------------------------------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/unite.vim'

"--------------------------------------------------------
" filer
"--------------------------------------------------------
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Shougo/vimfiler'
Plug 'Shougo/neossh.vim'

"--------------------------------------------------------
" shell
"--------------------------------------------------------
"Plug 'Shougo/vimshell.vim'
"Plug 'supermomonga/vimshell-pure.vim'

"--------------------------------------------------------
" powerline
"--------------------------------------------------------
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"--------------------------------------------------------
" lint & make
"--------------------------------------------------------
Plug 'w0rp/ale'

"--------------------------------------------------------
" snipet
"--------------------------------------------------------
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

"--------------------------------------------------------
" filetype syntax
"--------------------------------------------------------
Plug 'sheerun/vim-polyglot'
" コンテキストによってfiletypeを自動で変更 
"Plug 'osyo-manga/vim-precious'
"Plug 'Shougo/context_filetype.vim'

"--------------------------------------------------------
" vue
"--------------------------------------------------------
Plug 'posva/vim-vue'

"--------------------------------------------------------
" php
"--------------------------------------------------------
Plug 'php-vim/phpcd.vim', { 'for': 'php' , 'do': 'composer update' }
Plug 'shawncplus/phpcomplete.vim', {'for': 'php'}
Plug 'vim-scripts/tagbar-phpctags', {'for': 'php'}
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
Plug 'drwX/php-doc.vim', {'for': 'php'}
Plug 'vim-php/vim-php-refactoring', {'for': 'php'}
Plug 'stephpy/vim-php-cs-fixer', {'for': 'php'}


"--------------------------------------------------------
" go lang
"--------------------------------------------------------
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

"--------------------------------------------------------
" java
"--------------------------------------------------------
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'}

"--------------------------------------------------------
" sql 
"--------------------------------------------------------
Plug 'vim-scripts/SQLComplete.vim', {'for': 'sql'}

"--------------------------------------------------------
" unite source
"--------------------------------------------------------
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-help'
Plug 'tsukkee/unite-tag'
Plug 'hrsh7th/vim-versions'
Plug 'thinca/vim-editvar'

"--------------------------------------------------------
" colorscheme
"--------------------------------------------------------
Plug 'joshdick/onedark.vim'
Plug 'w0ng/vim-hybrid'
Plug 'altercation/vim-colors-solarized'
Plug 'cocopon/iceberg.vim'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'

"Plug 'edkolev/tmuxline.vim'



"--------------------------------------------------------
" deoplate
"--------------------------------------------------------
Plug 'Shougo/deoplete.nvim' 
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'



"--------------------------------------------------------
" deoplete plugin
"--------------------------------------------------------
Plug 'landaire/deoplete-swift'
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'Shougo/neco-vim'
Plug 'Shougo/neco-syntax'
Plug 'ujihisa/neco-look'

call plug#end()
"1}}}

"========================================================
" swap & undo
"========================================================
"{{{1

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

"1}}}

"========================================================
"  Character
"========================================================
"{{{1

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

"1}}}

"========================================================
"  Search
"========================================================
"{{{1

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

"1}}}

"========================================================
"  GUI 
"========================================================
"{{{1

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

"1}}}

"========================================================
" ファイル・タイプ
"========================================================
"{{{1

" markdown
autocmd BufNewFile,BufRead *.mkd set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md.txt set filetype=markdown

"1}}}

"========================================================
" tags
"========================================================
"{{{1

" タグファイルの場所
set tags=tags
set tags+=*.tags

"1}}}

"========================================================
" keybinding
"========================================================
"{{{1

" leader key
let mapleader=','

"1}}}

"========================================================
" ビジュアルモード範囲内検索
"========================================================
"{{{1

" 範囲内検索をデフォルトに
vnoremap / <ESC>/\%V
vnoremap ? <ESC>?\%V

"1}}}

"========================================================
" colorsheme
"========================================================
"{{{1

syntax on
"set t_Co=256

let g:nord_comment_brightness = 15
colorscheme nord
set background=dark
set termguicolors


"1}}}

"========================================================
" Plugins: vim-tags
"========================================================
"{{{1

let g:vim_tags_project_tags_command ='ctags -R  --fields=+aimS {OPTIONS} {DIRECTORY} 2>/dev/null &'
let g:vim_tags_auto_generate = 0
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_use_ycm = 0
"let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
let g:vim_tags_ignore_files = []
let g:vim_tags_directories = ['.git', '.svn', 'CVS']
let g:vim_tags_main_file = 'tags'
let g:vim_tags_extension = '.tags'

"1}}}


"========================================================
" Plugins: DirDiff
"========================================================
"{{{1

let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git,.DS_Store"

"1}}}


"========================================================
" NERDTree
"========================================================
"{{{1

" GVim起動時にNERDTreeTabsを開かない
let g:nerdtree_tabs_open_on_gui_startup = 0

" NERDTreeGit Stats Icon
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "≠",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" keymap 
nnoremap <F2> :NERDTreeTabsToggle<Cr>
nnoremap <D-1> :NERDTreeTabsToggle<Cr>

"1}}}


"========================================================
" TagBar
"========================================================
"{{{1

" タグバーの開閉を<F8>にマッピング
nmap <F8> :TagbarToggle<CR>

"1}}}


"========================================================
" Plugin: airline.vim
"========================================================
"{{{1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.maxlinenr = '☰'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = '∄'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

let g:airline_powerline_fonts = 0

"let g:airline_theme='onedark'

"1}}}


"========================================================
" Plugin: Polyglot
"========================================================
"{{{1

let g:polyglot_disabled = ['go']

"1}}}


"========================================================
" Plugin: deoplate
"========================================================
"{{{1

let g:deoplete#enable_at_startup = 1
"let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
"let g:deoplete#ignore_sources.php = ['omni']

"1}}}

"========================================================
" unite.vim
" 参考：http://www.karakaram.com/vim/unite/
"========================================================
"{{{1

"unite prefix key.
nnoremap [unite] <Nop>
"nmap <Space>F [unite]
nmap <C-u> [unite]

"unite general settings
"インサートモード開始
"let g:unite_enable_start_insert = 1
"最近開いたファイル履歴お保存数
let g:unite_source_file_mru_limit = 40

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

" unite grep
"let g:unite_source_grep_default_opts = '-iRHn --exclude=''.tags'' --exclude=''tags'' --exclude=''.svn'' --exclude=''.git'''
let g:unite_source_grep_command = 'ag'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --ignore=''*.tags'' --ignore=''tags'' --ignore=''.svn'' --ignore=''.git'''
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates  = 200
let g:unite_source_rec_max_cache_files = 0
let g:unite_source_rec_async_command = ['pt --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""']
let g:unite_converter_file_directory_width = 100

call unite#custom#source('file_rec,file_rec/async', 'max_candidates', 0)

"現在開いているファイルのディレクトリ下のファイル一覧
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :UniteWithBufferDir file<CR>
nnoremap <silent> [unite]ff :Unite file/async -start-insert<CR>
"ソース一覧
nnoremap <silent> [unite]b :Unite source<CR>
"バッファ一覧
nnoremap <silent> [unite]b :Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :Unite bookmark<CR>
"ブックマークを追加
nnoremap <silent> [unite]a :UniteBookmarkAdd<CR>
" ライン
nnoremap <silent> [unite]l :Unite line<CR>
" アウトライン
nnoremap <silent> [unite]ol :Unite outline<CR>
" grep
nnoremap <silent> [unite]g :Unite grep -no-quit<CR>
" locate
nnoremap <silent> [unite]lo :Unite locate<CR>
" tag
nnoremap <silent> [unite]t :Unite tag -no-quit<CR>
" help
nnoremap <silent> [unite]h :Unite help<CR>
" versions
nnoremap <silent> [unite]v :Unite versions<CR>
" version/{type}/changeset
nnoremap <silent> [unite]vsc :Unite versions/svn/changeset<CR>
nnoremap <silent> [unite]vgc :Unite versions/git/changeset<CR>
" version/{type}/log
nnoremap <silent> [unite]vsl :Unite versions/svn/log<CR>
nnoremap <silent> [unite]vgl :Unite versions/git/log<CR>
" version/{type}/status
nnoremap <silent> [unite]vss :Unite versions/svn/status<CR>
nnoremap <silent> [unite]vgs :Unite versions/git/status<CR>

nnoremap <silent> [unite]p :<C-u>call <SID>unite_project('-start-insert')<CR>

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec:' . dir
endfunction

" 現在のプロジェクト内のファイルを一望する
" 参考 : http://d.hatena.ne.jp/h1mesuke/20110918/p1
nnoremap <silent> [unite]p :<C-u>call <SID>unite_project('-start-insert')<CR>
function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec:' . dir
endfunction


"--------------------------------------------------------
" Unite-line
"--------------------------------------------------------
nnoremap <silent> <C-l> :<C-u>UniteWithCursorWord line<CR>

"--------------------------------------------------------
" Unite-grep
"--------------------------------------------------------
nnoremap <silent> <C-g> :<C-u>UniteWithCursorWord grep:./<CR>

"--------------------------------------------------------
" unite-tag
"--------------------------------------------------------
let g:unite_source_tag_max_name_length = 25
let g:unite_source_tag_max_fname_length = 150

" C-] にマッピング
autocmd BufEnter *
\   if empty(&buftype)
\|        nnoremap <buffer> <C-j> :<C-u>UniteWithCursorWord tag<CR>
\|   endif

" Unite-jump タグジャンプ前の位置一覧
nnoremap <silent> <C-t> :<C-u>Unite jump<CR>

"1}}}

"========================================================
" ctrlp
"========================================================
"{{{1

"if executable('rg')
"  set grepprg=rg\ --color=never
"  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
"  let g:ctrlp_use_caching = 0
"elseif executable('ag')
  set grepprg=ag\ --nocolor
  let g:ctrlp_use_caching = 0
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
"endif

"1}}}

"========================================================
" Local
"========================================================
"{{{1

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

"1}}}

" plugin settings
"runtime! user/plugins/*.vim

" プロジェクトローカルなvimrc
"set exrc
"set secure



