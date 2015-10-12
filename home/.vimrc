"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vi との互換モードをOFF
set nocompatible

" ファイルタイプ:インデント プラグイン使用をOFF
filetype plugin indent off


" Neobundle のパス設定
if has('vim_starting')
    if has("win32") || has("win64") || has("win32unix")
        " windows
        set runtimepath+=~/vimfiles/neobundle.vim/
        call neobundle#begin(expand('~/vimfiles/bundle/'))

        " プロキシ環境用の設定ファイルを読み込む（リポジトリでは管理しない）
        if filereadable($HOME . '/_vimrc.local')
          source $HOME/_vimrc.local
        endif
    else
        " その他
        set runtimepath+=~/.vim/neobundle.vim/
        call neobundle#begin(expand('~/.vim/bundle/'))

        let $PYTHON_DLL = '/usr/local/Cellar/python/2.7.10_2/Frameworks/Python.framework/Versions/2.7/Python'
        let $PYTHON3_DLL= '/usr/local/Cellar/python3/3.4.3_2/Frameworks/Python.framework/Versions/3.4/Python'

        " プロキシ環境用の設定ファイルを読み込む（リポジトリでは管理しない）
        if filereadable($HOME . '/.vimrc.local')
          source $HOME/.vimrc.local
        endif
    endif
endif

" sudo.vim (root権限でファイルを編集するなど)
NeoBundle 'sudo.vim'

" vim 非同期プロセス
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }

" バイナリ　エディット
NeoBundle "Shougo/vinarise.vim"

" auto complete
NeoBundle "Shougo/neocomplete.vim"

" neocomplcache & neocomplete 互換 snippet (スニペット補完)
NeoBundle 'Shougo/neosnippet'

" youcompletme
"NeoBundle 'Valloric/YouCompleteMe' , {
"\ 'build' : {
"\     'mac' : './install.sh',
"\     'unix' : './install.sh',
"\    },
"\ }

" snipmate default snippets
NeoBundle 'honza/vim-snippets'

" unite.vim (ランチャー, 統合インターフェース)
NeoBundle 'Shougo/unite.vim', {'depends' : 'Shougo/vimproc'}

" vimfiler.vim (ファイラー)
NeoBundleLazy 'Shougo/vimfiler', {
\ 'depends' : ['Shougo/unite.vim', 'Shougo/vimproc'],
\ 'autoload' : {
\      'commands' : [
\        'VimFiler','VimFilerTab', 'VimFilerExplorer', 'Edit', 'Read', 'Write', 'Source'
\      ],
\      'mappings' : ['<Plug>(vimfiler_switch)'],
\      'explorer' : 1,
\    },
\ }

" vimshell.vim (シェル)
NeoBundleLazy 'Shougo/vimshell.vim', {
\ 'depends' : ['Shougo/unite.vim', 'Shougo/vimproc'],
\ 'autoload' : {
\      'commands' : [
\        'VimShell','VimShellExecute', 'VimShellInterractive', 'VimShellTermianl', 
\        'VimShellPop', 'VimShellTab', 'VimShellCreate'
\      ],
\      'mappings' : ['<Plug>(vimshell_switch)'],
\    },
\ }

NeoBundle 'supermomonga/vimshell-pure.vim', {'depends' : 'Shougo/vimshell.vim'}

" vimshell-ssh.vim (シェル)
NeoBundle 'ujihisa/vimshell-ssh', {
\    'depends' : ['Shougo/vimshell', 'Shougo/unite.vim', 'Shougo/neossh.vim', 'Shougo/vimproc'],
\    'autoload' : {
\      'filetypes' : ['vimshell', 'vimfiler'],
\    }
\ }

NeoBundle 'Shougo/neomru.vim', {'depends' : 'Shougo/unite.vim'}

" unite-outline (Unite:アウトラインソース)
NeoBundleLazy 'Shougo/unite-outline', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {'unite_sources' : 'outline'}
\ }

" unite-locate ()
NeoBundleLazy 'ujihisa/unite-locate', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {'unite_sources' : 'locate'}
\ }

" unite-spotlight
NeoBundleLazy 'choplin/unite-spotlight', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {'unite_sources' : 'spotlight'}
\ }

" unite-help (Unite:ヘルプソース)
NeoBundleLazy 'tsukkee/unite-help', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {'unite_sources' : 'help'}
\ }

