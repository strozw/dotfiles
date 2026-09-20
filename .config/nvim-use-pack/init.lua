-- enable experimental lua loader
vim.loader.enable()

require('vim._core.ui2').enable({})

require('./options')

require('./plugins')

require('./autocmds')

require('./lsp')

require('./keymaps')
