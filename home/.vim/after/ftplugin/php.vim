"
" tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=4
set autoindent
" ハードタブ
set noexpandtab
" ソフトタブ
"set expandtab
set shiftwidth=4

let php_folding = 0

"
" php doc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

"
" php namespace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
noremap <M-Space> :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

"
"neocompleteの補完候補
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neocomplete#sources = {
\ '_' : ['file', 'neosnippet', 'omni', 'tag', 'syntax', 'include', 'buffer', 'file/include']
\ }

"
" phpcomplete option
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_complete_for_unknown_classes = 0
let g:phpcomplete_search_tags_for_variables = 1
let g:phpcomplete_min_num_of_chars_for_namespace_completion = 1
let g:phpcomplete_parse_docblock_comments = 1
let g:phpcomplete_cache_taglists = 1
let g:phpcomplete_enhance_jump_to_definition = 0

"
" phpcomplete_extended
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:phpcomplete_index_composer_command = 'composer'

"set omnifunc=phpcomplete#CompletePHP
"autocmd FileType php set omnifunc=phpcomplete_extended#CompletePHP

"autocmd FileType php call SetOmniFunc()
"function! SetOmniFunc() 
"    if phpcomplete_extended#is_phpcomplete_extended_project()
"        setlocal omnifunc=phpcomplete_extended#CompletePHP
"    else
"        setlocal omnifunc=phpcomplete#CompletePHP
"    endif
"endfunction

"
" vim-ref
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'

"
"syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_php_checkers=['php']

"
" tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=php.tags

"
" vim-tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_tags_project_tags_command = 'ctags -R --fields=+aimS --languages=php -f ./php.tags 2>/dev/null'
"let g:vim_tags_project_tags_command = 'ctags -R --fields=+aimS --sort=yes -f ./php.tags 2>/dev/null'
let g:vim_tags_auto_generate = 1
let g:vim_tags_use_vim_dispatch = 1



