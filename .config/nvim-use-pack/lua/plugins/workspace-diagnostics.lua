vim.pack.add({
  "https://github.com/artemave/workspace-diagnostics.nvim"
})

wk.add({
  "<leader>cx",
  function()
    for _, client in ipairs(vim.lsp.buf_get_clients()) do
      require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
  end,
  desc = "Diagnostics (Workspace Diagnostics)",
})
