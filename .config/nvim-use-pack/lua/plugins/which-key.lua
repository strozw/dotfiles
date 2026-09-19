vim.pack.add({
  'https://github.com/folke/which-key.nvim',
})

local wk = require('which-key')

wk.setup({
  -- triggers_blacklist = {
  --   n = { "d", "y" }
  -- }
})