" unite-tag (Unite:ctagソース)
NeoBundleLazy 'tsukkee/unite-tag', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {'unite_sources' : 'tag'}
\ }

" json filetype
NeoBundle 'elzr/vim-json', {'autoload': {'filetypes': 'json'}}

" json 整形
NeoBundle '5t111111/neat-json.vim', {'autoload': {'filetypes': 'json'}}


" tagsファイル生成
NeoBundle 'szw/vim-tags'
"NeoBundle 'xolox/vim-misc'
"NeoBundle 'xolox/vim-easytags'

" 非同期taskmanager
NeoBundle 'tpope/vim-dispatch'

" ctrlp
NeoBundle "kien/ctrlp.vim"

" unite-ssh (Unite:sshソース)
NeoBundleLazy 'Shougo/neossh.vim', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {
\      'filetypes' : ['vimshell', 'vimfiler'],
\    }
\ }

" unite-sudo (Unite:sudoソース)
NeoBundle 'Shougo/unite-sudo', {'depends' : 'Shougo/unite.vim'}

" Unite todo source
NeoBundle 'kannokanno/unite-todo', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {'unite_sources' : 'todo'}
\ }

" Unite color scheme source
NeoBundle 'ujihisa/unite-colorscheme', {
\    'depends' : 'Shougo/unite.vim',
\    'autoload' : {'unite_sources' : 'colorscheme'}
\ }

" unite-vcs (Unite:git,svnをUniteで利用。)
NeoBundle 'hrsh7th/vim-versions', {'depends' : 'Shougo/unite.vim'}

" unite-variable 追加
NeoBundle 'thinca/vim-editvar'

" benchvimrc-vim (vimrcのベンチマーク)
NeoBundle 'mattn/benchvimrc-vim', {
\    'depends' : 'Shougo/unite.vim'
\ }

" ref.vim (リファレンス参照)
NeoBundle 'thinca/vim-ref'

" quickfix replace
"NeoBundle 'thinca/vim-qfreplace'

" quickrun.vim (格ファイルタイプをvim内で実行)
NeoBundle 'thinca/vim-quickrun'

" open-browser.vim (ブラウザを開く)
NeoBundle 'tyru/open-browser.vim'

" webapi.vim (各種web apiをvimから利用)
NeoBundle 'mattn/webapi-vim'

" surround.vim (テキストオブジェクトを使いやすく)
NeoBundle 'tpope/vim-surround'

" 直感的に選択テキストを移動
NeoBundle 't9md/vim-textmanip'

" 直感的にテキスト置換"
NeoBundle 'osyo-manga/vim-over'

" smartword (全角文字の単語認識)
NeoBundle 'kana/vim-smartword'

" font size変更
NeoBundle 'thinca/vim-fontzoom'

" vim-quickhl (選択箇所の複数ハイライト)
NeoBundle 't9md/vim-quickhl'

" scrooloose/syntastic.vim (各種ファイルタイプのシンタックスエラーの検出・表示)
NeoBundle 'scrooloose/syntastic'

" Tagbar (ctagを見やすく表示) javascriptで利用時にnodeがhung
NeoBundle 'majutsushi/tagbar'
NeoBundle 'vim-scripts/tagbar-phpctags'

" Source explorer
"NeoBundle 'wesleyche/SrcExpl'

" vcscommand.vim (svnの利用)
NeoBundle 'harleypig/vcscommand.vim'

" vim-fugitive (git コマンド利用)
NeoBundle 'tpope/vim-fugitive'

" git log view (tig相当 fugitive依存) 
NeoBundle 'gregsexton/gitv'

" vcsのステータス表示
NeoBundle 'mhinz/vim-signify'

" vimplenote.vim (simplenoteの利用)
NeoBundle 'mattn/vimplenote-vim'

" emmet (zencodingの利用)
NeoBundle 'mattn/emmet-vim/'

" dir単位のdiff
NeoBundle 'vim-scripts/DirDiff.vim'

" laravle blade
NeoBundle 'xsbeats/vim-blade'

" handlebars tamplete
NeoBundle 'nono/vim-handlebars'

" html5.vim (html5シンタックス)
NeoBundleLazy 'othree/html5.vim'

