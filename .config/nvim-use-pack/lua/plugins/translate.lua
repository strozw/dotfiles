vim.pack.add({
  "https://github.com/uga-rosa/translate.nvim"
})

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
