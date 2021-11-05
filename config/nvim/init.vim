"
" 1. Init
"
" {{{================================================================================ 

" }}}================================================================================
"
" 2. plugins
"
" {{{================================================================================

call plug#begin('~/.config/nvim/plugged')

" help
Plug 'vim-jp/vimdoc-ja'

" startup
Plug 'mhinz/vim-startify'

" init
Plug 'tpope/vim-sensible'

" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sleuth'
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/copypath.vim'

" terminal
Plug 'kassio/neoterm'
Plug 'lambdalisue/edita.vim'

" session
Plug 'skanehira/vsession'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" file search & replace
Plug 'dyng/ctrlsf.vim'

" text operator
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-sandwich'
Plug 'easymotion/vim-easymotion'

" cursor jump
Plug 'osyo-manga/vim-over'

" comment out
Plug 'tomtom/tcomment_vim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascriptreact','typescript', 'typescriptreact'],
  \ 'do': 'make install'
\}

" parens & brackets completion
" Plug 'mattn/vim-lexiv'

" quotes & parets & brackets completion
Plug 'Raimondi/delimitMate'

" font
Plug 'ryanoasis/vim-devicons'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'

" color
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'cocopon/iceberg.vim'
Plug 'gkeep/iceberg-dark'
Plug 'ghifarit53/tokyonight-vim'
Plug 'marko-cerovac/material.nvim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'bluz71/vim-moonfly-colors'
Plug 'bluz71/vim-nightfly-guicolors'

" scroll
" Plug 'dstein64/nvim-scrollview', { 'branch': 'main' }

" tabline
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

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

Plug 'will133/vim-dirdiff'

" git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'cohama/agit.vim'
Plug 'lambdalisue/gina.vim'
Plug 'sjl/gundo.vim'
Plug 'samoshkin/vim-mergetool'
Plug 'iberianpig/tig-explorer.vim'

" launcher
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' }
Plug 'antoinemadec/coc-fzf'

" Sidebar
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/fern-mapping-project-top.vim'
Plug 'lambdalisue/fern-bookmark.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/fern-mapping-git.vim'

" spel check
Plug 'kamykn/spelunker.vim'

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

" browesr open
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'
Plug 'tyru/open-browser-unicode.vim'

" markdown viewr
Plug 'previm/previm', { 'for': ['markdown'] }
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" text alignment
Plug 'godlygeek/tabular'

" zen mode
Plug 'folke/zen-mode.nvim'

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
" set background=dark
" colorscheme iceberg

" let g:tokyonight_style = 'night' " available: night, storm
" let g:tokyonight_transparent_background = 1
" let g:tokyonight_disable_italic_comment = 1
let g:tokyonight_enable_italic = 1

colorscheme tokyonight

" let g:material_style = 'deep ocean'
"
" colorscheme material
"
" lua << EOF
" require('material').setup()
" EOF


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
" 	  fzf-preview
"
" ----{{{----------------------------------------------------------------------------

let g:fzf_preview_grep_cmd = 'rg --line-number --no-heading --color=never'

augroup fzf_preview
  autocmd!
  autocmd User fzf_preview#initialized call s:fzf_preview_settings()
augroup END

function! s:fzf_preview_settings() abort
  let g:fzf_preview_command = 'COLORTERM=truecolor ' . g:fzf_preview_command
  let g:fzf_preview_grep_preview_cmd = 'COLORTERM=truecolor ' . g:fzf_preview_grep_preview_cmd
endfunction


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
" 		vim-mergetool
"
" ----{{{----------------------------------------------------------------------------

let g:mergetool_layout = 'lmr'
let g:mergetool_prefer_revision = 'local'

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

let g:lightline = {
\   'colorscheme': 'icebergDark',
\   'active': {
\     'left': [
\       [ 'mode', 'paste' ],
\       [ 'gitbranch', 'cocstatus', 'currentfunction', 'readonly', 'filename', 'modified' ]
\     ]
\   },
\   'component_function': {
\     'cocstatus': 'coc#status',
\     'currentfunction': 'CocCurrentFunction',
\     'gitbranch': 'gina#component#repo#branch'
\   }
\ }

let g:lightline['colorscheme'] = 'tokyonight'

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
let g:coc_auto_copen = 0
let g:coc_status_error_sign = "\uf05e"
let g:coc_status_warning_sign = "\uf071"
" let g:coc_filetype_map = {
" \ 'markdown.mdx': 'javascriptreact',
" \ }

