vim.pack.add({
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
})

require('lualine').setup({
  options = {
    -- theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    always_show_tabline = true,
    refresh = {
      statusline = 100,
      tabline = 100,
      winbar = 100,
      refresh_time = 16,
      events = {
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    },
  },
  sections = {
    lualine_x = {
      'encoding',
      'fileformat',
      'filetype',
      {
        function()
          return '\u{ec1e} ' -- nf-cod-copilot
        end,
        cond = function()
          return #vim.lsp.get_clients({ bufnr = 0, name = 'copilot' }) > 0
        end,
      },
    },
  },
})
