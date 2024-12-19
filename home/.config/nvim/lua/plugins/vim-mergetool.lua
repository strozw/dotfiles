return {
  {
    "samoshkin/vim-mergetool",
    config = function()
      vim.g.mergetool_layout = "lmr"
      vim.g.mergetool_prefer_revision = "local"
    end,
  },
}
