---@module 'lazy'
---@module 'render-markdown'

---@type LazyPlugin
---@diagnostic disable-next-line: missing-fields
return {
  enabled = false,
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ft = { "markdown", "markdown.mdx", "Avante", "codecompanion" },
  ---@type render.md.UserConfig
  opts = {
    file_types = { "markdown", "Avanmte", "codecompanion" },
  },
}
