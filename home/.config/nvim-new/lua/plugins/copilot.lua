---@module "copilot"

return {
  {
    "zbirenbaum/copilot.lua",
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
