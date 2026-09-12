vim.pack.add({
  'https://github.com/akinsho/bufferline.nvim'
})

vim.opt.termguicolors = true

local bufferline = require('bufferline')

bufferline.setup({
  options = {
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        highlight = "Directory",
        separator = false
      }
    }
  }
})

local wk = require("which-key")

wk.add({
  { "<C-n>",      ":BufferLineCycleNext<CR>",   desc = "Buffer Line Cycle [N]ext",   silent = true, },
  { "<C-p>",      ":BufferLineCyclePrev<CR>",   desc = "Buffer Line Cycle [P]rev",   silent = true, },
  { ']b',         ":BufferLineCycleNext<CR>",   desc = "Next buffer",                mode = { 'n', } },
  { '[b',         ":BufferLineCyclePrev<CR>",   desc = "Previous buffer",            mode = { 'n', } },
  { "<leader>bn", ":BufferLineCycleNext<CR>",   desc = "[B]uffer Line Cycle [N]ext", silent = true, },
  { "<leader>bp", ":BufferLineCyclePrev<CR>",   desc = "[B]uffer Line Cycle [P]rev", silent = true, },
  { "<leader>bo", ":BufferLineCloseOthers<CR>", desc = "Close Other Buffers",        mode = "n",     silent = true, noremap = true, },
})
