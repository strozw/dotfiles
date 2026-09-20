vim.pack.add({
  'https://github.com/mvllow/modes.nvim',

  'https://github.com/folke/tokyonight.nvim'
})

require("tokyonight").setup({
  on_colors = function(c)
  end,
  on_highlights = function(hl, c)
    local prompt = c.bg_dark
    local bg_float2 = c.bg_dark
    local bg_float3 = c.bg_dark

    hl.WinSeparator = { fg = c.bg_dark }

    -- Telescope
    hl.TelescopeNormal = { fg = c.fg, bg = bg_float2 }
    hl.TelescopeTitle = { fg = bg_float2, bg = c.magenta }
    hl.TelescopeBorder = { fg = bg_float2, bg = bg_float2 }
    hl.TelescopePromptNormal = { fg = c.fg, bg = prompt }
    hl.TelescopePromptTitle = { fg = c.fg, bg = c.bg_dark }
    hl.TelescopePromptBorder = { fg = prompt, bg = prompt }
    hl.TelescopePreviewNormal = { fg = c.fg, bg = bg_float3 }
    hl.TelescopePreviewBorder = { fg = bg_float3, bg = bg_float3 }

    -- neo-tree
    hl.NeoTreeGitUntracked = { fg = c.comment, bg = c.bg_dark }
    hl.NeoTreeGitModified = { fg = c.yellow, bg = c.bg_dark }

    -- tiny-cmdline
    hl.TinyCmdlineBorder = { fg = c.bg_dark }
    hl.TinyCmdlineNormal = { bg = c.bg_dark }

    -- Incremental Hilight Color (on yank and search)
    hl.IncSearch = { fg = c.bg_dark, bg = c.bg_visual }

    -- カーソル行のハイライトを有効化
    vim.opt.cursorline = true
  end,
})

vim.cmd([[colorscheme tokyonight-night]])
