inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>

" neocomplete

"if exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"endif

" vim-ref
let g:ref_phpmanual_path = $HOME . '/.vim/refs/php-chunked-xhtml'
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
