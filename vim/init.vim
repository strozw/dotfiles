"ttps://github.com/prabirshrestha/vim-lsp/wiki/Servers
" 1. Init
"
" {{{================================================================================
if has('python3')
  silent! python3 1
endif
" ----}}}----------------------------------------------------------------------------
" 	  polyglot
"
" ----{{{----------------------------------------------------------------------------

let g:polyglot_disabled = ['csv', 'styled-components']

" }}}================================================================================
" 2. ains
"
" {{{================================================================================

call plug#begin('~/.config/nvim/plugged')

" help
Plug 'vim-jp/vimdoc-ja'

" startup
Plug 'mhinz/vim-startify'

" init
Plug 'tpope/vim-sensible'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/copypath.vim'

" terminal
Plug 'kassio/neoterm'
Plug 'lambdalisue/edita.vim'

" session
Plug 'skanehira/vsession'

" coc
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Plug 'dsznajder/vscode-es7-javascript-react-snippets'

" scratch code 
Plug 'metakirby5/codi.vim'

" file replace
Plug 'dyng/ctrlsf.vim'

" text operator
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'tomtom/tcomment_vim'
Plug 'tyru/caw.vim'
Plug 'Raimondi/delimitMate'
" Plug 'cohama/lexima.vim'
Plug 'mattn/vim-lexiv'
Plug 'osyo-manga/vim-over'
Plug 'machakann/vim-sandwich'
Plug 'easymotion/vim-easymotion'

" font
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

" color
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'

" buffer
Plug 'qpkorr/vim-bufkill'
Plug 'tyru/notify-changed.vim'

" navigator
Plug 'tpope/vim-unimpaired'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" window resizer
Plug 'simeji/winresizer'

" statusline
Plug 'itchyny/lightline.vim'
Plug 'hallzy/lightline-iceberg'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'will133/vim-dirdiff'

" git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'cohama/agit.vim'
Plug 'lambdalisue/gina.vim'
Plug 'sjl/gundo.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'iberianpig/tig-explorer.vim'

" launcher
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'liuchengxu/vim-clap'
" Plug 'voldikss/vim-floaterm'

" Sidebar
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-mapping-project-top.vim'
Plug 'lambdalisue/fern-bookmark.vim'

" tag outline
Plug 'liuchengxu/vista.vim'

" for ruby
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rbenv', { 'for': ['ruby'] }
Plug 'tpope/vim-bundler', { 'for': ['ruby'] }
Plug 'tpope/vim-rails', { 'for': ['ruby'] }
Plug 'tpope/vim-endwise', { 'for': ['ruby'] }
Plug 'ecomba/vim-ruby-refactoring', { 'for': ['ruby'] }
Plug 'vim-utils/vim-ruby-fold', { 'for': ['ruby'] }

" for go
Plug 'mattn/vim-goimports', { 'for': ['go'] }

" .local.vimrc 
Plug 'thinca/vim-localrc'

" http rest client
Plug 'sharat87/roast.vim'

" markdown viewr
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

call plug#end()

" }}}================================================================================
"
" 3. Editor
"
" {{{================================================================================

" ファイルエンコーディング検出設定
set fileencodings=utf-8,cp932,euc-jp,iso-20220-jp,default,latin

" tab
set tabstop=2
set shiftwidth=2

" 折り返しインデント
set breakindent

" 日本語の途中でも折り返す
set formatoptions+=mM

" クリップボード
set clipboard+=unnamed

" Windowsのエディタの人達に嫌われない設定
set nofixendofline
" ○, △, □等の文字幅をASCII文字の倍にする
" set ambiwidth=double
" swapファイルはローカル作成がトラブル少なめ
set directory-=.

" 
set updatetime=500

" undo
set undodir=~/tmp/vim/undo
set undofile

" 行番号表示
set number

" split window position
set splitright

" autoload on edit
set hidden

" spell check
set nospell
set spelllang+=cjk

" oldfiles uses viminfo, but the default setting is 100
" Change the number by setting it in viminfo with a single quote.
" Ref: viminfo-'
set viminfo='1000

" grep
let &grepprg="grep -rnIH --exclude=.git --exclude-dir=.hg --exclude-dir=.svn --exclude=tags"
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading
  set grepformat=%f:%l:%c:%m,%f:%l:%m
endif

" mosue 有効化
set mouse=a

" マウスの中央ボタンクリックによるクリップボードペースト動作を抑制する
noremap <MiddleMouse> <Nop>
noremap! <MiddleMouse> <Nop>
noremap <2-MiddleMouse> <Nop>
noremap! <2-MiddleMouse> <Nop>
noremap <3-MiddleMouse> <Nop>
noremap! <3-MiddleMouse> <Nop>
noremap <4-MiddleMouse> <Nop>
noremap! <4-MiddleMouse> <Nop>

