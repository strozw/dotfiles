
"uniteを開いている間のキーマッピング
"
"ESCでuniteでを終了
nmap <buffer> <ESC> <Plug>(unite_exit)
nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
"入力モードのきctrl+wでバックスラッシュも削除
"imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
"ctrl+jで縦に分割して開く
"nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
"ctrl+lで横横に分割して開く
"nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
"ctrl+oでその場所に開く
nnoremap <silent> <buffer> <expr> <o> unite#do_action('open')
nnoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')
inoremap <silent> <buffer> <expr> <C-o> unite#do_action('open')

" my tabopen (Unite を終了しないtabopen)
let my_tabopen = {
\ 'is_quit' : 0,
\ }
function! my_tabopen.func(candidates)
  call unite#take_action('tabopen', a:candidates)
endfunction
call unite#custom_action('*', 'tabopen', my_tabopen)
unlet my_tabopen
