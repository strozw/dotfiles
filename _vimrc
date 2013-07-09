""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vi との互換モードをOFF
set nocompatible

" ファイルタイプ:インデント プラグイン使用をOFF
filetype plugin indent off

" 自動カレントディレクトリ変更 OFF
let g:vimfiler_enable_auto_cd = 0

" Neobundle のパス設定
if has('vim_starting')
	if has("win32") || has("win64") || has("win32unix")
		" windows
		set runtimepath+=~/vimfiles/neobundle.vim/
		call neobundle#rc(expand('~/vimfiles/bundle/'))

		" プロキシ環境用の設定ファイルを読み込む（リポジトリでは管理しない）
		if filereadable($HOME . '/_vimrc.local')
		  source $HOME/_vimrc.local
		endif
	else
		" その他
		set runtimepath+=~/.vim/neobundle.vim/
		call neobundle#rc(expand('~/.vim/bundle/'))

		" プロキシ環境用の設定ファイルを読み込む（リポジトリでは管理しない）
		if filereadable($HOME . '/.vimrc.local')
		  source $HOME/.vimrc.local
		endif
	endif
endif

" vim powerline (ステータスラインを分かりやすくする)
if has('python')
  " pip install --user git+git://github.com/Lokaltog/powerline
  NeoBundle 'Lokaltog/powerline', { 'rtp' : '~/.vim/bundle/powerline/powerline/bindings/vim', 'build' : { 'mac' : 'python setup.py build install --user' } }
  "NeoBundle 'zhaocai/linepower.vim'
else
  NeoBundle 'Lokaltog/vim-powerline'
  NeoBundle 'osyo-manga/vim-powerline-unite-theme'
  let g:Powerline_stl_path_style = 'short'

  " PowerLineの再読み込み
  if exists('g:Powerline_loaded')
	  silent! call Pl#Load()
  endif
endif

" sudo.vim (root権限でファイルを編集するなど)
NeoBundle 'sudo.vim'

" neocomplcache.vim (キーワード補完)
NeoBundle 'Shougo/neocomplcache'

" neocomplcache snippet (スニペット補完)
NeoBundle 'Shougo/neosnippet', {'depends' : 'Shougo/neocomplcache'}

" unite.vim (ランチャー, 統合インターフェース)
NeoBundle 'Shougo/unite.vim', {'depends' : 'Shougo/vimproc'}

" vimfiler.vim (ファイラー)
NeoBundleLazy 'Shougo/vimfiler', {
\ 'depends' : ['Shougo/unite.vim', 'Shougo/vimproc'],
\ 'autoload' : {
\	  'commands' : [
\		'VimFiler','VimFilerTab', 'VimFilerExplorer', 'Edit', 'Read', 'Write', 'Source'
\	  ],
\	  'mappings' : ['<Plug>(vimfiler_switch)'],
\	  'explorer' : 1,
\	},
\ }

" vimshell.vim (シェル)
NeoBundleLazy 'Shougo/vimshell', {
\ 'depends' : ['Shougo/unite.vim', 'Shougo/vimproc'],
\ 'autoload' : {
\	  'commands' : [
\		'VimShell','VimShellExecute', 'VimShellInterractive', 'VimShellTermianl', 
\		'VimShellPop', 'VimShellTab', 'VimShellCreate'
\	  ],
\	  'mappings' : ['<Plug>(vimshell_switch)'],
\	},
\ }

" vimshell-ssh.vim (シェル)
NeoBundle 'vimshell-ssh', {
\	'depends' : ['Shougo/vimshell', 'Shougo/unite.vim', 'Shougo/unite-ssh', 'Shougo/vimproc'],
\	'autoload' : {
\	  'filetypes' : ['vimshell', 'vimfiler'],
\	}
\ }

" unite-outline (Unite:アウトラインソース)
NeoBundleLazy 'h1mesuke/unite-outline', {
\	'depends' : 'Shougo/unite.vim',
\	'autoload' : {'unite_sources' : 'outline'}
\ }

" unite-help (Unite:ヘルプソース)
NeoBundleLazy 'tsukkee/unite-help', {
\	'depends' : 'Shougo/unite.vim',
\	'autoload' : {'unite_sources' : 'help'}
\ }

" unite-tag (Unite:ctagソース)
NeoBundleLazy 'tsukkee/unite-tag', {
\	'depends' : 'Shougo/unite.vim',
\	'autoload' : {'unite_sources' : 'outline'}
\ }

