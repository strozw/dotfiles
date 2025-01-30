return {
  {
    enabled = is_ai_enabled,
    "zbirenbaum/copilot.lua",
    opts = function(_, opts)
      opts.filetypes = opts.filetypes or {}

      local is_ai_enabled = require("utils").is_ai_enabled()

      opts.filetypes = vim.tbl_extend("force", opts.filetypes, {
        markdown = is_ai_enabled,
        help = false,
        ["."] = is_ai_enabled,
        ["*"] = is_ai_enabled,
      })
    end,
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp", -- Optional: For using slash commands and variables in the chat buffer
      "nvim-telescope/telescope.nvim", -- Optional: For using slash commands
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } }, -- Optional: For prettier markdown rendering
      { "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
    },
    config = function()
      require("codecompanion").setup({
        opts = {
          language = "Japanease",
        },
        strategies = {
          chat = {
            adapter = "copilot",
          },
          inline = {
            adapter = "copilot",
          },
        },
      })
    end,
  },
}
