---@module "codecompanion"

return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- "Davidyz/VectorCode",
      "ravitemer/mcphub.nvim",
    },
    keys = {
      {
        "<Space>ai",
        ":CodeCompanion<CR>",
        mode = { "n", "v" },
        silent = true,
      },
      {
        "<Space>ac",
        ":CodeCompanionChat<CR>",
        mode = { "n", "v" },
        silent = true,
      },
      {
        "<Space>aa",
        ":CodeCompanionAction<CR>",
        mode = { "n", "v" },
        silent = true,
      },
    },
    config = function()
      require("codecompanion").setup({
        adapters = {
          copilot_sonnet35 = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-3.5-sonnet",
                },
              },
            })
          end,

          copilot_sonnet = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-3.7-sonnet",
                },
              },
            })
          end,

          copilot_sonnet_thought = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "claude-3.7-sonnet-thought",
                },
              },
            })
          end,

          copilot_gemini = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "gemini-2.0-flash-001",
                },
              },
            })
          end,

          copilot_gpt_4_1 = function()
            return require("codecompanion.adapters").extend("copilot", {
              schema = {
                model = {
                  default = "gpt-4.1",
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "copilot",
            slash_commands = {
              -- codebase = require("vectorcode.integrations").codecompanion.chat.make_slash_command(),
            },
            tools = {
              -- vectorcode = {
              --   description = "Run VectorCode to retrieve the project context.",
              --   callback = require("vectorcode.integrations").codecompanion.chat.make_tool(),
              -- },
              mcp = {
                callback = require("mcphub.extensions.codecompanion"),
                description = "Call tools and resources from the MCP Servers",
                opts = {
                  -- user_approval = true,
                  requires_approval = true,
                },
              },
            },
            roles = {
              llm = function(adapter)
                return "  CodeCompanion (" .. adapter.formatted_name .. ")"
              end,
              user = "  Me",
            },
          },
          inline = {
            adapter = "copilot",
          },
        },
        opts = {
          language = "japanese",
          log_level = "DEBUG",
        },
        display = {
          chat = {
            auto_scroll = false,
            show_header_separator = true,
          },
        },
      })
    end,
  },
}
