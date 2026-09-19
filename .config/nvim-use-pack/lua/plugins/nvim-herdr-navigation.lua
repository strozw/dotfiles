-- vim.pack は submodule を必ず clone するため、.gitmodules の SSH URL を HTTPS に書き換える
local n = tonumber(vim.env.GIT_CONFIG_COUNT) or 0
vim.env["GIT_CONFIG_KEY_" .. n] = "url.https://github.com/.insteadOf"
vim.env["GIT_CONFIG_VALUE_" .. n] = "git@github.com:"
vim.env.GIT_CONFIG_COUNT = tostring(n + 1)

vim.pack.add({
  "https://github.com/bojackduy/nvim-herdr-navigation"
})

local plugin = vim.pack.get({ "nvim-herdr-navigation" }, { info = false })[1]
vim.opt.rtp:prepend(plugin.path .. "/nvim-herdr-navigation")

vim.schedule(function()
  require("herdr-navigation").setup({
    keybindings = {
      left = "<C-h>",
      down = "<C-j>",
      up = "<C-k>",
      right = "<C-l>",
    },
  })
end)
