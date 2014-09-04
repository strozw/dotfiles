"
autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags

" Quickrun
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quickrun_config['markdown'] = {
\ 'type': 'markdown/pandoc',
\ 'outputter': 'browser',
\ 'cmdopt': '-s'
\ }
