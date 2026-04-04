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
          markdown = { "prettierd", lsp_format = "fallback" },
          yaml = { "prettierd", lsp_format = "fallback" },
          css = { "prettierd", lsp_format = "fallback" },
          html = { "prettierd", lsp_format = "fallback" },
          json = { "prettierd", lsp_format = "fallback" },
          jsonc = { "prettierd", lsp_format = "fallback" },
          javascript = { "prettierd", lsp_format = "fallback", filter = not_vtsls },
          typescript = { "prettierd", lsp_format = "fallback", filter = not_vtsls },
          javascriptreact = { "prettierd", lsp_format = "fallback", filter = not_vtsls },
          typescriptreact = { "prettierd", lsp_format = "fallback", filter = not_vtsls },
        },
      })
    end,
  },
}
