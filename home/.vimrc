
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Initial Variable
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" .vim ディレクトリ
let s:vimdir = $HOME . '/.vim'
let s:vim_tmp = $HOME . '/tmp/vim'
let s:undodir = s:vim_tmp . '/undo'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Install Settings (vim plug)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:plugDir = $HOME . '/.vim/plugged'
" plug settings {{{

call plug#begin(s:plugDir)

" 非同期タスク実行 (unite等で利用)
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" 非同期タスク実行(vim-tags の非同期実行に使用)
Plug 'tpope/vim-dispatch'

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

" vim-quickhl (選択箇所の複数ハイライト)
Plug 't9md/vim-quickhl'

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
" Plug 'editorconfig/editorconfig-vim'

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
Plug 'rbtnn/vimconsole.vim'

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

Plug 'mhinz/vim-startify'

" vim icon いろいろ
Plug 'ryanoasis/vim-devicons'

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

" Unite todo source
Plug 'kannokanno/unite-todo'

" Unite color scheme source
Plug 'ujihisa/unite-colorscheme'

" Unite vcs
Plug 'hrsh7th/vim-versions'

" unite-variable 追加
Plug 'thinca/vim-editvar'

" }}}

" === Syntax === {{{

" コンテキストによってfiletypeを自動で変更 
"Plug 'osyo-manga/vim-precious'
"Plug 'Shougo/context_filetype.vim'


" json filetype
Plug 'elzr/vim-json'

" json 整形
Plug '5t111111/neat-json.vim'

" html5.vim (html5シンタックス)
Plug 'othree/html5.vim'


" lepture/vim-css css3シンタックス
Plug 'hail2u/vim-css3-syntax'

" scss
Plug 'cakebaker/scss-syntax.vim'


" handlebars and mustache
Plug 'mustache/vim-mustache-handlebars'

" sql
Plug 'vim-scripts/SQLComplete.vim'

" vim-ruby (ruby syntax, 補完)
Plug 'vim-ruby/vim-ruby'
 

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

" base16 color
Plug 'chriskempson/base16-vim'

Plug 'ajh17/Spacegray.vim'

" }}}


" === PHP === {{{
Plug 'vim-scripts/tagbar-phpctags'
" php.vim のfork版 (php syntax, 補完)
Plug 'StanAngeloff/php.vim'

Plug 'arnaud-lb/vim-php-namespace', { 'for': 'php' }

Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }

Plug 'drwX/php-doc.vim', { 'for': 'php' }

Plug 'vim-php/vim-php-refactoring', { 'for': 'php' }

Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }

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
Plug 'heavenshell/vim-jsdoc'

" jsx (react)
Plug 'mxw/vim-jsx'

" vue
Plug 'posva/vim-vue'
"}}}


call plug#end()
" }}}


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


" {{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{{

"	Plugins

" }}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 1
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:EclimCompletionMethod = 'omnifunc'
autocmd BufEnter FileType javascript nnoremap ,gd :<C-u>YcmCompleter GetDoc<CR>
autocmd BufEnter Filetype javascript nnoremap ,gt :<C-u>YcmCompleter GoTo<CR>
autocmd BufEnter FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dirdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git,.DS_Store"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1

if has('gui_running')
  let g:airline#extensions#tabline#enabled = 0
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
else
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  "let g:airline_left_sep = ''
  "let g:airline_left_alt_sep = ''
  "let g:airline_right_sep = ''
  "let g:airline_right_alt_sep = ''
  "let g:airline_theme='bubblegum'
endif

