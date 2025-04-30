return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>",    mode = "n", silent = true },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>",    mode = "n", silent = true },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>",      mode = "n", silent = true },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>",   mode = "n", silent = true },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", mode = "n", silent = true },
      { "<c-h>", "<C-\\><C-n>:TmuxNavigateLeft<cr>",  mode = "t", silent = true },
      { "<c-j>", "<C-\\><C-n>:TmuxNavigateDown<cr>",  mode = "t", silent = true },
      { "<c-k>", "<C-\\><C-n>:TmuxNavigateUp<cr>",    mode = "t", silent = true },
      { "<c-l>", "<C-\\><C-n>:TmuxNavigateRight<cr>", mode = "t", silent = true },
    },
  },
  -- {
  --   "aserowy/tmux.nvim",
  --   opts = {},
  -- },
}
