-- hello
return {
  {
    "dmmulroy/ts-error-translator.nvim",
    opts = {
      -- Auto-attach to LSP servers for TypeScript diagnostics (default: true)
      auto_attach = true,

      -- LSP server names to translate diagnostics for (default shown below)
      servers = {
        "astro",
        "svelte",
        "ts_ls",
        "tsserver", -- deprecated, use ts_ls
        "typescript-tools",
        "volar",
        "vtsls",
      },
    }
  },
}
