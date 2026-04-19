---@type LazySpec
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function()
    require("tiny-inline-diagnostic").setup({
      preset = "powerline",
      options = {
        add_messages = {
          display_count = true,
          messages = true,
        },
        multilines = {
          always_show = true,
          enabled = true,
        },
      },
    })

    -- Disable Neovim's default virtual text diagnostics
    vim.diagnostic.config({
      virtual_text = false,
      update_in_insert = false,
    })
  end,
}
