" php ref
let g:ref_phpmanual_path = $HOME . '/References/php-chunked-xhtml'

inoremap <C-D> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-D> :call PhpDocSingle()<CR>
vnoremap <C-D> :call PhpDocRange()<CR>
