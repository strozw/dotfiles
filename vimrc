""""""""""""""""""""""""""""""""
" Init
""""""""""""""""""""""""""""""""

if !has('nvim')
  unlet! skip_defaults_vim
  source $VIMRUNTIME/defaults.vim
end

scriptencoding utf-8
set encoding=utf-8

if has('python3')
  silent! python3 1
endif

if &compatible
  set nocompatible
endif


""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" basic
Plug 'vim-jp/vimdoc-ja'
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'qpkorr/vim-bufkill'
Plug 'junegunn/goyo.vim'

" font
Plug 'ryanoasis/vim-devicons'

" navigator
Plug 'tpope/vim-unimpaired'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" window resizer
Plug 'simeji/winresizer'

" neovim api polyfill
if !has('nvim')
  Plug 'roxma/nvim-yarp', { 'do': 'pip3 install --user pynvim' }
  Plug 'roxma/vim-hug-neovim-rpc'
end

" color
Plug 'cocopon/iceberg.vim'
Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
Plug 'nathanaelkane/vim-indent-guides'

" linter
Plug 'w0rp/ale'

" status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'vim-scripts/git-commit'
Plug 'gregsexton/gitv'
Plug 'cohama/agit.vim'
Plug 'gregsexton/gitv'
Plug 'sjl/gundo.vim'

" filer
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
"Plug 'Shougo/deol.nvim'
Plug 'Shougo/defx.nvim'
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

Plug 'szw/vim-tags'

" lsp
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-snippets', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-emmet', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-solargraph', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-sources', {'do': 'yarn install --frozen-lockfile'}

" lsp structure
Plug 'liuchengxu/vista.vim'

" file replace
Plug 'dyng/ctrlsf.vim'

" text operator
" Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'Raimondi/delimitMate'

" file types
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'plasticboy/vim-markdown'
Plug 'pangloss/vim-javascript'
Plug 'cespare/vim-toml'

" for js
Plug 'maxmellon/vim-jsx-pretty', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/yajs.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

" for ts
Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }

" for js, ts
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript', 'javascript.jsx', 'typescript'] }

" for ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv', { 'for': ['ruby'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby'] }
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }
"Plug 'vim-utils/vim-ruby-fold', { 'for': ['ruby'] }

" .local.vimrc 
Plug 'thinca/vim-localrc'

call plug#end()

""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""

set tabstop=2
set shiftwidth=2
set expandtab

" help言語の設定
set helplang=ja,en

" スペルチェック
set spell
set spelllang+=cjk

" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd

" undo
set undodir=~/tmp/vim/undo
set undofile

" truecolor support
set termguicolors

" ファイルエンコーディング検出設定
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,sjis

" クリップボード
set clipboard+=unnamed

" 折り返しインデント
set breakindent

" grep
let &grepprg="grep -rnIH --exclude=.git --exclude-dir=.hg --exclude-dir=.svn --exclude=tags"

if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" 行番号表示
set number


" vsplit 時に右側に表示
set splitright

" hit-enter回数を減らすのが目的
set cmdheight=2

" gvimではない？ (== 端末)
if !has('gui_running')
  " True Color対応端末？
  if $COLORTERM == "truecolor"
    set termguicolors
  endif
endif

" Windowsのエディタの人達に嫌われない設定
set nofixendofline
" ○, △, □等の文字幅をASCII文字の倍にする
"set ambiwidth=double
" swapファイルはローカル作成がトラブル少なめ
set directory-=.
" 日本語の途中でも折り返す
set formatoptions+=mM
" カーソルが括弧上にあっても括弧ペアをハイライトさせない
"let loaded_matchparen = 1

"grep setting
let &grepprg="grep -rnIH --exclude=.git --exclude-dir=.hg --exclude-dir=.svn --exclude=tags"

" mosue 有効化
set mouse=a

if !has('nvim')
  " terminal エミュレーターでドラッグを有効にする
  set ttymouse=xterm2
end

" 描画最適化 ?
"set synmaxcol=200
"set lazyredraw
"set ttyfast
"set re=1

" マウスの中央ボタンクリックによるクリップボードペースト動作を抑制する
noremap <MiddleMouse> <Nop>
noremap! <MiddleMouse> <Nop>
noremap <2-MiddleMouse> <Nop>
noremap! <2-MiddleMouse> <Nop>
noremap <3-MiddleMouse> <Nop>
noremap! <3-MiddleMouse> <Nop>
noremap <4-MiddleMouse> <Nop>
noremap! <4-MiddleMouse> <Nop>

