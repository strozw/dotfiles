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
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", mode = "n", silent = true },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", mode = "n", silent = true },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", mode = "n", silent = true },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", mode = "n", silent = true },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", mode = "n" },
      -- { "<c-h>", "<c-\\><C-n>:TmuxNavigateLeft<cr>", mode = "t" },
      -- { "<c-j>", "<c-\\><C-n>:TmuxNavigateDown<cr>", mode = "t" },
      -- { "<c-k>", "<c-\\><C-n>:TmuxNavigateUp<cr>", mode = "t" },
      -- { "<c-l>", "<c-\\><C-n>:TmuxNavigateRight<cr>", mode = "t" },
    },
  },
  -- {
  --   "aserowy/tmux.nvim",
  --   opts = {},
  -- },
}
