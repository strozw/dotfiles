vim.pack.add({
  'https://github.com/akinsho/bufferline.nvim'
})

vim.opt.termguicolors = true

local bufferline = require('bufferline')

bufferline.setup({
  options = {
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
