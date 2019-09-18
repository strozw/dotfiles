""""""""""""""""""""""""""""""""
" Init
"""""""""""""""""""""""""""""""""
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
" Plugins (by dein)
""""""""""""""""""""""""""""""""
"let s:dein_config_dir = $HOME . '/.vim'
"let s:dein_cache_dir = $HOME . '/.cache/dein'
"
"set runtimepath += $HOME . '/.ghq/github.com/Shougo/dein.vim'
"
"if dein#load_state(s:dein_cache_dir)
"  call dein#begin(s:dein_cache_dir)
"
"  call dein#load_toml(s:dein_config_dir . '/dein.toml', {'lazy': 0})
"  call dein#load_toml(s:dein_config_dir . '/dein_lazy.toml', {'lazy': 1})
"
"  call dein#end()
"  call dein#save_state()
"
"endif

""""""""""""""""""""""""""""""""
" Plugins (by dein)
""""""""""""""""""""""""""""""""
if  v:true
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
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'w0ng/vim-hybrid'
  Plug 'KeitaNakamura/neodark.vim'
  Plug 'cocopon/iceberg.vim'
  Plug 'gkeep/iceberg-dark'
  Plug 'joshdick/onedark.vim'
  Plug 'rakr/vim-one'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'luochen1990/rainbow'

  " linter
  "Plug 'w0rp/ale'

  " status line
  "Plug 'vim-airline/vim-airline'
  "Plug 'vim-airline/vim-airline-themes'
  Plug 'itchyny/lightline.vim'
  Plug 'hallzy/lightline-iceberg'
  Plug 'mengelbrecht/lightline-bufferline'

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
  Plug 'zackhsi/fzf-tags'
  "Plug 'Shougo/denite.nvim'
  "Plug 'Shougo/deol.nvim'
  Plug 'Shougo/defx.nvim'
  Plug 'kristijanhusak/defx-icons'
  Plug 'kristijanhusak/defx-git'

  Plug 'szw/vim-tags'

  " lsp
  Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}

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
  Plug 'plasticboy/vim-markdown'
  
  " for golang
  Plug 'fatih/vim-go'

  " for js
  "Plug 'othree/yajs.vim'
  Plug 'othree/es.next.syntax.vim', { 'for': ['javascript', 'javascript.jsx'] }

  " for ts
  "Plug 'HerringtonDarkholme/yats.vim'

  " for js, ts
  Plug 'jason0x43/vim-js-indent', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }
  Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'javascript.jsx', 'typescript', 'typescript.tsx'] }

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

  " http rest client
  Plug 'sharat87/roast.vim'

  call plug#end()
end

""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""

set tabstop=2
set shiftwidth=2
set expandtab
set smartindent
"set signcolumn=yes

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
" set ambiwidth=double
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
" set synmaxcol=320
" set lazyredraw
" set ttyfast
" set re=1

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
"colorscheme onehalfdark
"colorscheme hybrid
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
"let g:polyglot_disabled = ['csv', 'styled-components']
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
" coc
""""""""""""""""""""""""""""""""

let g:coc_status_error_sign = "\uf05e"
let g:coc_status_warning_sign = "\uf071"

""""""""""""""""""""""""""""""""
" ale
""""""""""""""""""""""""""""""""

let g:ale_sign_column_always = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 1
let g:ale_cache_executable_check_failures = 1
let g:ale_open_list = 1
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_set_highlights = 1
let g:ale_sign_error = "\uf05e"
let g:ale_sign_warning = "\uf071"
let g:ale_sign_info = "\uf7fc"
let g:ale_linters_ignore = {'typescript': []}
let g:ale_linter_aliases = {
\ 'javascript.jsx': ['css', 'javascript.jsx'],
\ 'typescript': ['css', 'typescript', 'typescript.tsx']
\}

let g:ale_linters = {
\ 'javascript': [],
\ 'javascript.jsx': [],
\ 'typescript': [],
\ 'ruby': ['rubocop'], 
\ 'css': ['stylelint'], 
\ 'scss': ['stylelint'], 
\ 'sass': ['stylelint'], 
\ 'nerdtree': ''
\}

let g:ale_fixers = {
\ 'javascript': [],
\ 'javascript.jsx': [],
\ 'typescript': [],
\ 'ruby': ['rubocop'], 
\ 'css': ['stylelint'], 
\ 'scss': ['stylelint'], 
\ 'sass': ['stylelint'], 
\ 'go': ['gofmt', 'goimports']
\}

" disable ale
"autocmd BufEnter *.min.* ALEDisable
"autocmd BufEnter */node_modules/* ALEDisable
"autocmd BufEnter */node_modules/* ALEDisable
"autocmd BufEnter */node_modules/* ALEDisable
"autocmd BufEnter */bundle/* ALEDisable
"autocmd BufEnter */.composer/* ALEDisable


""""""""""""""""""""""""""""""""
" mapping
""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

" noh
noremap <ESC><ESC> :noh<CR>

" buffer
nmap <C-p> :bprevious!<CR>
nmap <C-n> :bnext!<CR>
tmap <C-p> :bprevious!<CR>
tmap <C-n> :bnext!<CR>
nmap <space>1 <Plug>lightline#bufferline#go(1)
nmap <space>2 <Plug>lightline#bufferline#go(2)
nmap <space>3 <Plug>lightline#bufferline#go(3)
nmap <space>4 <Plug>lightline#bufferline#go(4)
nmap <space>5 <Plug>lightline#bufferline#go(5)
nmap <space>6 <Plug>lightline#bufferline#go(6)
nmap <space>7 <Plug>lightline#bufferline#go(7)
nmap <space>8 <Plug>lightline#bufferline#go(8)
nmap <space>9 <Plug>lightline#bufferline#go(9)
nmap <space>q :bd<CR>
map <C-q> :bd<CR>

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
  nnoremap <silent><buffer><expr> d defx#do_action('remove_trash')
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

nnoremap <silent><F2> :Defx -split=vertical -winwidth=50 -direction=topleft -toggle -columns=git:icons:mark:indent:filename:type<CR>
nnoremap <Leader>sf :Defx -split=vertical -winwidth=50 -direction=topleft -columns=git:icons:mark:indent:filename:type -search=`expand('%:p')`<CR>

"""""""""""""""""""""""""""""""""
" Denite
"""""""""""""""""""""""""""""""""
"let s:denite_win_width_percent = 0.8
"let s:denite_win_height_percent = 0.6
"
"" Change denite default options
"call denite#custom#option('default', {
"    \ 'split': 'floating',
"    \ 'winwidth': &columns * s:denite_win_width_percent,
"    \ 'wincol': (&columns - (&columns * s:denite_win_width_percent)) / 2,
"    \ 'winheight': &lines * s:denite_win_height_percent,
"    \ 'winrow': (&lines - (&lines * s:denite_win_height_percent)) / 2,
"    \ })
"
"""""""""""""""""""""""""""""""""
" Fzf
"""""""""""""""""""""""""""""""""
"nnoremap <silent><C-p> :Files<CR>
nnoremap <Leader>o :Files<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <silent><C-;> :Buffers<CR>
nnoremap <Leader>b :Buffers<CR>
nnoremap <Leader>l :BLines<CR>
nnoremap <Leader>gf :GFiles<CR>
nnoremap <Leader>gs :GFiles?<CR>
nnoremap <Leader>gl :BCommits<CR>
nnoremap <Leader>gla :Commits<CR>

nnoremap <Leader>ad :ALEDetail<CR>
nnoremap <Leader>af :ALEFix<CR>

" <C-,>でタグ検索
nnoremap <silent><C-g> :call fzf#vim#ag(expand('<cword>'))<CR>
nnoremap <silent><C-t> :call fzf#vim#tags(expand('<cword>'))<CR>
nmap <C-]> <Plug>(fzf_tags)

" fzfからファイルにジャンプできるようにする
let g:fzf_buffers_jump = 1

vmap <Leader>y "+y

nnoremap <silent><F9> :Vista coc<CR>
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
nnoremap <silent> <space>cd  :<C-u>CocList diagnostics<cr>
" Show all actions
nnoremap <silent> <space>ca  :<C-u>CocList actions<cr>
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
nnoremap <silent><F8> :Vista coc<CR>
nnoremap <Leader>vv :Vista finder<CR>
nnoremap <Leader>vcc :Vista coc<CR>
nnoremap <Leader>vcg :Vista ctags<CR>

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
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

let g:rainbow_active = 0

" let g:typescript_indent_disable = 1

""""""""""""""""""""""""""""""""
" lightline
""""""""""""""""""""""""""""""""

set showtabline=2
let g:lightline = {}
" let g:lightline.colorscheme = 'iceberg'
let g:lightline.colorscheme = 'icebergDark'
"let g:lightline.separator = { 'left': "\ue0b8 ", 'right': "\ue0be " }
"let g:lightline.subseparator = { 'left': "\ue0b9 ", 'right': "\ue0b9 " }
" let g:lightline.separator = {'left': "\ue0b0", 'right': "\ue0b2"}
" let g:lightline.subseparator = {'left': " \ue0b1", 'right': "\ue0b3 "}
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type = {'buffers': 'tabsel'}
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 2
let g:lightline.active = {
\   'left': [
\     [ 'mode', 'paste' ],
\     [ 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
\   ]
\ }
let g:lightline.component_function = {
\   'cocstatus': 'CustomCocStatus',
\   'currentfunction': 'CocCurrentFunction'
\ }
function! CustomCocStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  if get(info, 'error', 0)
    call add(msgs, "\uf05e  " . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, "\uf071  " . info['warning'])
  endif
  return join(msgs, ' ') . ' ' . get(g:, 'coc_status', '')
endfunction

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"""""""""""""""""""""""""""""""
" styled components syntax workaround
""""""""""""""""""""""""""""""""
autocmd BufEnter *.{js,jsx,ts,typescript.tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,typescript.tsx} :syntax sync clear
