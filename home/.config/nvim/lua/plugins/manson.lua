return {
  {
    "williamboman/mason.nvim",
    opts = {
      -- registries = {
      --   "file:~/ghq/github.com/strozw/mason-registry",
      -- },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {},
      automatic_installation = false,
    },
  },
}
