return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "Davidyz/VectorCode",
    },
    opts = {
      options = {
        component_separators = "",
        section_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = {
          "progress",
          require("vectorcode.integrations").lualine(opts),
        },
        lualine_z = { "location" },
      },
    },
  },
}
