return {
  {
    "folke/tokyonight.nvim",
    dependencies = {
      { "mvllow/modes.nvim" },
    },
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("tokyonight").setup({
        on_highlights = function(hl, c)
          -- local prompt = "#2d3149"
          local prompt = c.bg_dark
          local bg_float2 = c.bg_dark
          local bg_float3 = c.bg_dark

          hl.TelescopeNormal = { bg = c.bg_dark, fg = c.fg_dark }
          hl.TelescopeBorder = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopePromptNormal = { bg = prompt }
          hl.TelescopePromptBorder = { bg = prompt, fg = prompt }
          hl.TelescopePromptTitle = { bg = prompt, fg = prompt }
          hl.TelescopePreviewTitle = { bg = c.bg_dark, fg = c.bg_dark }
          hl.TelescopeResultsTitle = { bg = c.bg_dark, fg = c.bg_dark }

          -- Telescope
          hl.TelescopeNormal = { fg = c.fg, bg = bg_float2 }
          hl.TelescopeTitle = { fg = bg_float2, bg = c.blue }
          hl.TelescopeBorder = { fg = bg_float2, bg = bg_float2 }
          hl.TelescopePromptNormal = { fg = c.fg, bg = prompt }
          hl.TelescopePromptTitle = { fg = c.fg, bg = c.bg_dark }
          hl.TelescopePromptBorder = { fg = prompt, bg = prompt }
          hl.TelescopePreviewNormal = { fg = c.fg, bg = bg_float3 }
          hl.TelescopePreviewBorder = { fg = bg_float3, bg = bg_float3 }

          -- Snacks.picker
          hl.SnacksPicker = { fg = c.fg, bg = bg_float2 }
          hl.SnacksPickerTitle = { fg = bg_float2, bg = c.blue }
          hl.SnacksPickerBorder = { fg = bg_float2, bg = bg_float2 }
          hl.SnacksPickerInput = { fg = c.fg, bg = prompt }
          hl.SnacksPickerInputTitle = { fg = c.fg, bg = c.bg_dark }
          hl.SnacksPickerInputBorder = { fg = prompt, bg = prompt }
          hl.SnacksPickerPreview = { fg = c.fg, bg = bg_float3 }
          hl.SnacksPickerPreviewBorder = { fg = bg_float3, bg = bg_float3 }

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
      })
    end,
  },
}
