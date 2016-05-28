"""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""

" GVim起動時にNERDTreeTabsを開かない
let g:nerdtree_tabs_open_on_gui_startup = 0

" NERDTreeGit Stats Icon
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "≠",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" keymap 
nnoremap <F2> :NERDTreeTabsToggle<Cr>
nnoremap <D-1> :NERDTreeTabsToggle<Cr>

let g:minimap_highlight='Visual'

