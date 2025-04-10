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
        silent = true,
      },
      {
        "<leader>bn",
        ":BufferLineCycleNext<CR>",
        desc = "[B]uffer Line Cycle [N]ext",
        silent = true,
      },
      {
        "<C-p>",
        ":BufferLineCyclePrev<CR>",
        desc = "Buffer Line Cycle [P]rev",
        silent = true,
      },
      {
        "<leader>bp",
        ":BufferLineCyclePrev<CR>",
        desc = "[B]uffer Line Cycle [P]rev",
        silent = true,
      },
    },
    ---@type bufferline.UserConfig
    opts = {},
  },
}
