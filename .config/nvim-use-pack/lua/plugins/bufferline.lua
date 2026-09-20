vim.pack.add({
  'https://github.com/akinsho/bufferline.nvim'
})

vim.opt.termguicolors = true

local bufferline = require('bufferline')

bufferline.setup({
  options = {
    -- always_show_bufferline = false,
    indicator = {
      icon = '▎',
      style = 'icon',
    },
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = false
      }
    },
  },
})
