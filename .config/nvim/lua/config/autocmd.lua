-- `.vscode/*.json` を jsonc として認識させる
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '**/.vscode/*.json',
  callback = function()
    vim.bo.filetype = 'jsonc'
  end,
})
