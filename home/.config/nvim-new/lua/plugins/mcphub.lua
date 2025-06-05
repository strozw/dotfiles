return {
  {
    "ravitemer/mcphub.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",               -- Required for Job and HTTP requests
    },
    build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
    config = function()
      require("mcphub").setup()
    end,
  },
}
