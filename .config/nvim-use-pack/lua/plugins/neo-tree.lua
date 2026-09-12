vim.pack.add({
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",

  'https://github.com/nvim-neo-tree/neo-tree.nvim',
})

require('neo-tree').setup({
  hide_root_node = true,
  default_component_configs = {
    indent = {
      padding = 1,
      -- with_markers = true
    },
    container = {
      right_padding = 1,
    },
  },
})

local wk = require("which-key")

wk.add({
  { '<leader>e', ':Neotree toggle<CR>', desc = 'Toggle NeoTree', noremap = true, silent = true, mode = 'n' },
})
