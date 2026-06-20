---@type LazySpec
return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  ---@module "noice"
  ---@type NoiceConfig
  ---@diagnostic disable: missing-fields
  opts = {
    routes = {
      -- {
      --   -- skip showing "written" messages when writing a file
      --   filter = {
      --     event = "msg_show",
      --     find = ":checkhealth vim.deprecated",
      --   },
      --   opts = { skip = true },
      -- },
      {
        -- skip showing "written" messages when writing a file
        filter = {
          -- event = "msg_show",
          find = "No information available",
        },
        opts = { skip = true },
      }
    },

    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true,         -- use a classic bottom cmdline for search
      command_palette = true,       -- position the cmdline and popupmenu together
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false,           -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false,       -- add a border to hover docs and signature help
    },
    -- @see https://github.com/folke/noice.nvim/issues/1188
    -- cmdline = {
    --   format = {
    --     cmdline = { lang = "" },
    --     search_down = { lang = "" },
    --     search_up = { lang = "" },
    --     filter = { lang = "" },
    --     lua = { lang = "" },
    --   },
    -- }
  },
}