" ----}}}----------------------------------------------------------------------------
"
" 		fern
"
" ----{{{----------------------------------------------------------------------------

let g:fern#renderer = "nerdfont"
let g:fern#default_hidden = 1
let g:fern#default_exclude = '^\%(\.git\|\.DS_Store\)$'

augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern,startify call glyph_palette#apply()
augroup END

" ----}}}----------------------------------------------------------------------------
"
" 		spelunker
"
" ----{{{----------------------------------------------------------------------------

" Enable spelunker.vim. (default: 1)
" 1: enable
" 0: disable
let g:enable_spelunker_vim = 1

" Enable spelunker.vim on readonly files or buffer. (default: 0)
" 1: enable
" 0: disable
let g:enable_spelunker_vim_on_readonly = 0

" Check spelling for words longer than set characters. (default: 4)
let g:spelunker_target_min_char_len = 4

" Max amount of word suggestions. (default: 15)
let g:spelunker_max_suggest_words = 15

" Max amount of highlighted words in buffer. (default: 100)
let g:spelunker_max_hi_words_each_buf = 100

" Spellcheck type: (default: 1)
" 1: File is checked for spelling mistakes when opening and saving. This
" may take a bit of time on large files.
" 2: Spellcheck displayed words in buffer. Fast and dynamic. The waiting time
" depends on the setting of CursorHold `set updatetime=1000`.
let g:spelunker_check_type = 1

" Highlight type: (default: 1)
" 1: Highlight all types (SpellBad, SpellCap, SpellRare, SpellLocal).
" 2: Highlight only SpellBad.
" FYI: https://vim-jp.org/vimdoc-en/spell.html#spell-quickstart
let g:spelunker_highlight_type = 1

" Option to disable word checking.
" Disable URI checking. (default: 0)
let g:spelunker_disable_uri_checking = 1

" Disable email-like words checking. (default: 0)
let g:spelunker_disable_email_checking = 1

" Disable account name checking, e.g. @foobar, foobar@. (default: 0)
" NOTE: Spell checking is also disabled for JAVA annotations.
let g:spelunker_disable_account_name_checking = 1

" Disable acronym checking. (default: 0)
let g:spelunker_disable_acronym_checking = 1

" Disable checking words in backtick/backquote. (default: 0)
let g:spelunker_disable_backquoted_checking = 1

" Disable default autogroup. (default: 0)
let g:spelunker_disable_auto_group = 1

" Create own custom autogroup to enable spelunker.vim for specific filetypes.
augroup spelunker
  autocmd!
  " Setting for g:spelunker_check_type = 1:
  autocmd BufWinEnter,BufWritePost *.vim,*.js,*.jsx,*.json,*.md call spelunker#check()

  " Setting for g:spelunker_check_type = 2:
  autocmd CursorHold *.vim,*.js,*.jsx,*.json,*.md call spelunker#check_displayed_words()
augroup END

" Override highlight group name of incorrectly spelled words. (default:
" 'SpelunkerSpellBad')
let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'

" Override highlight group name of complex or compound words. (default:
" 'SpelunkerComplexOrCompoundWord')
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'

" Override highlight setting.
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=NONE gui=underline guifg=NONE

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

command! -nargs=* T split | wincmd j | resize 20 | terminal <args>

" noh
noremap <ESC><ESC> :noh<CR>

" quickvix を buffer list に入れない
augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
    autocmd FileType neoterm set nobuflisted
augroup END

" barbar

" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>    <C-p> :BufferPrevious<CR>
nnoremap <silent>    <C-n> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <C-<> :BufferMovePrevious<CR>
nnoremap <silent>    <C->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <space>1 :BufferGoto 1<CR>
nnoremap <silent>    <space>2 :BufferGoto 2<CR>
nnoremap <silent>    <space>3 :BufferGoto 3<CR>
nnoremap <silent>    <space>4 :BufferGoto 4<CR>
nnoremap <silent>    <space>5 :BufferGoto 5<CR>
nnoremap <silent>    <space>6 :BufferGoto 6<CR>
nnoremap <silent>    <space>7 :BufferGoto 7<CR>
nnoremap <silent>    <space>8 :BufferGoto 8<CR>
nnoremap <silent>    <space>9 :BufferLast<CR>
" Close buffer
nnoremap <silent>    <C-c> :BufferClose<CR>
nnoremap <silent>    <space>x :BufferClose<CR>

