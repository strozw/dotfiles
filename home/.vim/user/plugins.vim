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

"Plug 'mhinz/vim-startify'

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



