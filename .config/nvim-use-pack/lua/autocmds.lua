-- Notify on file write.
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   callback = function()
--     local filename = vim.fn.expand('%:t')
--     vim.notify('Saved: ' .. filename, vim.log.levels.INFO)
--   end,
-- })

-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.hl_op()
  end,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '**/.vscode/*.json',
  callback = function()
    vim.bo.filetype = 'jsonc'
  end,
})
