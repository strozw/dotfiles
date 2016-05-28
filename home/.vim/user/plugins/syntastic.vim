"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 
\ 'mode': 'active',
\ 'active_filetypes': [],
\ 'passive_filetypes': ['html'] 
\}

let g:syntastic_check_on_open = 1
let g:syntastic_auto_jump = 0

" HTML
"let g:syntastic_html_checkers = ['jshint']
let g:syntastic_html_validator_parser = 'html5'
let g:syntastic_javascript_checkers = ['eslint']



