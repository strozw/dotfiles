---@type LazySpec
return {
  {
    "dmmulroy/ts-error-translator.nvim",
    config = function()
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
    end,
  },
}
