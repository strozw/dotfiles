vim.pack.add({
  "https://github.com/cajames/copy-reference.nvim",
})

require("copy-reference").setup()

wk.add({
  { "yr",  "<cmd>CopyReference file<cr>", mode = { "n", "v" }, desc = "Copy file path" },
  { "yrr", "<cmd>CopyReference line<cr>", mode = { "n", "v" }, desc = "Copy file:line reference" },
})
