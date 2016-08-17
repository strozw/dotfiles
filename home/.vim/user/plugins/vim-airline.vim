"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 0

if has('gui_running')
  let g:airline#extensions#tabline#enabled = 0
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  "let g:airline_theme='hybridline'
  "let g:airline_theme='wombat'
  let g:airline_theme='onedark'
else
  let g:airline#extensions#tabline#enabled = 1
  "let g:airline#extensions#tabline#left_sep = ''
  "let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  "let g:airline_theme='bubblegum'
  "let g:airline_theme='hybridline'
  "let g:airline_theme='base16'
  "let g:airline_theme='onedark'
  "let g:airline_theme='wombat'
endif
"let g:airline_theme='onedark'
let g:airline_theme='one'


