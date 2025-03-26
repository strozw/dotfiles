---@module "copilot"

return {
  {
    "zfirenbaum/copilot.lua",
    ---@type copilot_config
    opts = {
      filetypes = {
        ["*"] = false,
      },
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
}
