"
" tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

"
" tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=js.tags

"
" vim-tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_tags_project_tags_command = 'ctags -R --fields=+aimS --languages=js -f ./js.tags 2>/dev/null'
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 0

"
"syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers=['jshint']