" fugitive 
nmap gs :G<CR>
nmap gc :G commit<CR>
nmap ga :G add<CR>
nmap gb :G blame<CR>

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
nnoremap <Leader>vf :Vista finder<CR>
nnoremap <Leader>vc :Vista coc<CR>
nnoremap <Leader>vt :Vista ctags<CR>

""""""""""""""""""""""""""""""""
" easymotion
""""""""""""""""""""""""""""""""

" <Leader>f{char} to move to {char}
map  <Leader>gj <Plug>(easymotion-bd-f)
nmap <Leader>gj <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>gl <Plug>(easymotion-bd-jk)
nmap <Leader>gl <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>gw <Plug>(easymotion-bd-w)
nmap <Leader>gw <Plug>(easymotion-overwin-w)

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

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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
nmap <silent>gt <Plug>(coc-type-definition)
" nmap <silent>gt :<C-u>CocCommand fzf-preview.CocTypeDefinitions

nmap <silent>gi <Plug>(coc-implementation)
" nmap <silent>gi :<C-u>CocCommand fzf-preview.CocImplementations
nmap <silent>gr <Plug>(coc-references)
" nmap <silent>gr :<C-u>CocCommand fzf-preview.CocReferences<CR>

" Remap for rename current word
nmap <silent>cr <Plug>(coc-rename)

xmap <silent>ca  <Plug>(coc-codeaction-selected)

" Remap for format selected region
xmap <silent>cf  <Plug>(coc-format-selected)

" Remap for do codeAction of current line
nmap <silent>ca  <Plug>(coc-codeaction)

" Fix autofix problem of current line
nmap <leader>cf  <Plug>(coc-fix-current)

" commad list
nmap <silent>cc  :<C-u>CocFzfList commands<CR>

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
nnoremap <silent> <space>df     :<C-u>FzfPreviewDirectoryFiles<CR>
nnoremap <silent> <space>f     :<C-u>FzfPreviewProjectFiles<CR>
nnoremap <silent> <space>gf     :<C-u>FzfPreviewGitFiles<CR>
nnoremap <silent> <space>r     :<C-u>FzfPreviewFromResources project_mru git<CR>
nnoremap <silent> <space>gs    :<C-u>FzfPreviewGitStatus<CR>
nnoremap <silent> <space>b     :<C-u>FzfPreviewAllBuffers<CR>
nnoremap <silent> <space>br    :<C-u>FzfPreviewProjectMruFiles<CR>
nnoremap <silent> <space>j 		 :<C-u>FzfPreviewJumps<CR>
nnoremap <silent> <space>gc    :<C-u>FzfPreviewChanges<CR>
nnoremap <silent> <space>/     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> <space>*     :<C-u>FzfPreviewLines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap <silent> <space>gr    :<C-u>FzfPreviewProjectGrep <space>
nnoremap          <C-g>        :<C-u>CocCommand fzf-preview.ProjectGrep <C-r>=expand('<cword>')<CR>
" nnoremap          <C-g>        :<C-u>CocCommand fzf-preview.ProjectGrep <C-r>=expand('<cword>')<CR><CR>
xnoremap          <C-g>        "sy:CocCommand   fzf-preview.ProjectGrep "<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"<CR>
nnoremap <silent> <space>t     :<C-u>FzfPreviewBufferTags<CR>
nnoremap <silent> <space>q     :<C-u>FzfPreviewQuickFix<CR>
nnoremap <silent> <space>l     :<C-u>FzfPreviewLocationList<CR>
nnoremap <silent> <space>dc    :<C-u>CocCommand fzf-preview.CocCurrentDiagnostics<CR>
nnoremap <silent> <space>da    :<C-u>CocCommand fzf-preview.CocDiagnostics<CR>

"""""""""""""""""""""""""""""""
" mergettool
"""""""""""""""""""""""""""""""
nmap <leader>mt <plug>(MergetoolToggle)


""""""""""""""""""""""""""""
" treesitter
""""""""""""""""""""""""""""

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },

  indent = {
    enable = true
  }
}
EOF

""""""""""""""""""""""""""""
" zen mode
""""""""""""""""""""""""""""

lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

" }}}================================================================================



