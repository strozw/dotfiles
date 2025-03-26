---@module "bufferline"

return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    lazy = false,
    keys = {
      {
        "<C-n>",
        ":BufferLineCycleNext<CR>",
        desc = "Buffer Line Cycle [N]ext",
      },
      {
        "<leader>bn",
        ":BufferLineCycleNext<CR>",
        desc = "[B]uffer Line Cycle [N]ext",
      },
      {
        "<C-p>",
        ":BufferLineCyclePrev<CR>",
        desc = "Buffer Line Cycle [P]rev",
      },
      {
        "<leader>bp",
        ":BufferLineCyclePrev<CR>",
        desc = "[B]uffer Line Cycle [P]rev",
      },
    },
    ---@type bufferline.UserConfig
    opts = {},
  },
}