" }}}================================================================================
"
" 4. Color
"
" {{{================================================================================

set termguicolors
set background=dark
colorscheme iceberg

" }}}================================================================================
" 
" 5. Cursor
"
" {{{================================================================================

" CursorShape settings
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set hlsearch

" }}}================================================================================
"
" 6. Plugins
"
" {{{================================================================================
"
" 	  statify
"
" ----{{{----------------------------------------------------------------------------

let s:startify_ascii_header = [
 \ '                                        ▟▙            ',
 \ '                                        ▝▘            ',
 \ '██▃▅▇█▆▖  ▗▟████▙▖   ▄████▄   ██▄  ▄██  ██  ▗▟█▆▄▄▆█▙▖',
 \ '██▛▔ ▝██  ██▄▄▄▄██  ██▛▔▔▜██  ▝██  ██▘  ██  ██▛▜██▛▜██',
 \ '██    ██  ██▀▀▀▀▀▘  ██▖  ▗██   ▜█▙▟█▛   ██  ██  ██  ██',
 \ '██    ██  ▜█▙▄▄▄▟▊  ▀██▙▟██▀   ▝████▘   ██  ██  ██  ██',
 \ '▀▀    ▀▀   ▝▀▀▀▀▀     ▀▀▀▀       ▀▀     ▀▀  ▀▀  ▀▀  ▀▀',
 \ '',
 \]
