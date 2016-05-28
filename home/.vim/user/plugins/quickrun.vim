
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"quickrun.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :QuickRun<Cr>
let g:quickrun_config = {}

" vimproc使用
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 10,
\   },
\   'html' : { 'command' : 'open' },
\}


