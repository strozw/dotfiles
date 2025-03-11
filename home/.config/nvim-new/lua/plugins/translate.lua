return {
  {
    "uga-rosa/translate.nvim",
    config = function()
      require("translate").setup({
        lang = "en",
        winhl = "Normal:Normal",
      })
    end,
  },
}
