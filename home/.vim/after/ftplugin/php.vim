" tab
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

" php doc
inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

" php namespace
inoremap <Leader>u <C-O>:call PhpInsertUse()<CR>
noremap <Leader>u :call PhpInsertUse()<CR>
noremap <M-Space> :call PhpInsertUse()<CR>
inoremap <Leader>e <C-O>:call PhpExpandClass()<CR>
noremap <Leader>e :call PhpExpandClass()<CR>

"neocompleteの補完候補
let g:neocomplete#sources = {
  \ '_' : ['neosnippet', 'omni', 'tag', 'file', 'syntax', 'include', 'buffer', 'file/include']
  \ }

" omni func
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"autocmd FileType php call SetOmniFunc()
"
"function! SetOmniFunc() 
"    if phpcomplete_extended#is_phpcomplete_extended_project()
"        setlocal omnifunc=phpcomplete_extended#CompletePHP
"    else
"        setlocal omnifunc=phpcomplete#CompletePHP
"    endif
"endfunction

" vim-ref
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'

"syntastic
"let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"let g:syntastic_php_checkers=['php', 'phpmd']
let g:syntastic_php_checkers=['php']

" tags
"let g:vim_tags_project_tags_command = "ctags -f ~/php.tags -R ./ 2>/dev/null"

"autocmd  FileType  php setlocal omnifunc=phpcomplete_extended#CompletePHP

" quickrun phpunit
"augroup QuickRunPHPUnit
"  autocmd!
"  autocmd BufWinEnter,BufNewFile *Test.php set filetype=phpunit
"augroup END
"
"let g:quickrun_config['phpunit'] = {}
"let g:quickrun_config['phpunit']['outputter'] = 'phpunit'
"let g:quickrun_config['phpunit']['command'] = 'phpunit'
"let g:quickrun_config['phpunit']['cmdopt'] = ''
"let g:quickrun_config['phpunit']['exec'] = '%c %o %s'
"
"let g:quickrun_config['phpunit']['outputter/phpunit/running_mark'] = 'running...'
"let g:quickrun_config['phpunit']['outputter/phpunit/height'] = 3
"let g:quickrun_config['phpunit']['outputter/phpunit/auto_open'] = 0
