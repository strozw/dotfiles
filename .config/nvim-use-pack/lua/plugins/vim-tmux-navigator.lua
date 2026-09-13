vim.pack.add({
  "http://github.com/christoomey/vim-tmux-navigator"
})

-- vim-tmux-navigator の default keymap を無効化
vim.g.tmux_navigator_no_mappings = 1

local wk = require("which-key")

wk.add({
  { "<c-h>", "<CMD>TmuxNavigateLeft<CR>",             mode = { "n" }, silent = true },
  { "<c-j>", "<CMD>TmuxNavigateDown<CR>",             mode = { "n" }, silent = true },
  { "<c-k>", "<CMD>TmuxNavigateUp<CR>",               mode = { "n" }, silent = true },
  { "<c-l>", "<CMD>TmuxNavigateRight<CR>",            mode = { "n" }, silent = true },
  -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>",    mode = "n",     silent = true },

  { "<c-h>", "<C-\\><C-n><CMD>TmuxNavigateLeft<CR>",  mode = { "t" }, silent = true },
  { "<c-j>", "<C-\\><C-n><CMD>TmuxNavigateDown<CR>",  mode = { "t" }, silent = true },
  { "<c-k>", "<C-\\><C-n><CMD>TmuxNavigateUp<CR>",    mode = { "t" }, silent = true },
  { "<c-l>", "<C-\\><C-n><CMD>TmuxNavigateRight<CR>", mode = { "t" }, silent = true },
})

-- for herder
dofile(vim.fn.expand("~/ghq/github.com/paulbkim-dev/vim-herdr-navigation/editor/nvim.lua"))
