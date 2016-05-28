"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite.vim
" 参考：http://www.karakaram.com/vim/unite/
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"unite prefix key.
nnoremap [unite] <Nop>
"nmap <Space>F [unite]
nmap <C-u> [unite]

"unite general settings
"インサートモード開始
"let g:unite_enable_start_insert = 1
"最近開いたファイル履歴お保存数
let g:unite_source_file_mru_limit = 40

"file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

" unite grep
"let g:unite_source_grep_default_opts = '-iRHn --exclude=''.tags'' --exclude=''tags'' --exclude=''.svn'' --exclude=''.git'''
let g:unite_source_grep_command = 'pt'
let g:unite_source_grep_default_opts = '--nocolor --nogroup --ignore=''*.tags'' --ignore=''tags'' --ignore=''.svn'' --ignore=''.git'''
let g:unite_source_grep_recursive_opt = ''
let g:unite_source_grep_max_candidates  = 200
let g:unite_source_rec_max_cache_files = 0
let g:unite_source_rec_async_command = ['pt --nocolor --nogroup --ignore ".hg" --ignore ".svn" --ignore ".git" --ignore ".bzr" --hidden -g ""']
let g:unite_converter_file_directory_width = 100

call unite#custom#source('file_rec,file_rec/async',
    \ 'max_candidates', 0)


"現在開いているファイルのディレクトリ下のファイル一覧
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :UniteWithBufferDir file<CR>
nnoremap <silent> [unite]ff :Unite file/async -start-insert<CR>
"ソース一覧
nnoremap <silent> [unite]b :Unite source<CR>
"バッファ一覧
nnoremap <silent> [unite]b :Unite buffer<CR>
"レジスタ一覧
nnoremap <silent> [unite]r :Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :Unite file_mru<CR>
"ブックマーク一覧
nnoremap <silent> [unite]c :Unite bookmark<CR>
"ブックマークを追加
nnoremap <silent> [unite]a :UniteBookmarkAdd<CR>
" ライン
nnoremap <silent> [unite]l :Unite line<CR>
" アウトライン
nnoremap <silent> [unite]ol :Unite outline<CR>
" grep
nnoremap <silent> [unite]g :Unite grep -no-quit<CR>
" locate
nnoremap <silent> [unite]lo :Unite locate<CR>
" tag
nnoremap <silent> [unite]t :Unite tag -no-quit<CR>
" help
nnoremap <silent> [unite]h :Unite help<CR>
" versions
nnoremap <silent> [unite]v :Unite versions<CR>
" version/{type}/changeset
nnoremap <silent> [unite]vsc :Unite versions/svn/changeset<CR>
nnoremap <silent> [unite]vgc :Unite versions/git/changeset<CR>
" version/{type}/log
nnoremap <silent> [unite]vsl :Unite versions/svn/log<CR>
nnoremap <silent> [unite]vgl :Unite versions/git/log<CR>
" version/{type}/status
nnoremap <silent> [unite]vss :Unite versions/svn/status<CR>
nnoremap <silent> [unite]vgs :Unite versions/git/status<CR>

nnoremap <silent> [unite]p :<C-u>call <SID>unite_project('-start-insert')<CR>

function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec:' . dir
endfunction

" 現在のプロジェクト内のファイルを一望する
" 参考 : http://d.hatena.ne.jp/h1mesuke/20110918/p1
nnoremap <silent> [unite]p :<C-u>call <SID>unite_project('-start-insert')<CR>
function! s:unite_project(...)
  let opts = (a:0 ? join(a:000, ' ') : '')
  let dir = unite#util#path2project_directory(expand('%'))
  execute 'Unite' opts 'file_rec:' . dir
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-l> :<C-u>UniteWithCursorWord line<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-grep
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-g> :<C-u>UniteWithCursorWord grep:./<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" unite-tag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_tag_max_name_length = 25
let g:unite_source_tag_max_fname_length = 150

" C-] にマッピング
autocmd BufEnter *
\   if empty(&buftype)
\|        nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord tag<CR>
\|   endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite-jump タグジャンプ前の位置一覧
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <C-t> :<C-u>Unite jump<CR>



