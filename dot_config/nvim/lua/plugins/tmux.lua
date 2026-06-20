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
      { "<c-h>", "<CMD>TmuxNavigateLeft<CR>",             mode = { "n" }, silent = true },
      { "<c-j>", "<CMD>TmuxNavigateDown<CR>",             mode = { "n" }, silent = true },
      { "<c-k>", "<CMD>TmuxNavigateUp<CR>",               mode = { "n" }, silent = true },
      { "<c-l>", "<CMD>TmuxNavigateRight<CR>",            mode = { "n" }, silent = true },
      -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>",    mode = "n",     silent = true },

      { "<c-h>", "<C-\\><C-n><CMD>TmuxNavigateLeft<CR>",  mode = { "t" }, silent = true },
      { "<c-j>", "<C-\\><C-n><CMD>TmuxNavigateDown<CR>",  mode = { "t" }, silent = true },
      { "<c-k>", "<C-\\><C-n><CMD>TmuxNavigateUp<CR>",    mode = { "t" }, silent = true },
      { "<c-l>", "<C-\\><C-n><CMD>TmuxNavigateRight<CR>", mode = { "t" }, silent = true },
    },
    config = function()
      -- vim-tmux-navigator の default keymap を無効化
      vim.g.tmux_navigator_no_mappings = 1
    end,
  },
  -- {
  --   "alexghergh/nvim-tmux-navigation",
  --   config = function()
  --     local nvim_tmux_nav = require('nvim-tmux-navigation')
  --
  --     nvim_tmux_nav.setup {
  --       -- disable_when_zoomed = true -- defaults to false
  --     }
  --
  --     vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
  --     vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
  --     vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
  --     vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
  --
  --     vim.keymap.set('t', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
  --     vim.keymap.set('t', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
  --     vim.keymap.set('t', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
  --     vim.keymap.set('t', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
  --   end
  -- }
}
