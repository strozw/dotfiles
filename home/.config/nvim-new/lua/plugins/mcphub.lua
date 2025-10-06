return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
    },
    build = "npm install -g mcp-hub@latest",
    config = function()
      require("mcphub").setup({
        workspace = {
          enabled = true, -- Default: true
          look_for = { ".mcp.json", ".mcphub/servers.json", ".vscode/mcp.json", ".cursor/mcp.json" },
          reload_on_dir_changed = true,
          port_range = { min = 40000, max = 41000 },
          get_port = nil, -- Optional custom port function
        },
      })
    end,
  },
}
