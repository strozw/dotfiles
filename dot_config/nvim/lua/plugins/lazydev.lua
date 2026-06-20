---@type LazySpec
return {
  "folke/lazydev.nvim",
  ft = "lua",
  ---@module "lazydev"
  ---@type lazydev.Config
  opts = {
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      "lazy.nvim",
      "plenary.nvim",
    },
  },
}
