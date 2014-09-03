
"
" tab
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"
" ref.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ref_refe_cmd = $HOME . "/References/ruby-refm/ruby-refm-1.9.3-dynamic-snapshot/refe-1_9_3"



" omni
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable omni completion.
autocmd FileType ruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby let g:rubycomplete_rails = 1

" rsense
let g:rsenseHome = "/usr/local/Cellar/rsense/0.3/libexec/"
let g:rsenseUseOmniFunc = 1
let g:neocomplete#sources#rsense#home_directory = "/usr/local/Cellar/rsense/0.3/libexec/"