let g:airline_theme='base16'
"let g:airline_theme='hybrid'
"let g:airline_theme='tomorrow'
"let g:airline_theme='wombat'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite.vim
" 参考：http://www.karakaram.com/vim/unite/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
let g:unite_source_grep_command = 'pt'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --ignore=''*.tags'' --ignore=''tags'' --ignore=''.svn'' --ignore=''.git'''
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates  = 200
let g:unite_source_rec_max_cache_files = 0
let g:unite_source_rec_async_command = ['pt --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""']
let g:unite_converter_file_directory_width = 100

call unite#custom#source('file_rec,file_rec/async',
    \ 'max_candidates', 0)


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-l> :<C-u>UniteWithCursorWord line<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-g> :<C-u>UniteWithCursorWord grep:./<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite-tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_tag_max_name_length = 25
let g:unite_source_tag_max_fname_length = 150

" C-] にマッピング
autocmd BufEnter *
\   if empty(&buftype)
\|        nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord tag<CR>
\|   endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-jump タグジャンプ前の位置一覧
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-t> :<C-u>Unite jump<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimfiler.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自動カレントディレクトリ変更 OFF
let g:vimfiler_enable_auto_cd = 0

" Default File Explorer
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0


" filename column min size
let g:vimfiler_min_filename_width = 30
"
" filename column max size
let g:vimfiler_max_filename_width = 60

" VimFiler をNERDTreeっぽく使う方法
command! -nargs=0 MyVimFilerExp call s:my_vimfiler_exp()
function! s:my_vimfiler_exp()
    if (exists(":VimFilerCurrentDir") == 2)
      :VimFilerCurrentDir -explorer -winwidth=50<Cr>
    else
      :VimFilerExplorer -winwidth=50<Cr>
    endif
endfunction

"nnoremap <F2> :MyVimFilerExp<Cr>
"nnoremap <D-1> :MyVimFilerExp<Cr>

" my_split
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

" my_vsplit
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

" my_tabopen
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'tabedit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_tabopen', my_action)

" unite-file_rec/async の除外パターン
call unite#custom#source('file_rec/async', 'ignore_pattern', '\.\(png\|gif\|jpeg\|jpg\|JPG\|mpeg\|flv\|avi\|swf\|ico\|icon\|app\|exe\|svn\|git\)$')
let g:unite_source_rec_max_cache_files = 10000

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"quickrun.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :QuickRun<Cr>
let g:quickrun_config = {}

" vimproc使用
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 10,
\   },
\   'html' : { 'command' : 'open' },
\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 
\ 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html'] 
\}

let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0

" HTML
"let g:syntastic_html_checkers = ['jshint']
let g:syntastic_html_validator_parser = 'html5'
let g:syntastic_javascript_checkers=['jsxhint']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TagBar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" タグバーの開閉を<F8>にマッピング
nmap <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quickhl
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ハイライトトグル <Space>m にマッピング
nmap <Space>h <Plug>(quickhl-toggle)
xmap <Space>h <Plug>(quickhl-toggle)

" ハイライトリセット <Space> にマッピング
nmap <Space>H <Plug>(quickhl-reset)
xmap <Space>H <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_tags_project_tags_command ='ctags -R  --fields=+aimS {OPTIONS} {DIRECTORY} 2>/dev/null &'
let g:vim_tags_auto_generate = 0
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_use_ycm = 0
"let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
let g:vim_tags_ignore_files = []
let g:vim_tags_directories = ['.git', '.svn', 'CVS']
let g:vim_tags_main_file = 'tags'
let g:vim_tags_extension = '.tags'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" context_filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"g:context_filetype#filetypes['ghmarkdown'] = g:context_filetype#filetypes['markdown']
"let g:context_filetype#filetypes = {
"\ 'html': [
"\   {
"\    'start':
"\     '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)>',
"\    'end': '</script>', 'filetype': 'javascript',
"\   },
"\   {
"\    'start':
"\     '<script>',
"\    'end': '</script>', 'filetype': 'javascript',
"\   },
"\   {
"\    'start': '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)>',
"\    'end': '</style>', 'filetype': 'css',
"\   },
"\   {
"\    'start': '<style>',
"\    'end': '</style>', 'filetype': 'css',
"\   },
"\   {
"\    'start': '<?php\?',
"\    'end': '?>', 'filetype': 'php',
"\   }
"\ ],
"\ 'vue': [
"\   {
"\    'start': '<script\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
"\    'end': '</script>', 'filetype': '\1',
"\   },
"\   {
"\    'start': '<script>',
"\    'end': '</script>', 'filetype': 'javascript',
"\   },
"\   {
"\    'start': '<style\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
"\    'end': '</style>', 'filetype': '\1',
"\   },
"\   {
"\    'start': '<style>',
"\    'end': '</style>', 'filetype': 'css',
"\   },
"\   {
"\    'start': '<template\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
"\    'end': '</template>', 'filetype': '\1',
"\   },
"\   {
"\    'start': '<template>',
"\    'end': '</template>', 'filetype': 'html',
"\   },
"\ ],
"\}

"""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-devicons
"""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""

" GVim起動時にNERDTreeTabsを開かない
let g:nerdtree_tabs_open_on_gui_startup = 0

" NERDTreeGit Stats Icon
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" keymap 
nnoremap <F2> :NERDTreeTabsToggle<Cr>
nnoremap <D-1> :NERDTreeTabsToggle<Cr>

let g:minimap_highlight='Visual'

