
nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<Cr>
nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<Cr>
nnoremap <buffer>E          :call vimfiler#mappings#do_action('my_tabopen')<Cr>
