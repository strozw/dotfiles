---@type LazySpec
return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  lazy = false,
  keys = {
    {
      "<C-n>",
      ":BufferNext<CR>",
      desc = "Buffer Line Cycle [N]ext",
      silent = true,
    },
    {
      "<leader>bn",
      ":BufferNext<CR>",
      desc = "[B]uffer Line Cycle [N]ext",
      silent = true,
    },
    {
      "<C-p>",
      ":BufferPrevious<CR>",
      desc = "Buffer Line Cycle [P]rev",
      silent = true,
    },
    {
      "<leader>bp",
      ":BufferPrevious<CR>",
      desc = "[B]uffer Line Cycle [P]rev",
      silent = true,
    },
  },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require("barbar").setup {
      animation = false,
      insert_at_start = true,
      auto_hide = false,
      sidebar_filetypes = {
        ["snacks_layout_box"] = { event = "BufWipeout" },
        Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
      },
      icons = {
        filetype = {
          custom_icons = false,
        },
        pinned = { button = "", filename = true },
      },
    }
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