" commentaly
NeoBundle 'tpope/vim-commentary'

" lepture/vim-css css3シンタックス
NeoBundleLazy 'hail2u/vim-css3-syntax', {'autoload': {'filetypes': ['html', 'css']}}

NeoBundleLazy 'cakebaker/scss-syntax.vim', {'autoload': {'filetypes': ['scss', 'sass']}}

" php.vim のfork版 (php syntax, 補完)
NeoBundleLazy 'StanAngeloff/php.vim', {'autoload': {'filetypes': 'php'}}
NeoBundleLazy 'arnaud-lb/vim-php-namespace', {'autoload': {'filetypes': 'php'}}
NeoBundleLazy 'shawncplus/phpcomplete.vim', {'autoload': {'filetypes': 'php'}}

" java complete
NeoBundleLazy 'artur-shaik/vim-javacomplete2'

" php-doc.vim のfork版
NeoBundleLazy 'drwX/php-doc.vim', {'autoload': {'filetypes': 'php'}}
NeoBundleLazy 'tobyS/pdv', {'autoload': {'filetypes': 'php'}}
NeoBundleLazy 'vim-php/vim-php-refactoring', {'autoload': {'filetypes': 'php'}}
NeoBundleLazy 'stephpy/vim-php-cs-fixer', {'autoload': {'filetypes': 'php'}}
"NeoBundleLazy 'karakaram/vim-quickrun-phpunit', {'autoload': {''filetypes': 'php'}}

" vim-ruby (ruby syntax, 補完)
NeoBundleLazy 'vim-ruby/vim-ruby', {'autoload': {'filetypes': 'ruby'}}

" rsense
"NeoBundleLazy 'taichouchou2/vim-rsense', {'autoload': {'filetypes': 'ruby'}}
NeoBundleLazy 'supermomonga/neocomplete-rsense.vim', {'autoload': {'filetypes': 'ruby'}}

" rails.vim (railsのシンタックス、MVCの移動、railsコマンドの利用)
NeoBundleLazy 'tpope/vim-rails', {'autoload': {'filetypes': 'ruby'}}

" ruby の do に対する end を補完
NeoBundleLazy 'tpope/vim-endwise', {'autoload': {'filetypes': 'ruby'}}


" ruby で def end などのマッチングを行う
NeoBundleLazy 'vim-scripts/ruby-matchit', {'autoload': {'filetypes': 'ruby'}}

" javascript syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload': {'filetypes': 'javascript'}}

" javascript libs syntax
"NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {'autoload': {'filetypes': 'javascript'}}

" javascript indent
"NeoBundleLazy 'vim-scripts/JavaScript-Indent', {'autoload': {'filetypes': 'javascript'}}
 
" node.js
NeoBundleLazy 'moll/vim-node', {'autoload': {'filetypes': 'javascript'}}

" jsdoc
NeoBundleLazy 'heavenshell/vim-jsdoc', {'autoload': {'filetypes': 'javascript'}}

" coffeescript syntax
NeoBundleLazy 'kchmck/vim-coffee-script', {'autoload': {'filetypes': 'coffeescript'}}

" less syntax
NeoBundleLazy 'less.vim', {'autoload': {'filetypes': 'less'}}

" handlebars and mustache
NeoBundle 'mustache/vim-mustache-handlebars'

" actionscript
NeoBundleLazy 'endel/actionscript.vim', {'autoload': {'filetypes': 'actionscript'}}

"as3 omni comp
NeoBundleLazy 'yuratomo/flex-api-complete', {'autoload': {'filetypes': ['actionscript', 'mxml']}}

" sql
NeoBundleLazy 'vim-scripts/SQLComplete.vim', {'autoload': {'filetypes': ['sql', 'mysql']}}

" jsx (react)
NeoBundle 'mxw/vim-jsx'

" omni complete for js
NeoBundle 'marijnh/tern_for_vim', {
\ 'build': {'others': 'npm install'},
\}

" AutoClose.vim
"NeoBundle 'vim-scripts/AutoClose'
NeoBundle "kana/vim-smartinput"
NeoBundle "cohama/vim-smartinput-endwise"

" 一括置換
"NeoBundle 'thinca/vim-qfreplace'

" 軽量のpowerline系プラグイン
NeoBundle 'bling/vim-airline'

