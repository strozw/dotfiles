
"
" omnifunct
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufNewFile,BufRead *.as    setl omnifunc=flexapi#complete

au CompleteDone *.as          call flexapi#showRef()
au BufNewFile,BufRead *.as    inoremap <expr> <c-down> flexapi#nextRef()
au BufNewFile,BufRead *.as    inoremap <expr> <c-up>   flexapi#prevRef()

if has("balloon_eval") && has("balloon_multiline") 
  au BufNewFile,BufRead *.as  setl bexpr=flexapi#balloon()
  au BufNewFile,BufRead *.as  setl ballooneval
endif

"
" Taglist 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tlist_actionscript_settings = 'actionscript;c:class;v:var;p:property;m:method;f:function;o:object;const:constants'
