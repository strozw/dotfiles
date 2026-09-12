vim.pack.add({
  'https://github.com/folke/which-key.nvim',
})

wk = require('which-key')

wk.setup {}

wk.add({
  -- {
  --   "<leader>N",
  --   desc = "Neovim News",
  --   function()
  --     Snacks.win({
  --       file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
  --       width = 0.6,
  --       height = 0.6,
  --       wo = {
  --         spell = false,
  --         wrap = false,
  --         signcolumn = "yes",
  --         statuscolumn = " ",
  --         conceallevel = 3,
  --       },
  --     })
  --   end,
  -- },

  --------------------------------------------------------------------------------------------------
  -- Native Feature Keymaps
  --------------------------------------------------------------------------------------------------
  { '<Esc><Esc>',          function() vim.cmd('noh') end,     desc = "no hilight search", },

  -- Use <Esc> to exit terminal mode
  { '<Esc>',               '<C-\\><C-n>',                     desc = "Exit terminal mode",      mode = { 't', } },

  -- Map <C-n>, <C-p> to buffer navigation in insert mode
  -- { '<C-n>',               function() vim.cmd('BufferNext') end, desc = "Next buffer",             mode = { 'n', } },
  -- { '<C-p>',               function() vim.cmd('BufferPrev') end, desc = "Previous buffer",         mode = { 'n', } },

  -- Map [b, ]b to buffer navigation in normal mode
  -- { ']b',                  function() vim.cmd('BufferNext') end, desc = "Next buffer",             mode = { 'n', } },
  -- { '[b',                  function() vim.cmd('BufferPrev') end, desc = "Previous buffer",         mode = { 'n', } },

  -- Map [<Tab>, ]<Tab> to buffer navigation in normal mode
  { ']<Tab>',              function() vim.cmd('tabnext') end, desc = "Next buffer",             mode = { 'n', } },
  { '[<Tab>',              function() vim.cmd('tabprev') end, desc = "Previous buffer",         mode = { 'n', } },

  -- Map <C-j>, <C-k>, <C-h>, <C-l> to navigate between windows in any modes
  { '<C-h>',               '<C-\\><C-n><C-w>h',               desc = "Go to the left window",   mode = { 't', 'i' }, },
  { '<C-j>',               '<C-\\><C-n><C-w>j',               desc = "Go to the bottom window", mode = { 't', 'i' }, },
  { '<C-k>',               '<C-\\><C-n><C-w>k',               desc = "Go to the top window",    mode = { 't', 'i' }, },
  { '<Cvim.hl.on_yank-l>', '<C-\\><C-n><C-w>l',               desc = "Go to the right window",  mode = { 't', 'i' }, },
  { '<C-h>',               '<C-w>h',                          desc = "Go to the left window",   mode = { 'n' }, },
  { '<C-j>',               '<C-w>j',                          desc = "Go to the bottom window", mode = { 'n' }, },
  { '<C-k>',               '<C-w>k',                          desc = "Go to the top window",    mode = { 'n' }, },
  { '<C-l>',               '<C-w>l',                          desc = "Go to the right window",  mode = { 'n' }, },

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
