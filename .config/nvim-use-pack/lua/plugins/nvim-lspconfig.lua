vim.pack.add({
  -- deps
  "https://github.com/antosha417/nvim-lsp-file-operations",
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

local lspconfig = require 'lspconfig'

-- Set global defaults for all servers
lspconfig.util.default_config = vim.tbl_extend(
  'force',
  lspconfig.util.default_config,
  {
    capabilities = vim.tbl_deep_extend(
      "force",
      vim.lsp.protocol.make_client_capabilities(),
      -- returns configured operations if setup() was already called
      -- or default operations if not
      require 'lsp-file-operations'.default_capabilities()
    )
  }
)
