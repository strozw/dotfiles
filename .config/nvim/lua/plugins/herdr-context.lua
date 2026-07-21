return {
  "makyinmars/herdr-context.nvim",
  cond = vim.env.HERDR_ENV == "1",
  lazy = false, -- keeps :checkhealth herdr-context discoverable before the first mapping
  opts = {},
  keys = {
    {
      "<leader>hc",
      function()
        require("herdr-context").compose()
      end,
      mode = { "n", "v" },
      desc = "Compose Herdr Context",
    },
    {
      "<leader>hay",
      function()
        require("herdr-context").reference()
      end,
      mode = { "n", "v" },
      desc = "Send Reference to Herdr Agent",
    },
    {
      "<leader>haY",
      function()
        require("herdr-context").send()
      end,
      mode = { "n", "v" },
      desc = "Send Context to Herdr Agent",
    },
    {
      "<leader>had",
      function()
        require("herdr-context").diagnostics()
      end,
      mode = { "n", "v" },
      desc = "Send Diagnostics to Herdr Agent",
    },
    {
      "<leader>hat",
      function()
        require("herdr-context").select_target()
      end,
      desc = "Select Herdr Agent",
    },
    {
      "<leader>ha",
      function()
        require("herdr-context").agents()
      end,
      desc = "Toggle Herdr Agents",
    },
    {
      "<leader>har",
      function()
        require("herdr-context").refresh()
      end,
      desc = "Refresh Herdr Agents",
    },
  },
}