" unite-ssh (Unite:sshソース)
NeoBundleLazy 'Shougo/unite-ssh', {
\	'depends' : 'Shougo/unite.vim',
\	'autoload' : {
\	  'filetypes' : ['vimshell', 'vimfiler'],
\	}
\ }

" unite-sudo (Unite:sudoソース)
NeoBundle 'Shougo/unite-sudo', {'depends' : 'Shougo/unite.vim'}

" Unite todo source
NeoBundle 'kannokanno/unite-todo', {
\	'depends' : 'Shougo/unite.vim',
\	'autoload' : {'unite_sources' : 'todo'}
\ }

" Unite font source
NeoBundleLazy 'ujihisa/unite-font', {
\	'depends' : 'Shougo/unite.vim',
\	'gui' : 1,
\	'autoload' : {'unite_sources' : 'font'}
\ }

" Unite color scheme source
NeoBundle 'ujihisa/unite-colorscheme', {
\	'depends' : 'Shougo/unite.vim',
\	'autoload' : {'unite_sources' : 'colorscheme'}
\ }

" unite-vcs (Unite:git,svnをUniteで利用。)
NeoBundle 'hrsh7th/vim-versions', {'depends' : 'Shougo/unite.vim'}

" benchvimrc-vim (vimrcのベンチマーク)
NeoBundle 'mattn/benchvimrc-vim'

" ref.vim (リファレンス参照)
NeoBundle 'thinca/vim-ref'

" quickrun.vim (格ファイルタイプをvim内で実行)
NeoBundle 'thinca/vim-quickrun'

" open-browser.vim (ブラウザを開く)
NeoBundle 'tyru/open-browser.vim'

" webapi.vim (各種web apiをvimから利用)
NeoBundle 'mattn/webapi-vim'

" surround.vim (テキストオブジェクトを使いやすく)
NeoBundle 'tpope/vim-surround'

" smartword (全角文字の単語認識)
NeoBundle 'kana/vim-smartword'


" font size変更
NeoBundle 'thinca/vim-fontzoom'

" vim-quickhl (選択箇所の複数ハイライト)
NeoBundle 't9md/vim-quickhl'

" scrooloose/syntastic.vim (各種ファイルタイプのシンタックスエラーの検出・表示)
NeoBundle 'scrooloose/syntastic'

" Tagbar (ctagを見やすく表示)
NeoBundle 'majutsushi/tagbar'

" Source explorer
NeoBundle 'wesleyche/SrcExpl'

" vcscommand.vim (svnの利用)
NeoBundle 'harleypig/vcscommand.vim'

" vim-fugitive (git コマンド利用)
"NeoBundle 'tpope/vim-fugitive'

" vimplenote.vim (simplenoteの利用)
NeoBundle 'mattn/vimplenote-vim'

" zencoding.vim (zencodingの利用)
NeoBundle 'mattn/zencoding-vim'

" dir単位のdiff
NeoBundle 'vim-scripts/DirDiff.vim'

" html5.vim (html5シンタックス)
NeoBundleLazy 'othree/html5.vim', {
\ 'autoload' : {
\	  'filetypes' : ['html', 'php'],
\	},
\ }

" lepture/vim-css css3シンタックス
NeoBundleLazy 'hail2u/vim-css3-syntax', {
\ 'autoload' : {
\	  'filetypes' : ['html', 'css'],
\	},
\ }

" cssのcoloをその色で表示
NeoBundleLazy 'vim-scripts/css_color.vim', {
\ 'autoload' : {
\	  'filetypes' : ['html', 'css'],
\	},
\ }

NeoBundleLazy 'cakebaker/scss-syntax.vim', {
\ 'autoload' : {
\	  'filetypes' : ['scss', 'sass'],
\	},
\ }

" php.vim のfork版 (php syntax, 補完)
NeoBundleLazy 'StanAngeloff/php.vim', {
\ 'autoload' : {
\	  'filetypes' : 'php',
\	},
\ }

" vim-ruby (ruby syntax, 補完)
NeoBundleLazy 'vim-ruby/vim-ruby', {
\ 'autoload' : {
\	  'filetypes' : 'ruby',
\	},
\ }

" rails.vim (railsのシンタックス、MVCの移動、railsコマンドの利用)
NeoBundleLazy 'tpope/vim-rails', {
\ 'autoload' : {
\	  'filetypes' : 'ruby',
\	},
\ }

" ruby の do に対する end を補完
NeoBundleLazy 'tpope/vim-endwise', {
\ 'autoload' : {
\	  'filetypes' : 'ruby',
\	},
\ }

