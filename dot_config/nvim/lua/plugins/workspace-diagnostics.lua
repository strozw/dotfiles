---@type LazySpec
return {
  "artemave/workspace-diagnostics.nvim",
  keys = {
    {
      "<leader>cx",
      function()
        for _, client in ipairs(vim.lsp.buf_get_clients()) do
          require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
        end
      end,
      desc = "Diagnostics (Workspace Diagnostics)",
    },

  }
}