" vim easymotion 特定位置へのショートカットジャンプ
"NeoBundle 'Lokaltog/vim-easymotion'

" コンテキストによってファイルタイプを検出
NeoBundle "Shougo/context_filetype.vim"

" コンテキストによってfiletypeを自動で変更 
NeoBundle "osyo-manga/vim-precious"

" minimap
NeoBundle 'severin-lemaignan/vim-minimap'

" color table
NeoBundle 'guns/xterm-color-table.vim'

" enable gvim colorsheme for cli
"NeoBundle 'vim-scripts/CSApprox'

" color scheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'chriskempson/vim-tomorrow-theme'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'jdonaldson/vaxe'
NeoBundle 'cocopon/iceberg.vim'
"NeoBundle 'daylerees/colour-schemes', { 'rtp': 'vim/' }

" base16 color
NeoBundle 'chriskempson/base16-vim'

" the Silver Searcher (ag)
NeoBundle 'rking/ag.vim'

" markdown syntax
"NeoBundle 'tpope/vim-markdown'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'shime/vim-livedown', {'autoload': {'filetypes': 'markdown'}}

" tmux の vim で pbcopy/pbpaste
NeoBundle 'kana/vim-fakeclip'

" vimscript 向け console
NeoBundle 'rbtnn/vimconsole.vim'

" インデント見やすく
NeoBundle 'Yggdroot/indentLine'

" Rich UI for Vim
"NeoBundle 'rbtnn/rabbit-ui.vim'

" csv
"NeoBundle 'chrisbra/csv.vim'

" editorconfig
NeoBundle 'editorconfig/editorconfig-vim'

" align
NeoBundle 'junegunn/vim-easy-align'

" tabular
NeoBundle 'godlygeek/tabular'

NeoBundleCheck

call neobundle#end()

" ファイルタイプ:インデント プラグインをON
filetype plugin indent on

syntax enable


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
".vimrc設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" leader key
let mapleader=','

" .swap ファイルの出力先
set directory=~/tmp/vim
set undodir=~/tmp/vim/undo

"検索パターンにおいて大文字と小文字を区別しない。
set noignorecase

"検索パターンが大文字を含んでいたらオプション 'ignorecase'を上書きする。
set nosmartcase

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

"検索がファイル末尾まで進んだら、ファイル先頭から再び検索する。
"(有効:wrapscan/無効:nowrapscan)
set wrapscan

"オンのとき、コマンドライン補完が拡張モードで行われる。
set wildmenu

"閉じ括弧が入力されたとき、対応する開き括弧にわずかの間ジャンプルする。
set showmatch

"毎行の前に行番号を表示する。
set number

"カーソルが何行目の何列目に置かれているかを表示する。
set ruler

"最下ウィンドウにいつステータス行が表示されるかを設定する。
"    0:全く表示しない
"    1:ウィンドウの数が2以上の時のみ表示
"    2:常に表示
set laststatus=2

"コマンド(の一部)を画面の最下行に表示する。
set showcmd

"ファイルを上書きする前にバックアップを作る。
"書き込みが成功してバックアップはそのまま取っておく。
"(有効:backup/無効:nobackup)
set nobackup

"ファイルの上書きの前にバックアップを作る。
"オプション'backup'がオンでない限り、バックアップは上書きに成功した後削除される。
"(有効:writebackup/無効nowritebackup)
set writebackup

"ステータスバーに文字コードと改行コード表示
" airline で 代用
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P

"文字コードの自動認識
"適当な文字コード判別
set termencoding=utf-8
set encoding=utf-8
" MacVimの場合 gauche_guess により、自動的に文字コードの判別を行うので不要
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

" タブ 空白表示
set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

"UTF-8の□や○でカーソル位置がずれないようにする
if exists("&ambiwidth")
  set ambiwidth=double
endif

" UTF-8-MACの濁点、半濁点を含む文字を強調して表示する
highlight Opaques term=underline ctermbg=DarkGreen guibg=DarkGreen
match Opaques /\(\%u3099\|%u309a\)/

"改行コードの自動認識
set fileformats=unix,dos,mac

" 折りたたみ(フォールド設定)
set foldmethod=syntax
set foldlevel=100
set nofoldenable

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

" grepは外部コマンドを使用する
set grepprg=internal

