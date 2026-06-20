---@type LazySpec
return {
  "mrcjkb/rustaceanvim",
  version = "^9",
  lazy = false,
  ft = "rust",
  config = function()
    vim.g.rustaceanvim = function()
      return {
        server = {
          on_attach = function(client, bufnr)
            vim.keymap.set(
              "n",
              "<leader>ca",
              function()
                vim.cmd.RustLsp("codeAction")
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "<leader>cha",
              function()
                vim.cmd.RustLsp({ "hover", "actions" })
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "<leader>chr",
              function()
                vim.cmd.RustLsp({ "hover", "range" })
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "]e",
              function()
                vim.cmd.RustLsp({ 'explainError', 'cycle' })
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "[e",
              function()
                vim.cmd.RustLsp({ 'explainError', 'cycle_prev' })
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "]E",
              function()
                vim.cmd.RustLsp({ 'renderDiagnostic', 'cycle' })
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "[E",
              function()
                vim.cmd.RustLsp({ 'renderDiagnostic', 'cycle_prev' })
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "gE",
              function()
                vim.cmd.RustLsp('relatedDiagnostics')
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "gT",
              function()
                vim.cmd.RustLsp('relatedTests')
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "gC",
              function()
                vim.cmd.RustLsp('openCargo')
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "gH",
              function()
                vim.cmd.RustLsp('openDocs')
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "gP",
              function()
                vim.cmd.RustLsp('parentModule')
              end,
              { silent = true, buffer = bufnr }
            )

            vim.keymap.set(
              "n",
              "J",
              function()
                vim.cmd.RustLsp('joinLines')
              end,
              { silent = true, buffer = bufnr }
            )
          end
        }
      }
    end
  end,
}
