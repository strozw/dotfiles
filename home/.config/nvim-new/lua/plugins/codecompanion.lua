return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "Davidyz/VectorCode",
      {
        "ravitemer/mcphub.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim", -- Required for Job and HTTP requests
        },
        build = "npm install -g mcp-hub@latest", -- Installs required mcp-hub npm module
        config = function()
          require("mcphub").setup({
            -- Required options
            port = 9999, -- Port for MCP Hub server

            config = vim.fn.expand("~/mcpservers.json"), -- Absolute path to config file

            -- Optional options
            on_ready = function(hub)
              -- Called when hub is ready
            end,

            on_error = function(err)
              -- Called on errors
            end,

            shutdown_delay = 0, -- Wait 0ms before shutting down server after last client exits

            log = {
              level = vim.log.levels.WARN,
              to_file = false,
              file_path = nil,
              prefix = "MCPHub",
            },
          })
        end,
      },
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          -- Change the default chat adapter
          chat = {
            adapter = "copilot",
            slash_commands = {
              codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
            },
            tools = {
              vectorcode = {
                description = "Run VectorCode to retrieve the project context.",
                callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
              },
              mcp = {
                callback = require("mcphub.extensions.codecompanion"),
                description = "Call tools and resources from the MCP Servers",
                opts = {
                  -- user_approval = true,
                  requires_approval = true,
                },
              },
            },
          },
          inline = {
            adapter = "copilot",
          },
        },
        opts = {
          -- Set debug logging
          log_level = "DEBUG",
        },
      })
    end,
  },
}
