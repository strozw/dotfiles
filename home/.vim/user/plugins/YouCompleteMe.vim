
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_collect_identifiers_from_tags_files = 1
autocmd BufEnter FileType javascript nnoremap ,gd :<C-u>YcmCompleter GetDoc<CR>
autocmd BufEnter Filetype javascript nnoremap ,gt :<C-u>YcmCompleter GoTo<CR>
autocmd BufEnter FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS


