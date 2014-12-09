"
autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags


" livedown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" should markdown preview get shown automatically upon opening markdown buffer
let g:livedown_autorun = 0

" should the browser window pop-up upon previewing
let g:livedown_open = 1 

" the port on which Livedown server will run
let g:livedown_port = 1337

" function mappping
map gm :call LivedownPreview()<CR>

" Quickrun
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quickrun_config['markdown'] = {
\ 'type': 'markdown/pandoc',
\ 'outputter': 'browser',
\ 'cmdopt': '-s'
\ }
