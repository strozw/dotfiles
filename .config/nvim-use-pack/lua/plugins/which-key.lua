vim.pack.add({
  'https://github.com/folke/which-key.nvim',
})

wk = require('which-key')

wk.setup {}

wk.add({
  --------------------------------------------------------------------------------------------------
  -- Native Feature Keymaps
  --------------------------------------------------------------------------------------------------
  { '<Esc><Esc>', function() vim.cmd('noh') end,     desc = "no hilight search", },

  -- Use <Esc> to exit terminal mode
  { '<Esc>',      '<C-\\><C-n>',                     desc = "Exit terminal mode", mode = { 't', } },

  -- Map [<Tab>, ]<Tab> to buffer navigation in normal mode
  { ']<Tab>',     function() vim.cmd('tabnext') end, desc = "Next Tab",           mode = { 'n', } },
  { '[<Tab>',     function() vim.cmd('tabprev') end, desc = "Previous Tab",       mode = { 'n', } },

  -- Map <Up>, <Down> to select completion item
  -- {
  --   '<Down>',
  --   function() return vim.fn.pumvisible() == 1 and '<C-n>' or '<Down>' end,
  --   desc = "Select next completion item",
  --   expr = true,
  --   noremap = true,
  --   mode = { 'i', 'c' }
  -- },
  -- {
  --   '<Up>',
  --   function() return vim.fn.pumvisible() == 1 and '<C-p>' or '<Up>' end,
  --   desc = "Select prev completion item",
  --   expr = true,
  --   noremap = true,
  --   mode = { 'i', 'c' }
  -- },

  -- LSP inline completion accept
  {
    '<Tab>',
    function()
      if not vim.lsp.inline_completion.get() then
        return '<Tab>'
      end
    end,
    expr = true,
    desc = 'Accept the current inline completion',
    mode = { 'i' }
  },

  -- {
  --   '<Tab>',
  --   function()
  --     return vim.snippet.active({ direction = 1 }) and '<cmd>lua vim.snippet.jump(1)<cr>' or '<Tab>'
  --   end,
  --   expr = true,
  --   mode = { 'i', 's' },
  -- },
  --
  -- {
  --   '<S-Tab>',
  --   function()
  --     return vim.snippet.active({ direction = -1 }) and '<cmd>lua vim.snippet.jump(-1)<cr>' or '<S-Tab>'
  --   end,
  --   expr = true,
  --   mode = { 'i', 's' },
  -- },

  { "<leader>bd", function() vim.cmd('BufferDelete') end, desc = "Delete Buffer" },
})