" ウィンドウを分割で開く際に、右側に表示する。
set splitright

" タグファイルの場所
set tags=tags
set tags+=*.tags

" コマンドラインの高さ
set cmdheight=1

" クリップボード
set clipboard+=unnamed
set clipboard+=autoselect

" マウス
set mouse=a

" インサート時のbackspace
set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" コマンド補完
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" コマンド補完を強化
set wildmenu

" リスト表示、最長マッチ
"set wildmode=longest,list,full
set wildmode=longest,full

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Omni補完関連
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 補完に辞書ファイル追加
"set complete =.,b,w,u,k,i,t
" 補完表示設定
set completeopt=menu,preview,menuone
"set completeopt=menu,menuone

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ファイル・タイプ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown
"autocmd BufNewFile,BufRead *.mkd set filetype=ghmarkdown
"autocmd BufNewFile,BufRead *.md set filetype=ghmarkdown
"autocmd BufNewFile,BufRead *.md.txt set filetype=ghmarkdown
autocmd BufNewFile,BufRead *.mkd set filetype=markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd BufNewFile,BufRead *.md.txt set filetype=markdown

autocmd BufNewFile,BufRead *.vue set filetype=html

" html.erb
autocmd BufNewFile,BufRead *.html.erb set filetype=eruby.html

" thor
autocmd BufNewFile,BufRead *.thor set filetype=ruby

" actionscript 
autocmd BufNewFile,BufRead *.as set filetype=actionscript 

" flex mxml
autocmd BufNewFile,BufRead *.mxml set filetype=mxml

" less
autocmd BufNewFile,BufRead *.less set filetype=less

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 相対行切り替え(<Space>n)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 703
  nnoremap  <silent> <Space>n :<C-u>ToggleNumber<CR>
  vnoremap  <silent> <Space>n :<C-u>ToggleNumber<CR> gv
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &number
      set relativenumber
      set cursorline
    else
      set norelativenumber
      set nocursorline
      set number
    endif
  endfunction
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索内容をハイライト
set hlsearch

" 検索ハイライトを解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ビジュアルモード範囲内検索
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 範囲内検索をデフォルトに
vnoremap / <ESC>/\%V
vnoremap ? <ESC>?\%V

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorsheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 行ハイライト
"set cursorline
set nocursorline

" 列ハイライト
set nocursorcolumn

if !has('gui_running')
  set background=dark
  "set t_Co=256
  let base16colorspace=256
  "let g:solarized_termcolors = 256
endif
"let g:hybrid_use_Xresources = 1
"let g:hybrid_use_iTerm_colors = 1
"let g:solarized_contrast = 'high'
"colorscheme solarized
"colorscheme hybrid
colorscheme my-hybrid
"colorscheme iceberg
"colorscheme base16-ocean
"colorscheme my-base16-ocean


"syntax sync minlines=256
"set synmaxcol=200

"set ttyfast " u got a fast terminal
"set ttyscroll=3
"set lazyredraw " to avoid scrolling problems

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" emmet-vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:user_emmet_leader_key = '<c-e>'

"ファイルタイプ
"let g:user_emmet_settings = {
"\  'lang' : 'ja',
"\  'html' : {
"\    'filters' : 'html',
"\    'indentation' : '    ',
"\  },
"\  'php' : {
"\    'extends' : 'html',
"\    'filters' : 'html,c',
"\  },
"\  'css' : {
"\    'filters' : 'fc',
"\  },
"\  'eruby' : {
"\    'extends' : 'html',
"\  },
"\}



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
let g:unite_source_rec_async_command='pt --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""'
let g:unite_converter_file_directory_width = 100

call unite#custom#source('file_rec,file_rec/async',
    \ 'max_candidates', 0)


"現在開いているファイルのディレクトリ下のファイル一覧
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :UniteWithBufferDir file<CR>
nnoremap <silent> [unite]ff :Unite file_rec/async -start-insert<CR>
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

" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'

" Like Textmate icons.
"let g:vimfiler_tree_leaf_icon = ' '
"let g:vimfiler_tree_opened_icon = '▾'
"let g:vimfiler_tree_closed_icon = '▸'
"let g:vimfiler_file_icon = '-'
"let g:vimfiler_marked_file_icon = '*'

" filename column min size
let g:vimfiler_min_filename_width = 30

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

