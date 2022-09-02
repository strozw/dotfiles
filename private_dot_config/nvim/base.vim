let g:python_host_prog = system('echo -n $(which python)')
let g:python3_host_prog = system('echo -n $(which python3)')

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

" auto select feature.
set completeopt+=noinsert

" disable omni completion preview window
set completeopt-=preview


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

" CursorShape settings
if exists('$TMUX')
	let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
	let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
	let &t_SI = "\<Esc>]50;CursorShape=1\x7"
	let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

set hlsearch

" enable term guicolors
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

colorscheme tokyonight	

" nohlsearch
noremap <silent> <ESC><ESC> :nohlsearch<CR>

" quickfix jump
nmap <silent> [q :cprevious<CR>
nmap <silent> ]q :cnext<CR>

augroup MyVimrc
		autocmd!
augroup END

autocmd MyVimrc BufNewFile,BufRead dein*.toml call s:syntax_range_dein()

function! s:syntax_range_dein() abort
	let start = '^\s*hook_\%('.
	\           'add\|source\|post_source\|post_update'.
	\           '\)\s*=\s*%s'

	call SyntaxRange#Include(printf(start, "'''"), "'''", 'vim', '')
	call SyntaxRange#Include(printf(start, '"""'), '"""', 'vim', '')
endfunction