" ファイルエンコーディング検出設定
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,sjis

" クリップボード
set clipboard+=unnamed

" 折り返しインデント
set breakindent

""""""""""""""""""""""""""""""""
" Cursor
""""""""""""""""""""""""""""""""

" CursorShape settings
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set hlsearch


""""""""""""""""""""""""""""""""
" Color
""""""""""""""""""""""""""""""""
set background=dark
"colorscheme onedark
colorscheme iceberg
let g:onedark_terminal_italics = 1

""""""""""""""""""""""""""""""""
" for filetype
""""""""""""""""""""""""""""""""
augroup matchit
  au!
  au FileType ruby let b:match_words = '\<\(module\|class\|def\|begin\|do\|if\|unless\|case\)\>:\<\(elsif\|when\|rescue\)\>:\<\(else\|ensure\)\>:\<end\>'
augroup END

au FileType ruby set foldmethod=manual

""""""""""""""""""""""""""""""""
" polyglot
""""""""""""""""""""""""""""""""
let g:polyglot_disabled = ['csv']

""""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""""
let g:airline_theme='iceberg'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#ale#enabled = 1


""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""

let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 1
let g:ale_sign_error = "\uf05e"
let g:ale_sign_warning = "\uf071"
let g:ale_sign_info = "\uf7fc"
"let g:ale_linters_ignore = {'typescript': ['eslint']}
let g:ale_linter_aliases = {
\ 'javascript.jsx': ['css', 'javascript.jsx'],
\ 'typescript': ['css', 'typescript']
\}

let g:ale_linters = {
\ 'javascript': ['eslint'],
\ 'javascript.jsx': ['stylelint', 'eslint'],
\ 'typescript': ['tsserver', 'typecheck', 'stylelint', 'tslint'],
\ 'ruby': ['rubocop'], 
\ 'css': ['stylelint'], 
\ 'scss': ['stylelint'], 
\ 'sass': ['stylelint'], 
\ 'nerdtree': ''
\}

let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'javascript.jsx': ['eslint'],
\ 'typescript': ['tslint'],
\ 'ruby': ['rubocop'],
\ 'css': ['stylelint'], 
\ 'scss': ['stylelint'], 
\ 'sass': ['stylelint'], 
\ 'go': ['gofmt', 'goimports']
\}

