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
    refresh = {          -- sets how often lualine should refresh it's contents (in ms)
      statusline = 100,  -- The refresh option sets minimum time that lualine tries
      tabline = 100,     -- to maintain between refresh. It's not guarantied if situation
      winbar = 100,      -- arises that lualine needs to refresh itself before this time it'll do it.
      refresh_time = 16, -- ~60fps the time after which refresh queue is processed. Mininum refreshtime for lualine
      events = {         -- The auto command events at which lualine refreshes
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
    -- lualine_x defaults to { 'encoding', 'fileformat', 'filetype' }; the copilot
    -- indicator is appended so it sits to the right of the filetype.
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
