"
" tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

"
" syntax
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"au FileType javascript call JavaScriptFold()

" javascript libs syntax
let g:used_javascript_libs = 'underscore,backbone,jquery'
"
" tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=js.tags

"
" vim-tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_tags_project_tags_command = 'jsctags -R --fields=+aimS --languages=js -f ./js.tags 2>/dev/null'
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 0

" tagbar
let g:tagbar_type_javascript = {
\ 'ctagsbin' : '/Users/satoru/.ndenv/versions/v0.11.12/bin/jsctags'
\ }

"
"syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers=['jshint']

"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let $JS_CMD='node'
