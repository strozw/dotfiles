-- hello
return {
  {
    "uga-rosa/translate.nvim",
    config = function()
      require("translate").setup({
        default = {
          output = "split",
        },
        preset = {
          output = {
            split = {
              append = true,
            },
          },
        },
      })
    end,
  },
}
