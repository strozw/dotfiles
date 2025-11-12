---@module 'lazy'
---@module 'render-markdown'

---@type LazyPlugin
---@diagnostic disable-next-line: missing-fields
return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  ft = { "markdown", "markdown.mdx", "Avante", "codecompanion" },
  ---@type render.md.UserConfig
  opts = {
    file_types = { "markdown", "Avanmte", "codecompanion" },
    completions = { lsp = { enabled = true } },
    code = {
      enabled = true,
      render_modes = false,
      sign = true,
      conceal_delimiters = true,
      language = true,
      position = 'left',
      language_icon = true,
      language_name = true,
      language_info = true,
      language_pad = 0,
      disable_background = { 'diff' },
      width = 'full',
      left_margin = 0,
      left_pad = 0,
      right_pad = 0,
      min_width = 0,
      border = 'hide',
      language_border = '█',
      language_left = '',
      language_right = '',
      above = '▄',
      below = '▀',
      inline = true,
      inline_left = '',
      inline_right = '',
      inline_pad = 0,
      highlight = 'RenderMarkdownCode',
      highlight_info = 'RenderMarkdownCodeInfo',
      highlight_language = nil,
      highlight_border = 'RenderMarkdownCodeBorder',
      highlight_fallback = 'RenderMarkdownCodeFallback',
      highlight_inline = 'RenderMarkdownCodeInline',
      style = 'full',
    },
  },
}
