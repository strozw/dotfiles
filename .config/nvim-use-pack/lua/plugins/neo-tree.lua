vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",

  'https://github.com/nvim-neo-tree/neo-tree.nvim',
})

require('neo-tree').setup({
  -- hide_root_node = true,
  default_component_configs = {
    indent = {
      padding = 1,
      -- with_markers = true
    },
    container = {
      right_padding = 1,
    },
  },

  filesystem = {
    follow_current_file = {
      enabled = true,
      leave_dirs_open = false,
    },
  },
})

-- Keep NeoTree out of sessions (including `:restart`); it would be restored as an empty buffer.
vim.api.nvim_create_autocmd('SessionWritePre', {
  group = vim.api.nvim_create_augroup('NeoTreeCloseBeforeSession', { clear = true }),
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'neo-tree' then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end,
})
