return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/overseer.nvim",
      -- "leisurelicht/lualine-copilot.nvim",
    },
    config = function()
      require("lualine").setup({
        options = {
          component_separators = "",
          section_separators = "",
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = {
            "encoding",
            "fileformat",
            "filetype",
            "overseer",
            -- 'copilot',
          },
        },
      })
    end,
  },
}
