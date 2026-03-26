---@module "conform"

---@type LazySpec
return {
  { -- Autoformat
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>cf",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    ---@type conform.setupOpts
    config = function()
      require("conform").setup({
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt

          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = "never"
          else
            lsp_format_opt = "fallback"
          end

          return {
            timeout_ms = 500,
            lsp_format = lsp_format_opt,
          }
        end,
        formatters = {
          ["biome-check"] = {
            require_cwd = true,
          },
          prettierd = {
            require_cwd = true,
          },
          oxfmt = {
            require_cwd = true,
          },
          oxlint = {
            require_cwd = true,
            cwd = require("conform.util").root_file({
              "oxlint.config.ts",
              ".oxlintrc.json",
              ".oxlintrc.jsonc",
            }),
          }
        },
        formatters_by_ft = {
          -- You can use 'stop_after_first' to run the first available formatter from the list
          -- javascript = { "prettierd", "prettier", stop_after_first = true },
          -- lua = { "stylua" },
          markdown = { "oxlint", lsp_format = "fallback", stop_after_first = true },
          yaml = { "oxlint", lsp_format = "fallback", stop_after_first = true },
          css = { "oxfmt", "oxlint", lsp_format = "fallback", stop_after_first = true },
          html = { "oxlint", lsp_format = "fallback", stop_after_first = true },
          json = { "oxlint", lsp_format = "fallback", stop_after_first = true },
          jsonc = { "oxlint", lsp_format = "fallback", stop_after_first = true },
          javascript = { "oxfmt", "oxlint", lsp_format = "fallback", stop_after_first = true },
          typescript = { "oxfmt", "oxlint", lsp_format = "fallback", stop_after_first = true },
          javascriptreact = { "oxfmt", "oxlint", lsp_format = "fallback", stop_after_first = true },
          typescriptreact = { "oxfmt", "oxlint", lsp_format = "fallback", stop_after_first = true },
        },
      })
    end,
  },
}
