"
" Taglist 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tlist_actionscript_settings = 'actionscript;c:class;v:var;p:property;m:method;f:function;o:object;const:constants'

setl omnifunc=flexapi#complete

au CompleteDone *.as          call flexapi#showRef()
inoremap <expr> <c-down> flexapi#nextRef()
inoremap <expr> <c-up>   flexapi#prevRef()

if has("balloon_eval") && has("balloon_multiline") 
  setl bexpr=flexapi#balloon()
  setl ballooneval
endif

"
" Quickrun
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:quickrun_config['actionscript']  = {
\ 'command': 'mxmlc',
\ 'cmdopt': '-static-link-runtime-shared-libraries -debug=true',
\ }
