vim.api.nvim_create_autocmd('UIEnter', {
  once = true,
  callback = function()
    vim.pack.add({
      -- tiny cmdline
      'https://github.com/rachartier/tiny-cmdline.nvim',
    })

    require("tiny-cmdline").setup({})
  end
})
