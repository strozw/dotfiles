---@type LazySpec
return {
  "leonardcser/cursortab.nvim",
  enabled = false,
  version = "*",
  build = "cd server && go build",
  config = function()
    require("cursortab").setup({
      provider = {
        type = "sweep",
        url = "http://localhost:11434",
        model = "sweepai/sweep-next-edit:latest",
      },
    })
  end,
}
