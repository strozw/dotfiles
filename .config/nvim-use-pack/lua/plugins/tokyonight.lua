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
    hl.IncSearch = { fg = c.bg_dark, bg = c.magenta }

    -- カーソル行のハイライトを有効化
    vim.opt.cursorline = true

    -- require("modes").setup({
    --   colors = {
    --     bg = "", -- Optional bg param, defaults to Normal hl group
    --     copy = c.magenta,
    --     delete = c.red,
    --     insert = c.cyan,
    --     visual = c.magenta,
    --   },
    --
    --   -- Set opacity for cursorline and number background
    --   line_opacity = 0.3,
    --
    --   -- Enable cursor highlights
    --   set_cursor = true,
    --
    --   -- Enable cursorline initially, and disable cursorline for inactive windows
    --   -- or ignored filetypes
    --   set_cursorline = true,
    --
    --   -- Enable line number highlights to match cursorline
    --   set_number = true,
    --
    --   -- Disable modes highlights in specified filetypes
    --   -- Please PR commonly ignored filetypes
    --   ignore = { "NvimTree", "TelescopePrompt", "snacks_picker_list" },
    -- })

    -- telescope's preview briefly enters Normal mode; modes.nvim's synchronous redraw there clamps the prompt cursor.
    -- for _, au in ipairs(vim.api.nvim_get_autocmds({ event = "ModeChanged" })) do
    --   local is_modes_reset = (au.pattern == "*:n" or au.pattern == "*:ni*")
    --     and type(au.callback) == "function"
    --     and debug.getinfo(au.callback, "S").source:find("modes.nvim/lua/modes.lua", 1, true)
    --   if is_modes_reset then
    --     local reset = au.callback
    --     vim.api.nvim_del_autocmd(au.id)
    --     vim.api.nvim_create_autocmd("ModeChanged", {
    --       pattern = au.pattern,
    --       callback = function(ev)
    --         vim.schedule(function()
    --           if vim.api.nvim_get_mode().mode:match("^n") then
    --             reset(ev)
    --           end
    --         end)
    --       end,
    --     })
    --   end
    -- end
  end,
})

vim.cmd([[colorscheme tokyonight-night]])
