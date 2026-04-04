---@module "conform"

local function not_vtsls(client)
  return client.name ~= "vtsls"
end

---@type LazySpec
return {
  { -- Autoformat
    "stevearc/conform.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
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
            timeout_ms = 1000,
            lsp_format = lsp_format_opt, 
            async = false,
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
            cwd = require("conform.util").root_file({
              "oxfmt.config.ts",
              ".oxfmtrc.json",
              ".oxfmtrc.jsonc",
            }),
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
          -- javascript = { "prettierd", "prettier" },
          -- lua = { "stylua" },
          markdown = { "oxfmt", "prettierd", lsp_format = "fallback" },
          yaml = { "oxfmt", "prettierd", lsp_format = "fallback" },
          css = { "oxfmt", "prettierd", lsp_format = "fallback" },
          html = { "oxfmt", "prettierd", lsp_format = "fallback" },
          json = { "oxfmt", "prettierd", lsp_format = "fallback" },
          jsonc = { "oxfmt", "prettierd", lsp_format = "fallback" },
          javascript = { "oxfmt", "prettierd", lsp_format = "fallback", filter = not_vtsls },
          typescript = { "oxfmt", "prettierd", lsp_format = "fallback", filter = not_vtsls },
          javascriptreact = { "oxfmt", "prettierd", lsp_format = "fallback", filter = not_vtsls },
          typescriptreact = { "oxfmt", "prettierd", lsp_format = "fallback", filter = not_vtsls },
        },
      })
    end,
  },
}
