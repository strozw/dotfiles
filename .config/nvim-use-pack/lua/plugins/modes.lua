vim.pack.add({
  'https://github.com/mvllow/modes.nvim',
})

require("modes").setup {
  colors = {
    copy = "LightYellow",
    delete = "LightRed",
    change = "LightRed",
    insert = "LightCyan",
    select = "LightYellow",
    visual = "LightYellow",
  },
  line_opacity = 0.15,
}
