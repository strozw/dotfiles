-- enable experimental lua loader
vim.loader.enable()

-- enable ui2
require('vim._core.ui2').enable({})

-- options
require('./options')

-- autocmds settigns
require('./autocmds')

-- load plugins
require('./plugins')

-- lsp settigns
require('./lsp')

require('./keymaps')
