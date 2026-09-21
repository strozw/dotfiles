-- enable experimental lua loader
vim.loader.enable()

require('vim._core.ui2').enable({
  msg = {
    targets = {
      default = "msg",
    },
    msg = { height = 100 },
  },
})

require('./options')

require('./plugins')

require('./lsp')

require('./keymaps')
