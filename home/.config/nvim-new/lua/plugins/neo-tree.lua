---@module "snacks"

-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    keys = {
      -- { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
    },
    opts = function(opts)
      local function on_move(data)
        Snacks.rename.on_rename_file(data.source, data.destination)
      end

      local events = require("neo-tree.events")

      opts.event_handlers = opts.event_handlers or {}

      vim.list_extend(opts.event_handlers, {
        { event = events.FILE_MOVED, handler = on_move },
        { event = events.FILE_RENAMED, handler = on_move },
      })

      opts.filesystem = {
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
      }
    end,
  },
}