" javascript syntax
NeoBundleLazy 'jelera/vim-javascript-syntax', {
\ 'autoload' : {
\	  'filetypes' : 'javascript',
\	}
\ }

" coffeescript syntax
NeoBundleLazy 'kchmck/vim-coffee-script', {
\ 'autoload' : {
\	  'filetypes' : 'coffeescript',
\	},
\ }

" less syntax
NeoBundleLazy 'less.vim', {
\ 'autoload' : {
\	  'filetypes' : ['less'],
\	},
\ }

" actionscript
NeoBundleLazy 'endel/actionscript.vim', {
\ 'autoload' : {
\	  'filetypes' : 'actionscript',
\	},
\ }

"as3 omni comp
NeoBundleLazy 'yuratomo/flex-api-complete', {
\ 'autoload' : {
\	  'filetypes' : ['actionscript', 'mxml'],
\	},
\ }

" mdbg, cdb, gdb, jdb, fdb debugger
NeoBundleLazy 'yuratomo/dbg.vim', {
\ 'autoload' : {
\	  'filetypes' : ['c', 'cpp', 'java', 'actionscript', 'mxml'],
\	},
\ }

"javacomplete
"NeoBundleLazy 'vim-scripts/javacomplete', {
"\ 'autoload' : {
"\	  'filetypes' : ['java'],
"\	},
"\ }
NeoBundle 'marijnh/tern_for_vim', {
\ 'build': {
\   'others': 'npm install'
\}}

" AutoClose.vim
"NeoBundle 'vim-scripts/AutoClose'

" minimap.vim
"NeoBundle 'koron/minimap-vim'

" 一括置換
"NeoBundle 'thinca/vim-qfreplace'

" color scheme
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'jdonaldson/vaxe'
NeoBundle 'pekepeke/titanium-vim'

" ファイルタイプ:インデント プラグインをON
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

"Insertモードで<tab>を挿入するとき、代わりに適切な数の空白を使う。
"(有効:expandtab/無効:noexpandtab)
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
" set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

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

" grepは外部コマンドを使用する
set grepprg=internal

" ウィンドウを分割で開く際に、右側に表示する。
set splitright

" タグファイルの場所
set tags=.tags

" コマンドラインの高さ
set cmdheight=1

" クリップボード
set clipboard=unnamed

" マウス
set mouse=a

"
" 補完に辞書ファイル追加
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set complete =.,b,w,u,k,i,t

"
" コマンド補完
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" コマンド補完を強化
"set wildmenu
" リスト表示、最長マッチ
"set wildmode=longest,list,full

"
" Omni補完関連
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 補完表示設定
set completeopt=menu,preview,menuone

"ポップアップメニューの色
highlight Pmenu ctermbg=lightcyan ctermfg=black
highlight PmenuSel ctermbg=blue ctermfg=black
highlight PmenuSbar ctermbg=darkgray
highlight PmenuThumb ctermbg=lightgray

"
" ファイル・タイプ別シンタックス
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" markdown 
au BufNewFile,BufRead *.mkd set filetype=markdown
au BufNewFile,BufRead *.md set filetype=markdown 

" html.erb
au BufNewFile,BufRead *.html.erb set filetype=eruby.html

" thor
autocmd BufNewFile,BufRead *.thor set filetype=ruby

" actionscript 
au BufNewFile,BufRead *.as set filetype=actionscript 

" flex mxml
au BufNewFile,BufRead *.mxml set filetype=mxml

" less
au BufNewFile,BufRead *.less set filetype=less

"
" 相対行切り替え(<Space>n)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 703
  nnoremap  <silent> <Space>n :<C-u>ToggleNumber<CR>
  vnoremap  <silent> <Space>n :<C-u>ToggleNumber<CR> gv
  command! -nargs=0 ToggleNumber call ToggleNumberOption()

  function! ToggleNumberOption()
    if &number
      set relativenumber
	  set cursorline
    else
	  set nocursorline
      set number
    endif
  endfunction
endif

"
" 検索設定
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索内容をハイライト
set hlsearch

" 検索ハイライトを解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"
" ビジュアルモード範囲内検索
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 範囲内検索をデフォルトに
vnoremap / <ESC>/\%V
vnoremap ? <ESC>?\%V

"
" vim colors solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set background=dark
"colorscheme solarized
let g:solarized_termcolors = 256
let g:solarized_contrast = 'high'
colorscheme hybrid


