vim.pack.add({
  -- formatter
  'https://github.com/stevearc/conform.nvim',
})

require("conform").setup({
  format_after_save = {
    lsp_format = "last",
  },
  formatters_by_ft = {
    lua = { lsp_format = "fallback" },
    -- rust = { lsp_format = "fallback" },
    -- Conform will run the first available formatter
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
})
