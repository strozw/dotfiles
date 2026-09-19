vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.nvim', version = 'stable' },
})

require('mini.bufremove').setup()
require('mini.indentscope').setup({
  symbol = '│',
})

vim.api.nvim_create_user_command(
  'Bufdelete',
  function()
    MiniBufremove.delete()
  end,
  { desc = 'Remove buffer' }
)