let g:startify_custom_header = map(s:startify_ascii_header +
        \ startify#fortune#quote(), '"   ".v:val')

let g:startify_change_to_vcs_root = 1

" ----}}}----------------------------------------------------------------------------
"
" 	  fzf
"
" ----{{{----------------------------------------------------------------------------

let g:fzf_history_dir = '~/.local/share/fzf-history'

" ----}}}----------------------------------------------------------------------------
"
" 	  asynccomplete
"
" ----{{{----------------------------------------------------------------------------
"
" call asyncomplete#register_source(asyncomplete#sources#nextword#get_source_options({
"   \ 'name': 'nextword',
"   \ 'whitelist': ['*'],
"   \ 'args': ['-n', '10000'],
"   \ 'completor': function('asyncomplete#sources#nextword#completor')
"   \ }))

" au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#look#get_source_options({
"   \ 'name': 'look',
"   \ 'whitelist': ['*'],
"   \ 'completor': function('asyncomplete#sources#look#completor'),
"   \ }))

" ----}}}----------------------------------------------------------------------------
"
" 	  airline
"
" ----{{{----------------------------------------------------------------------------

let g:airline_theme='iceberg'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1

" ----}}}----------------------------------------------------------------------------
"
" 		vim-mergetool
"
" ----{{{----------------------------------------------------------------------------

let g:mergetool_layout = 'lmr'
let g:mergetool_prefer_revision = 'local'

" ----}}}----------------------------------------------------------------------------
"
" 		vim-clap
"
" ----{{{----------------------------------------------------------------------------

let g:clap_theme = 'iceberg'

" ----}}}----------------------------------------------------------------------------
"
" 		styled components syntax workaround
"
" ----{{{----------------------------------------------------------------------------

autocmd BufEnter *.{js,jsx,ts,typescript.tsx} :syntax sync fromstart
autocmd BufLeave *.{js,jsx,ts,typescript.tsx} :syntax sync clear

" ----}}}----------------------------------------------------------------------------
"
" 		neoterm
"
" ----{{{----------------------------------------------------------------------------

let g:neoterm_autoinsert = 1
let g:neoterm_autojump = 1


" ----}}}----------------------------------------------------------------------------
"
" 		lightline
"
" ----{{{----------------------------------------------------------------------------
set showtabline=2

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#unnamed = '[No Name]'
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#clickable = 1

let g:lightline = {
\   'colorscheme': 'icebergDark',
\   'active': {
\     'left': [
\       [ 'mode', 'paste' ],
\       [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
\     ]
\   },
\   'tabline': {
\     'left': [ ['buffers'] ],
\     'right': [ ['close'] ]
\   },
\   'component_expand': {
\     'buffers': 'lightline#bufferline#buffers'
\   },
\   'component_type': {
\     'buffers': 'tabsel'
\   },
\   'component_raw': {
\     'buffers': 1
\   },
\   'component_function': {
\     'cocstatus': 'coc#status',
\     'currentfunction': 'CocCurrentFunction',
\     'gitbranch': 'gina#component#repo#branch'
\   }
\ }

autocmd BufWritePost,TextChanged,TextChangedI * call lightline#update()

" ----}}}----------------------------------------------------------------------------
"
" 		indent guides
"
" ----{{{----------------------------------------------------------------------------

let g:indent_guides_auto_colors = 1
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['nerdtree', 'defx', 'fzf', 'help', 'jax', 'coc-explorer']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=black
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=darkgrey

let g:rainbow_active = 0

" let g:typescript_indent_disable = 1

" ----}}}----------------------------------------------------------------------------
"
" 		coc
"
" ----{{{----------------------------------------------------------------------------

let g:coc_status_error_sign = "\uf05e"
let g:coc_status_warning_sign = "\uf071"
let g:coc_filetype_map = {
\ 'markdown.mdx': 'javascriptreact',
\ }

" ----}}}----------------------------------------------------------------------------
"
" 		fern
"
" ----{{{----------------------------------------------------------------------------

let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern,startify call glyph_palette#apply()
augroup END

" ----}}}----------------------------------------------------------------------------

" }}}================================================================================
"
" 7. Mappings
"
" {{{================================================================================

autocmd BufEnter,BufNew term://* startinsert

let mapleader = "\<Space>"

" terminal
" tmap <ESC><ESC> <C-\><C-n>
tmap <silent><ESC> <C-\><C-n>
tmap <C-h> <C-\><C-n>0<C-w>h
" tmap <C-l> <C-\><C-n>0<C-w>l
tmap <C-k> <C-\><C-n>0<C-w>k
tmap <C-j> <C-\><C-n>0<C-w>j

nmap <C-t>v :vert Tnew<CR>
nmap <C-t>s :belowright Tnew<CR>
nmap <C-t><C-v> :vert Ttoggle<CR>
nmap <C-t><C-s> :belowright Ttoggle<CR>
nmap <C-t>c :belowright Tclose<CR>

tmap <C-t>v <C-\><C-n>:vert Tnew<CR>
tmap <C-t>s <C-\><C-n>:belowright Tnew<CR>
tmap <C-t><C-v> <C-\><C-n>:vert Ttoggle<CR>
tmap <C-t><C-s> <C-\><C-n>:belowright Ttoggle<CR>
tmap <C-t>c <C-\><C-n>:belowright Tclose<CR>

" noh
noremap <ESC><ESC> :noh<CR>

" quickvix を buffer list に入れない
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
    autocmd FileType neoterm set nobuflisted
augroup END

" buffer
nmap <C-p> :bprevious<CR>
nmap <C-n> :bnext<CR>
nmap <C-w>c :hide<CR>
" tmap <C-p> :bprevious!<CR>
" tmap <C-n> :bnext!<CR>
nmap <space>1 <Plug>lightline#bufferline#go(1)
nmap <space>2 <Plug>lightline#bufferline#go(2)
nmap <space>3 <Plug>lightline#bufferline#go(3)
nmap <space>4 <Plug>lightline#bufferline#go(4)
nmap <space>5 <Plug>lightline#bufferline#go(5)
nmap <space>6 <Plug>lightline#bufferline#go(6)
nmap <space>7 <Plug>lightline#bufferline#go(7)
nmap <space>8 <Plug>lightline#bufferline#go(8)
nmap <space>9 <Plug>lightline#bufferline#go(9)
" buffer kill しつつ、 windowは残す
nmap <space>x :BD<CR>

" fugitive 
nmap gs :Gstatus<CR>
nmap gc :Gcommit<CR>
nmap ga :Gw<CR>
nmap gb :Gblame<CR>

" fern
nmap <silent><F2> :Fern . -drawer -toggle -width=50<CR>
nmap so :Fern . -drawer -toggle -width=50<CR>
nmap ss :Fern . -drawer -width=50 -reveal=%<CR>

function! s:init_fern() abort
  nmap <buffer> <C-H> :TmuxNavigateLeft<CR>
  nmap <buffer> <C-L> :TmuxNavigateRight<CR>
  nmap <buffer> <C-J> :TmuxNavigateDown<CR>
  nmap <buffer> <C-K> :TmuxNavigateUp<CR>
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""

" nmap <Space>o :Files<CR>
" nmap <Space>f :Files<CR>
" nmap <Space>b :Buffers<CR>
" nmap <Space>ll :LocationList<CR>
" nmap <Space>ln :BLines<CR>
" nmap <Space>gf :GFiles<CR>
" nmap <Space>gs :GFiles?<CR>
" nmap <Space>gl :BCommits<CR>
" nmap <Space>gla :Commits<CR>
"
" nmap <Space>ad :ALEDetail<CR>
" nmap <Space>af :ALEFix<CR>
"
" " <C-,>でタグ検索
" nnoremap <silent><C-g> :call fzf#vim#ag(expand('<cword>'))<CR>
" nmap <C-]> <Plug>(fzf_tags)
"
" " fzfからファイルにジャンプできるようにする
" let g:fzf_buffers_jump = 1
"
" vmap <Leader>y "+y
"
" command! -bang -nargs=? -complete=dir Files
"     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
"
" " fzf for qf
" " @ref https://github.com/natebosch/dotfiles/commit/4eb2f5eb12e8b71221959d57edbc8ca9834f8e61
"
" command! QuickFix call <SID>QuickFix()
" command! LocationList call <SID>LocationList()
"
" function! s:QuickFix() abort
"   call s:FuzzyPick(getqflist(), 'cc')
" endfunction
"
" function! s:LocationList() abort
"   call s:FuzzyPick(getloclist(0), 'll')
" endfunction
"
" function! s:FuzzyPick(items, jump) abort
"   let items = map(a:items, {idx, item ->
"       \ string(idx).' '.bufname(item.bufnr).' '.item.text})
"   call fzf#run({'source': items, 'sink': function('<SID>Pick', [a:jump]),
"       \'options': '--with-nth 2.. --reverse', 'down': '40%'})
" endfunction
"
" function! s:Pick(jump, item) abort
"   let idx = split(a:item, ' ')[0]
"   execute a:jump idx + 1
" endfunction
"
" nnoremap <Space>lq :QuickFix<cr>
" nnoremap <Space>ll :LocationList<cr>

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

nnoremap <silent><F8> :Vista coc<CR>
nnoremap <Leader>vv :Vista finder<CR>
nnoremap <Leader>vcc :Vista coc<CR>
nnoremap <Leader>vcg :Vista ctags<CR>

""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""

" <Leader>f{char} to move to {char}
map  <Leader>j <Plug>(easymotion-bd-f)
nmap <Leader>j <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"""""""""""""""""""""""""""""""
" vsnip
"""""""""""""""""""""""""""""""

" imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand)'         : '<C-j>'
" imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
" imap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" smap <expr> <Tab>   vsnip#available(1)  ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
" imap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" smap <expr> <S-Tab> vsnip#available(-1) ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

"""""""""""""""""""""""""""""""
" coc
"""""""""""""""""""""""""""""""

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap keys for gotos
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr :<C-u>CocCommand fzf-preview.CocReferences<CR>

" Remap for rename current word
" nmap <silent>cr <Plug>(coc-rename)
nmap <silent>cr <Plug>(coc-floatinput-rename)

xmap <silent>ca  <Plug>(coc-codeaction-selected)

" Remap for format selected region
xmap <silent>cf  <Plug>(coc-format-selected)

" Remap for do codeAction of current line
nmap <silent>ca  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cf  <Plug>(coc-fix-current)

" commad list
nmap <silent>cc  :<C-u>CocCommand<CR>

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" coc-snippets
imap <C-l> <Plug>(coc-snippets-expand)

vmap <C-j> <Plug>(coc-snippets-select)

let g:coc_snippet_next = '<c-j>'

let g:coc_snippet_prev = '<c-k>'

imap <C-j> <Plug>(coc-snippets-expand-jump)

"""""""""""""""""""""""""""""""
" fzf preview
"""""""""""""""""""""""""""""""
nnoremap <silent> <space>f     :<C-u>CocCommand fzf-preview.ProjectFiles<CR>
nnoremap <silent> <space>r     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> <space>gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> <space>b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> <space>B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> <space>br    :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> <space><C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> <space>gc    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> <space>/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> <space>*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap <silent> <space>gr    :<C-u>CocCommand fzf-preview.ProjectGrep <space>
nnoremap          <C-g>        :<C-u>CocCommand fzf-preview.ProjectGrep <C-r>=expand('<cword>')<CR>
" nnoremap          <C-g>        :<C-u>CocCommand fzf-preview.ProjectGrep <C-r>=expand('<cword>')<CR><CR>
xnoremap          <C-g>        "sy:CocCommand   fzf-preview.ProjectGrep "<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"<CR>
nnoremap <silent> <space>t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> <space>q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> <space>l     :<C-u>CocCommand fzf-preview.LocationList<CR>
nnoremap <silent> <space>dc    :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> <space>da    :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>

"""""""""""""""""""""""""""""""
" mergettool
"""""""""""""""""""""""""""""""
nmap <leader>mt <plug>(MergetoolToggle)

" }}}================================================================================