nnoremap <F2> :MyVimFilerExp<Cr>
nnoremap <D-1> :MyVimFilerExp<Cr>

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
" dirdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git,.DS_Store"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:EasyMotion_leader_key="'"
"let g:EasyMotion_mapping_j = '<C-j>'
"let g:EasyMotion_mapping_k = '<C-k>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" powerline fonts
"   : version control
"   : LN (line) symbol
"   : Rightwards black arrwhead
"   : Rightwardsarrwhead
"   : iLeftwards black arrwhead
"   : Leftwardsarrwhead

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

let g:airline_powerline_fonts = 1
if has('gui_running')
  let g:airline#extensions#tabline#enabled = 0
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = '⭠'
  let g:airline_symbols.readonly = '⭤'
  let g:airline_symbols.linenr = '⭡'
else
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
endif

"" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"let g:airline_theme='base16'
"let g:airline_theme='hybrid'
"let g:airline_theme='tomorrow'
let g:airline_theme='bubblegum'
"let g:airline_theme='wombat'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1

" Use smartcase.
let g:neocomplete#enable_smart_case = 1

" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#enable_auto_select = 0

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
\ 'default' : '',
\ 'vimshell' : $HOME.'/.vimshell_hist',
\ 'scheme' : $HOME.'/.gosh_completions'
\ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.java = '\h\w*\|\h\w*\.\w*'

" Enabe force omni completion
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
let g:neocomplete#force_omni_input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'

" set java autocomplete
autocmd FileType java set omnifunc=javacomplete#Complete

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neosnippet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets,~/.vim/snippets'

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
let g:context_filetype#filetypes = {
\ 'html': [
\   {
\    'start':
\     '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)>',
\    'end': '</script>', 'filetype': 'javascript',
\   },
\   {
\    'start':
\     '<script>',
\    'end': '</script>', 'filetype': 'javascript',
\   },
\   {
\    'start': '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)>',
\    'end': '</style>', 'filetype': 'css',
\   },
\   {
\    'start': '<style>',
\    'end': '</style>', 'filetype': 'css',
\   },
\   {
\    'start': '<?php\?',
\    'end': '?>', 'filetype': 'php',
\   }
\ ],
\ 'vue': [
\   {
\    'start': '<script\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
\    'end': '</script>', 'filetype': '\1',
\   },
\   {
\    'start': '<script>',
\    'end': '</script>', 'filetype': 'javascript',
\   },
\   {
\    'start': '<style\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
\    'end': '</style>', 'filetype': '\1',
\   },
\   {
\    'start': '<style>',
\    'end': '</style>', 'filetype': 'css',
\   },
\   {
\    'start': '<template\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
\    'end': '</template>', 'filetype': '\1',
\   },
\   {
\    'start': '<template>',
\    'end': '</template>', 'filetype': 'html',
\   },
\ ],
\}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tern for vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let tern#is_show_argument_hints_enabled = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" load project local vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Load settings for each location.
" http://vim-users.jp/2009/12/hack112/
augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
  autocmd BufReadPre .vimprojects set ft=vim
augroup END
function! s:vimrc_local(loc)
  let files = findfile('.vimprojects', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" editorconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_verbose = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-textmanip 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"xmap <Space>d <Plug>(textmanip-duplicate-down)
"nmap <Space>d <Plug>(textmanip-duplicate-down)
"xmap <Space>D <Plug>(textmanip-duplicate-up)
"nmap <Space>D <Plug>(textmanip-duplicate-up)
"
"xmap <C-j> <Plug>(textmanip-move-down)
"xmap <C-k> <Plug>(textmanip-move-up)
"xmap <C-h> <Plug>(textmanip-move-left)
"xmap <C-l> <Plug>(textmanip-move-right)
"
"" toggle insert/replace with <F10>
"nmap <F10> <Plug>(textmanip-toggle-mode)
"xmap <F10> <Plug>(textmanip-toggle-mode)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSV Edit
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"function! s:edit_csv(path)
"  call writefile(map(rabbit_ui#gridview(map(readfile(expand(a:path)),'split(v:val,',',1)')), 'join(v:val, ',')'), expand(a:path))
"endfunction
"
"command! -nargs=1 EditCSV  :call <sid>edit_csv(<q-args>

