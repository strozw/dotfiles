
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" context_filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"g:context_filetype#filetypes['ghmarkdown'] = g:context_filetype#filetypes['markdown']
"let g:context_filetype#filetypes = {
"\ 'html': [
"\   {
"\    'start':
"\     '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)>',
"\    'end': '</script>', 'filetype': 'javascript',
"\   },
"\   {
"\    'start':
"\     '<script>',
"\    'end': '</script>', 'filetype': 'javascript',
"\   },
"\   {
"\    'start': '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)>',
"\    'end': '</style>', 'filetype': 'css',
"\   },
"\   {
"\    'start': '<style>',
"\    'end': '</style>', 'filetype': 'css',
"\   },
"\   {
"\    'start': '<?php\?',
"\    'end': '?>', 'filetype': 'php',
"\   }
"\ ],
"\ 'vue': [
"\   {
"\    'start': '<script\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
"\    'end': '</script>', 'filetype': '\1',
"\   },
"\   {
"\    'start': '<script>',
"\    'end': '</script>', 'filetype': 'javascript',
"\   },
"\   {
"\    'start': '<style\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
"\    'end': '</style>', 'filetype': '\1',
"\   },
"\   {
"\    'start': '<style>',
"\    'end': '</style>', 'filetype': 'css',
"\   },
"\   {
"\    'start': '<template\%[^>]*lang="\%([^>]*\)"\%[^>]*>',
"\    'end': '</template>', 'filetype': '\1',
"\   },
"\   {
"\    'start': '<template>',
"\    'end': '</template>', 'filetype': 'html',
"\   },
"\ ],
"\}


