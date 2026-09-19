vim.pack.add({
  -- deps
  "https://github.com/b0o/SchemaStore.nvim",
  "https://github.com/williamboman/mason.nvim",
  "https://github.com/marilari88/twoslash-queries.nvim",

  -- Quickstart configs for LSP
  'https://github.com/neovim/nvim-lspconfig',
})

local mason = require 'mason'

mason.setup({
  -- "file:~/ghq/github.com/strozw/my-mason-registry",
  -- "github:mason-org/mason-registry",
})
