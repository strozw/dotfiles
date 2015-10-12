
" omni
autocmd FileType java set omnifunc=javacomplete#Complete

map <F4> <Plug>(JavaComplete-Imports-Add)
imap <F4> <Plug>(JavaComplete-Imports-RemoveUnused)
nmap <F4> <Plug>(JavaComplete-Imports-Add)
nmap <F4> <Plug>(JavaComplete-Imports-RemoveUnused)

"let g:JavaComplete_MavenRepositoryDisable = 1
"let g:JavaComplete_UseFQN = 1

" quickrun
let g:quickrun_config["java"] = {
\ 'exec' : ['javac -J-Dfile.encoding=UTF8 %o %s', '%c -Dfile.encoding=UTF8 %s:t:r %a']
\}

