vim.pack.add({
  'https://github.com/folke/tokyonight.nvim'
})

require("tokyonight").setup({
  on_colors = function(c)
    local prompt = c.bg_dark
    local bg_float2 = c.bg_dark
    local bg_float3 = c.bg_dark

    vim.api.nvim_set_hl(0, "WinSeparator", { fg = c.bg_dark })

    -- Telescope
    vim.api.nvim_set_hl(0, "TelescopeNormal", { fg = c.fg, bg = bg_float2 })
    vim.api.nvim_set_hl(0, "TelescopeTitle", { fg = bg_float2, bg = c.blue })
    vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = bg_float2, bg = bg_float2 })
    vim.api.nvim_set_hl(0, "TelescopePromptNormal", { fg = c.fg, bg = prompt })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = c.fg, bg = c.bg_dark })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = prompt, bg = prompt })
    vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { fg = c.fg, bg = bg_float3 })
    vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = bg_float3, bg = bg_float3 })

    -- neo-tree
    vim.api.nvim_set_hl(0, "NeoTreeGitUntracked", { fg = c.comment, bg = c.bg_dark })
    vim.api.nvim_set_hl(0, "NeoTreeGitModified", { fg = c.yellow, bg = c.bg_dark })

    -- tiny-cmdline
    vim.api.nvim_set_hl(0, "TinyCmdlineBorder", { fg = c.bg_dark })
    vim.api.nvim_set_hl(0, "TinyCmdlineNormal", { bg = c.bg_dark })

    require("modes").setup({
      colors = {
        bg = "", -- Optional bg param, defaults to Normal hl group
        copy = c.yellow,
        delete = c.red,
        insert = c.blue,
        visual = c.magenta,
      },

      -- Set opacity for cursorline and number background
      line_opacity = 0.3,

      -- Enable cursor highlights
      set_cursor = true,

      -- Enable cursorline initially, and disable cursorline for inactive windows
      -- or ignored filetypes
      set_cursorline = true,

      -- Enable line number highlights to match cursorline
      set_number = true,

      -- Disable modes highlights in specified filetypes
      -- Please PR commonly ignored filetypes
      ignore = { "NvimTree", "TelescopePrompt", "snacks_picker_list" },
    })
  end,
  on_highlights = function(hl, c)

  end,
})

vim.cmd([[colorscheme tokyonight-night]])
