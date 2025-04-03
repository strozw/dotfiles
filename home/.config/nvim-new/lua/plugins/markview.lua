---@module 'markview'

return {
  enabled = false,
  "OXY2DEV/markview.nvim",
  branch = "dev",
  lazy = false,
  ft = { "markdown", "markdown.mdx", "Avante", "codecompanion" },
  ---@type mkv.config
  opts = {
    preview = {
      filetypes = { "markdown", "Avanmte", "codecompanion" },
    },
  },
}
