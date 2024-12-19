local M = {}

M.get_cwd = function()
  local current_buf = vim.api.nvim_get_current_buf()
  return vim.api.nvim_buf_get_name(current_buf)
end

M.is_ai_enabled = function()
  if vim.g.ai then
    return true
  end

  local cwd = M.get_cwd()

  if string.match(cwd, "github.com/strozw") ~= nil then
    return true
  end

  return false
end

return M
