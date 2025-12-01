return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "stevearc/overseer.nvim",
      "milanglacier/minuet-ai.nvim",
      -- "Davidyz/VectorCode",
      "leisurelicht/lualine-copilot.nvim",
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
            require("minuet.lualine"),
          },
          -- lualine_y = {
          --   "progress",
          --   require("vectorcode.integrations").lualine(),
          -- },
          lualine_z = {
            "location",
            require("opencode").statusline,
          }
        },
      })
    end,
  },
}
