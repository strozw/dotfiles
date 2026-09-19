vim.pack.add({
  'https://github.com/akinsho/bufferline.nvim'
})

vim.opt.termguicolors = true

local bufferline = require('bufferline')

bufferline.setup({
  options = {
    indicator = {
      icon = '▎', -- this should be omitted if indicator style is not 'icon'
      -- style = 'icon',
    },
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = false
      }
    },
    custom_filter = function(buf_number, _buf_numbers)
      if vim.bo[buf_number].filetype ~= "neo-tree" then
        return true
      end
    end,
  },
})