"
" omnifunct
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.mxml  setf xml

au BufNewFile,BufRead *.mxml  setl omnifunc=mxml#complete
"au BufNewFile,BufRead *.as    setl omnifunc=flexapi#complete
"
"au CompleteDone *.as          call flexapi#showRef()
"au BufNewFile,BufRead *.as    inoremap <expr> <c-down> flexapi#nextRef()
"au BufNewFile,BufRead *.as    inoremap <expr> <c-up>   flexapi#prevRef()
"
"if has("balloon_eval") && has("balloon_multiline") 
"  au BufNewFile,BufRead *.as  setl bexpr=flexapi#balloon()
"  au BufNewFile,BufRead *.as  setl ballooneval
"endif


"
" neocomplcache
" 参考：http://vim-users.jp/2010/10/hack177/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"AutoComplepop OFF
let g:acp_enableAtStartup = 0

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
\ 'default' : '',
\ }

" set tags option
let g:neocomplcache_member_prefix_patterns = {
\ 'php':'->\|::',
\ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
	let g:neocomplcache_keyword_patterns = {}
endif

" 英数字の単語の頭文字
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif

" 補完キー
"inoremap <expr><TAB>	pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><S-TAB>	pumvisible() ? "\<C-p>" : "\<S-TAB>"
"inoremap <expr><CR>		pumvisible() ? neocomplcache#close_popup() : "\<CR>"

" Snnipets
let g:neocomplcache_snippets_dir = $HOME . '/.vim/snippets'

" neoconplecache snippet keybindings
imap <C-k>	<Plug>(neocomplcache_snippets_expand)
smap <C-k>	<Plug>(neocomplcache_snippets_expand)

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"
" Zen-Cording.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:user_zen_leader_key = '<c-e>'

"ファイルタイプ
let g:user_zen_settings = {
\  'lang' : 'ja',
\  'html' : {
\    'filters' : 'html',
\    'indentation' : ' '
\  },
\  'php' : {
\    'extends' : 'html',
\    'filters' : 'html,c',
\  },
\  'css' : {
\    'filters' : 'fc',
\  },
\  'eruby' : {
\    'extends' : 'html',
\  },
\}

"
" unite.vim
" 参考：http://www.karakaram.com/vim/unite/
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

" unite grep
let g:unite_source_grep_default_opts = '-iHn --exclude=''.tags'' --exclude=''tags'' --exclude=''.svn'' --exclude=''.git'''

"現在開いているファイルのディレクトリ下のファイル一覧
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> [unite]ff :<C-u>Unite file_rec/async file/new<CR>
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
nnoremap <silent> [unite]g :<C-u>Unite grep -no-quit<CR>
" tag
nnoremap <silent> [unite]t :<C-u>Unite tag<CR>
" help
nnoremap <silent> [unite]h :<C-u>Unite help<CR>
" version/{type}/changeset
nnoremap <silent> [unite]vsc :<C-u>Unite versions/svn/changeset<CR>
nnoremap <silent> [unite]vgc :<C-u>Unite versions/git/changeset<CR>
" version/{type}/log
nnoremap <silent> [unite]vsl :<C-u>Unite versions/svn/log<CR>
nnoremap <silent> [unite]vgl :<C-u>Unite versions/git/log<CR>
" version/{type}/status
nnoremap <silent> [unite]vss :<C-u>Unite versions/svn/status<CR>
nnoremap <silent> [unite]vgs :<C-u>Unite versions/git/status<CR>

" 現在のプロジェクト内のファイルを一望する
" 参考 : http://d.hatena.ne.jp/h1mesuke/20110918/p1
nnoremap <silent> [unite]p :<C-u>call <SID>unite_project('-start-insert')<CR>
function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec:' . dir
endfunction

"uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	"ESCでuniteでを終了
	nmap <buffer> <ESC> <Plug>(unite_exit)
	"入力モードのきctrl+wでバックスラッシュも削除
	"imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
	"ctrl+jで縦に分割して開く
	"nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
	"ctrl+lで横横に分割して開く
	"nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
	"ctrl+oでその場所に開く
	nnoremap <silent> <buffer> <expr> <o> unite#do_action('open')
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')

	" my tabopen (Unite を終了しないtabopen)
	let my_tabopen = {
	\ 'is_quit' : 0,
	\ }
	function! my_tabopen.func(candidates)
	  call unite#take_action('tabopen', a:candidates)
	endfunction
	call unite#custom_action('*', 'tabopen', my_tabopen)
	unlet my_tabopen
endfunction

syntax enable

"
" Unite-line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-l> :<C-u>UniteWithCursorWord line<CR>

"
" Unite-tag
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" C-] にマッピング
autocmd BufEnter *
\	if empty(&buftype)
\|		nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately tag<CR>
\|	endif

"
" vimfiler.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Default File Explorer
let g:vimfiler_as_default_explorer = 1

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0

" Edit file by tabedit.
"let g:vimfiler_edit_action = 'tabopen'

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

" VimFiler をNERDTreeっぽく使う方法
" 参考: http://d.hatena.ne.jp/hrsh7th/20120229/1330525683
nnoremap <F2> :VimFilerExplorer -winwidth=50<Cr>
autocmd! FileType vimfiler call g:my_vimfiler_settings()
function! g:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
  nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
  nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
  nnoremap <buffer>E          :call vimfiler#mappings#do_action('my_tabopen')<Cr>
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

let my_action = { 'is_selectable' : 1 }                     
function! my_action.func(candidates)
  wincmd p
  exec 'tabedit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_tabopen', my_action)

