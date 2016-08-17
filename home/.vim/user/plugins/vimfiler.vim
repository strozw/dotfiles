"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimfiler.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 自動カレントディレクトリ変更 OFF
let g:vimfiler_enable_auto_cd = 0

" Default File Explorer
let g:vimfiler_as_default_explorer = 1

"
let g:vimfiler_ignore_pattern='\(^\.\|\~$\|\.pyc$\|\.[oad]$\)'

" Enable file operation commands.
let g:vimfiler_safe_mode_by_default = 0


" filename column min size
let g:vimfiler_min_filename_width = 30
"
" filename column max size
let g:vimfiler_max_filename_width = 60

" VimFiler をNERDTreeっぽく使う方法
command! -nargs=0 MyVimFilerExp call s:my_vimfiler_exp()
function! s:my_vimfiler_exp()
    if (exists(":VimFilerCurrentDir") == 2)
      :VimFilerCurrentDir -explorer -winwidth=50<Cr>
    else
      :VimFilerExplorer -winwidth=50<Cr>
    endif
endfunction

"nnoremap <F2> :MyVimFilerExp<Cr>
"nnoremap <D-1> :MyVimFilerExp<Cr>

" my_split
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'split '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_split', my_action)

" my_vsplit
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'vsplit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_vsplit', my_action)

" my_tabopen
let my_action = { 'is_selectable' : 1 }
function! my_action.func(candidates)
  wincmd p
  exec 'tabedit '. a:candidates[0].action__path
endfunction
call unite#custom_action('file', 'my_tabopen', my_action)

" unite-file_rec/async の除外パターン
call unite#custom#source('file_rec/async', 'ignore_pattern', '\.\(png\|gif\|jpeg\|jpg\|JPG\|mpeg\|flv\|avi\|swf\|ico\|icon\|app\|exe\|svn\|git\)$')
let g:unite_source_rec_max_cache_files = 10000