" disable ale
autocmd BufEnter *.min.* ALEDisable
autocmd BufEnter */node_modules/* ALEDisable
autocmd BufEnter */node_modules/* ALEDisable
autocmd BufEnter */node_modules/* ALEDisable
autocmd BufEnter */bundle/* ALEDisable
autocmd BufEnter */.composer/* ALEDisable


""""""""""""""""""""""""""""""""
" mapping
""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

" noh
noremap <ESC><ESC> :noh<CR>

" airline buffer
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
tmap <C-p> <Plug>AirlineSelectPrevTab
tmap <C-n> <Plug>AirlineSelectNextTab
nmap <space>1 <Plug>AirlineSelectTab1
nmap <space>2 <Plug>AirlineSelectTab2
nmap <space>3 <Plug>AirlineSelectTab3
nmap <space>4 <Plug>AirlineSelectTab4
nmap <space>5 <Plug>AirlineSelectTab5
nmap <space>6 <Plug>AirlineSelectTab6
nmap <space>7 <Plug>AirlineSelectTab7
nmap <space>8 <Plug>AirlineSelectTab8
nmap <space>9 <Plug>AirlineSelectTab9
nmap <space>q :BD<CR>
map <C-q> :BD<CR>

" fugitive 
nmap gs :Gstatus<CR>
nmap gc :Gcommit<CR>
nmap ga :Gw<CR>
nmap gb :Gblame<CR>

""""""""""""""""""""""""""""""""
" defx
"""""""""""""""""""""""""""""""
nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
autocmd FileType defx call s:defx_my_settings()
function! s:defx_my_settings() abort
  call defx#custom#column('icon', {
  \ 'directory_icon': '▸',
  \ 'opened_icon': '▾',
  \ 'root_icon': ' ',
  \ })

  " Define mappings
  nnoremap <silent><buffer><expr> <CR> defx#do_action('drop')
  nnoremap <silent><buffer><expr> c defx#do_action('copy')
  nnoremap <silent><buffer><expr> m defx#do_action('move')
  nnoremap <silent><buffer><expr> p defx#do_action('paste')
  nnoremap <silent><buffer><expr> l defx#do_action('open_tree')
  nnoremap <silent><buffer><expr> h defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> L defx#do_action('open')
  nnoremap <silent><buffer><expr> H defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> E defx#do_action('open', 'vsplit')
  nnoremap <silent><buffer><expr> P defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> o defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> N defx#do_action('new_file')
  nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> d defx#do_action('remove')
  nnoremap <silent><buffer><expr> r defx#do_action('rename')
  nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> x defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> . defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
  nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
  nnoremap <silent><buffer><expr> q defx#do_action('quit')
  nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> R defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
endfunction

" nnoremap <silent><F2> :Defx -split=vertical -winwidth=50 -direction=topleft -toggle -columns=git:mark:indent:filename:type<CR>
" nnoremap <Leader>sf :Defx -split=vertical -winwidth=50 -direction=topleft -columns=git:mark:indent:filename:type -search=`expand('%:p')`<CR>
nnoremap <silent><F2> :Defx -split=vertical -winwidth=50 -direction=topleft -toggle -columns=git:icons:mark:indent:filename:type<CR>
nnoremap <Leader>sf :Defx -split=vertical -winwidth=50 -direction=topleft -columns=git:icons:mark:indent:filename:type -search=`expand('%:p')`<CR>

"""""""""""""""""""""""""""""""""
" Denite
"""""""""""""""""""""""""""""""""
let s:denite_win_width_percent = 0.8
let s:denite_win_height_percent = 0.6

" Change denite default options
call denite#custom#option('default', {
    \ 'split': 'floating',
    \ 'winwidth': &columns * s:denite_win_width_percent,
    \ 'wincol': (&columns - (&columns * s:denite_win_width_percent)) / 2,
    \ 'winheight': &lines * s:denite_win_height_percent,
    \ 'winrow': (&lines - (&lines * s:denite_win_height_percent)) / 2,
    \ })

"""""""""""""""""""""""""""""""""
" Fzf
"""""""""""""""""""""""""""""""""
"nnoremap <silent><C-p> :Files<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>f :GFiles<CR>
nnoremap <silent><C-;> :Buffers<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
"nnoremap <Leader>t :Tags<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>gl :BCommits<CR>
nnoremap <Leader>gla :Commits<CR>

nnoremap <Leader>ad :ALEDetail<CR>
nnoremap <Leader>af :ALEFix<CR>

" <C-,>でタグ検索
nnoremap <silent><C-g> :call fzf#vim#ag(expand('<cword>'))<CR>
" fzfからファイルにジャンプできるようにする
let g:fzf_buffers_jump = 1

vmap <Leader>y "+y

nnoremap <silent><F9> :TagbarToggle<CR>
"autocmd FileType ruy,javascript,javascript.jsx nested :TagbarOpen



" fzf for qf
" @ref https://github.com/natebosch/dotfiles/commit/4eb2f5eb12e8b71221959d57edbc8ca9834f8e61

command! QuickFix call <SID>QuickFix()
command! LocationList call <SID>LocationList()

function! s:QuickFix() abort
  call s:FuzzyPick(getqflist(), 'cc')
endfunction

function! s:LocationList() abort
  call s:FuzzyPick(getloclist(0), 'll')
endfunction

function! s:FuzzyPick(items, jump) abort
  let items = map(a:items, {idx, item ->
      \ string(idx).' '.bufname(item.bufnr).' '.item.text})
  call fzf#run({'source': items, 'sink': function('<SID>Pick', [a:jump]),
      \'options': '--with-nth 2.. --reverse', 'down': '40%'})
endfunction

function! s:Pick(jump, item) abort
  let idx = split(a:item, ' ')[0]
  execute a:jump idx + 1
endfunction

nnoremap <leader>lq :QuickFix<cr>
nnoremap <leader>ll :LocationList<cr>


"""""""""""""""""""""""""""""""""
" gundo
"""""""""""""""""""""""""""""""""

let g:gundo_prefer_python3 = 1


""""""""""""""""""""""""""""""""
" for markdown
""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:indent_guides_start_level = 1
autocmd Filetype json setl conceallevel=0
autocmd Filetype markdown setl conceallevel=0

""""""""""""""""""""""""""""""""
" signify
""""""""""""""""""""""""""""""""
"let g:signify_sign_add               = "\uf457"
"let g:signify_sign_delete            = "\ufc2e"
"let g:signify_sign_delete_first_line = "\uf151"
"let g:signify_sign_change            = "\uf457"
"let g:signify_sign_changedelete      = g:signify_sign_change
let g:signify_realtime = 1
let g:signify_sign_show_text = 1


""""""""""""""""""""""""""""""""
" coc
""""""""""""""""""""""""""""""""

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <silent>cr <Plug>(coc-rename)

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <silent>ca  <Plug>(coc-codeaction-selected)
nmap <silent>ca  <Plug>(coc-codeaction-selected)

" Remap for format selected region
xmap <silent>cf  <Plug>(coc-format-selected)
nmap <silent>cf  <Plug>(coc-format-selected)

" Remap for do codeAction of current line
nmap <leader>ca  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cqf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>ca  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>cj  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>ck  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>
nnoremap <silent> <space>cf  :<C-u>CocFix<CR>
nnoremap <C-.> :<C-u>CocFix<CR>
inoremap <C-.> <Esc>:CocFix<CR>

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)

vmap <C-j> <Plug>(coc-snippets-select)

let g:coc_snippet_next = '<c-j>'

let g:coc_snippet_prev = '<c-k>'

imap <C-j> <Plug>(coc-snippets-expand-jump)

""""""""""""""""""""""""""""""""
" Vista
""""""""""""""""""""""""""""""""
nnoremap <silent><F8> :Vista!!<CR>
nnoremap <Leader>vv :Vista!! finder<CR>
nnoremap <Leader>vcc :Vista!! coc<CR>
nnoremap <Leader>vcg :Vista!! ctags<CR>

""""""""""""""""""""""""""""""""
" project local vimrc
""""""""""""""""""""""""""""""""

augroup vimrc-local
  autocmd!
  autocmd BufNewFile,BufReadPost * call s:vimrc_local(expand('<afile>:p:h'))
augroup END

function! s:vimrc_local(loc)
  let files = findfile('.vimrc.local', escape(a:loc, ' ') . ';', -1)
  for i in reverse(filter(files, 'filereadable(v:val)'))
    source `=i`
  endfor
endfunction


nnoremap <leader>d :call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact --select-1 --exit-0 +i'})<CR>

""""""""""""""""""""""""""""""""
" vim-tags
""""""""""""""""""""""""""""""""
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_use_language_field = 1
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
let g:vim_tags_directories = [".git", ".hg", ".svn", ".bzr", "_darcs", "CVS"]
let g:vim_tags_main_file = 'tags'
let g:vim_tags_extension = '.tags'
let g:vim_tags_cache_dir = expand($HOME)


""""""""""""""""""""""""""""""""
" ctrlsf
""""""""""""""""""""""""""""""""
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

""""""""""""""""""""""""""""""""
" terminal
""""""""""""""""""""""""""""""""
"let g:terminal_color_0  = "#1b2b34" "black
"let g:terminal_color_1  = "#ed5f67" "red
"let g:terminal_color_2  = "#9ac895" "green
"let g:terminal_color_3  = "#fbc963" "yellow
"let g:terminal_color_4  = "#669acd" "blue
"let g:terminal_color_5  = "#c695c6" "magenta
"let g:terminal_color_6  = "#5fb4b4" "cyan
"let g:terminal_color_7  = "#c1c6cf" "white
"let g:terminal_color_8  = "#65737e" "bright black
"let g:terminal_color_9  = "#fa9257" "bright red
"let g:terminal_color_10 = "#343d46" "bright green
"let g:terminal_color_11 = "#4f5b66" "bright yellow
"let g:terminal_color_12 = "#a8aebb" "bright blue
"let g:terminal_color_13 = "#ced4df" "bright magenta
"let g:terminal_color_14 = "#ac7967" "bright cyan
"let g:terminal_color_15 = "#d9dfea" "bright white
"let g:terminal_color_background="#1b2b34" "background
"let g:terminal_color_foreground="#c1c6cf" "foreground

if has("nvim")
  au TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au FileType fzf tunmap <buffer> <Esc>
endif


""""""""""""""""""""""""""""""""
" indent
""""""""""""""""""""""""""""""""
let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

