---@type LazySpec
return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  lazy = false,
  keys = {
    {
      "<C-n>",
      ":BufferNext<CR>",
      desc = "Buffer Line Cycle [N]ext",
      silent = true,
    },
    {
      "<leader>bn",
      ":BufferNext<CR>",
      desc = "[B]uffer Line Cycle [N]ext",
      silent = true,
    },
    {
      "<C-p>",
      ":BufferPrevious<CR>",
      desc = "Buffer Line Cycle [P]rev",
      silent = true,
    },
    {
      "<leader>bp",
      ":BufferPrevious<CR>",
      desc = "[B]uffer Line Cycle [P]rev",
      silent = true,
    },
  },
  config = function()
    vim.opt.termguicolors = true

    local bufferline = require('bufferline')
    bufferline.setup {

    }
  end,
}
