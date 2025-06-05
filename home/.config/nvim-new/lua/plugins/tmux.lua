return {
  {
    "christoomey/vim-tmux-navigator",
    dependencies = {
      "folke/which-key.nvim"
    },
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<CMD>TmuxNavigateLeft<CR>",  mode = { "n", "t" }, silent = true },
      { "<c-j>", "<CMD>TmuxNavigateDown<CR>",  mode = { "n", "t" }, silent = true },
      { "<c-k>", "<CMD>TmuxNavigateUp<CR>",    mode = { "n", "t" }, silent = true },
      { "<c-l>", "<CMD>TmuxNavigateRight<CR>", mode = { "n", "t" }, silent = true },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", mode = "n", silent = true },

      -- { "<c-h>", "<C-\\><C-n>:TmuxNavigateLeft<cr>",  mode = "t", silent = true },
      -- { "<c-j>", "<C-\\><C-n>:TmuxNavigateDown<cr>",  mode = "t", silent = true },
      -- { "<c-k>", "<C-\\><C-n>:TmuxNavigateUp<cr>",    mode = "t", silent = true },
      -- { "<c-l>", "<C-\\><C-n>:TmuxNavigateRight<cr>", mode = "t", silent = true },
    },
  },
  -- {
  --   "aserowy/tmux.nvim",
  --   opts = {},
  -- },
}
