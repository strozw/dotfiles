vim.pack.add({
  "https://github.com/dmmulroy/ts-error-translator.nvim"
})

require("ts-error-translator").setup({
  auto_attach = false,
  servers = {
    "astro",
    "svelte",
    "ts_ls",
    "typescript-tools",
    "volar",
    "vtsls",
  }
})
