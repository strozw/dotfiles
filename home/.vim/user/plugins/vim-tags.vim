"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_tags_project_tags_command ='ctags -R  --fields=+aimS {OPTIONS} {DIRECTORY} 2>/dev/null &'
let g:vim_tags_auto_generate = 0
let g:vim_tags_use_vim_dispatch = 0
let g:vim_tags_use_ycm = 0
"let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore']
let g:vim_tags_ignore_files = []
let g:vim_tags_directories = ['.git', '.svn', 'CVS']
let g:vim_tags_main_file = 'tags'
let g:vim_tags_extension = '.tags'



