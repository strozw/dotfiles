-- auto refresh
vim.o.autoread = true

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = "*",
})

-- DiffOrig コマンド
vim.api.nvim_create_user_command('DiffOrig', function()
  local orig_buf = vim.api.nvim_get_current_buf()
  local orig_ft = vim.bo[orig_buf].filetype
  local orig_filename = vim.api.nvim_buf_get_name(orig_buf)

  -- ファイルが保存されているかチェック
  if orig_filename == '' then
    vim.notify('No file associated with this buffer', vim.log.levels.WARN)
    return
  end

  if vim.fn.filereadable(orig_filename) == 0 then
    vim.notify('File does not exist on disk', vim.log.levels.WARN)
    return
  end

  -- 垂直分割で新しいバッファを作成
  vim.cmd('vnew')
  local new_buf = vim.api.nvim_get_current_buf()

  -- バッファ設定
  vim.bo[new_buf].buftype = 'nofile'
  vim.bo[new_buf].bufhidden = 'wipe'
  vim.bo[new_buf].swapfile = false
  vim.bo[new_buf].filetype = orig_ft

  -- バッファに名前をつける（わかりやすくするため）
  vim.api.nvim_buf_set_name(new_buf, orig_filename .. ' (saved)')

  -- ディスクから読み込み
  local lines = vim.fn.readfile(orig_filename)
  vim.api.nvim_buf_set_lines(new_buf, 0, -1, false, lines)

  -- バッファを変更不可にする
  vim.bo[new_buf].modifiable = false

  -- diffモードを有効化
  vim.cmd('diffthis')
  vim.cmd('wincmd p')
  vim.cmd('diffthis')

  vim.notify('Comparing with saved version', vim.log.levels.INFO)
end, { desc = 'Compare buffer with saved file' })

vim.api.nvim_create_user_command('DiffOrigClose', function()
  -- diffモードを無効化
  vim.cmd('diffoff')

  -- nofileバッファを探して閉じる
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].buftype == 'nofile' then
      vim.api.nvim_win_close(win, true)
    end
  end
end, { desc = 'Close DiffOrig comparison' })