"
"quickrun.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
	\ 'type': 'markdown/pandoc',
	\ 'outputter': 'browser',
	\ 'cmdopt': '-s'
	\ }
"let g:quickrun_config['actionscript']  = {
"	\ 'command' : 'mxmlc',
"	"\ 'exec' : ['%c %o %s:p > null'],
"	\ 'cmdopt' : '-static-link-runtime-shared-libraries',
"\ }
let g:quickrun_config['actionscript']  = {
	\ 'command': 'mxmlc',
	\ 'cmdopt': '-static-link-runtime-shared-libraries -debug=true',
	\ }

"
" vim-powerline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:Powerline_symbols = 'compatible'
let g:Powerline_symbols = 'fancy'

"
" syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_check_on_open=1
let g:syntastic_auto_jump=0

"
" TagBar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" タグバーの開閉を<F8>にマッピング
nmap <F8> :TagbarToggle<CR>

"
" quickhl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ハイライトトグル <Space>m にマッピング
nmap <Space>h <Plug>(quickhl-toggle)
xmap <Space>h <Plug>(quickhl-toggle)

" ハイライトリセット <Space> にマッピング
nmap <Space>H <Plug>(quickhl-reset)
xmap <Space>H <Plug>(quickhl-reset)
nmap <Space>j <Plug>(quickhl-match)


"
" ref.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ruby refe
let g:ref_refe_cmd = $HOME . "/References/ruby-refm/ruby-refm-1.9.3-dynamic-snapshot/refe-1_9_3"

"
" dirdiff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:DirDiffExcludes = "CVS,*.class,*.exe,.*.swp,.svn,.git,.DS_Store"


"
" SrcExpl.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" // The switch of the Source Explorer 
"nmap <F9> :SrcExplToggle<CR> 
"
"" // Set the height of Source Explorer window 
"let g:SrcExpl_winHeight = 8 
"
"" // Set 100 ms for refreshing the Source Explorer 
"let g:SrcExpl_refreshTime = 100 
"
"" // Set "Enter" key to jump into the exact definition context 
"" let g:SrcExpl_jumpKey = "<ENTER>" 
"
"" // Set "Space" key for back from the definition context 
"let g:SrcExpl_gobackKey = "<SPACE>" 
"
"" // In order to Avoid conflicts, the Source Explorer should know what plugins 
"" // are using buffers. And you need add their bufname into the list below 
"" // according to the command ":buffers!" 
"let g:SrcExpl_pluginList = [ 
"        \ "__Tag_List__", 
"        \ "_NERD_tree_", 
"        \ "Source_Explorer" 
"    \ ] 
"
"" // Enable/Disable the local definition searching, and note that this is not 
"" // guaranteed to work, the Source Explorer doesn't check the syntax for now. 
"" // It only searches for a match with the keyword according to command 'gd' 
"let g:SrcExpl_searchLocalDef = 1 
"
"" // Do not let the Source Explorer update the tags file when opening 
"let g:SrcExpl_isUpdateTags = 0 
"
"" // Use 'Exuberant Ctags' with '--sort=foldcase -R .' or '-L cscope.files' to 
"" //  create/update a tags file 
"let g:SrcExpl_updateTagsCmd = "ctags --sort=foldcase -R ." 
"
"" // Set "<F12>" key for updating the tags file artificially 
"let g:SrcExpl_updateTagsKey = "<F12>"
"

