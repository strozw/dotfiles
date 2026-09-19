----------------------------------------------------------------------------------------------------
-- AUTOCOMMANDS (EVENT HANDLERS)
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`
----------------------------------------------------------------------------------------------------
-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- complete preview popup window style
vim.api.nvim_create_autocmd(
  "CompleteChanged",
  {
    group = vim.api.nvim_create_augroup("CompletionPopupBorder", { clear = true }),
    callback = function()
      vim.schedule(function()
        local info = vim.fn.complete_info({ "selected" })
        local winid = info.preview_winid

        if winid and winid >= 0 and vim.api.nvim_win_is_valid(winid) then
          vim.api.nvim_win_set_config(winid, { border = "solid" })
        end
      end)
    end,
  }
)

-- autocmd CmdlineChanged [:\/\?] call wildtrigger()
vim.api.nvim_create_autocmd(
  "CmdlineChanged",
  {
    pattern = { ":", "/", "?" },
    callback = function()
      vim.fn.wildtrigger()
    end
  }
)

-- Notify on file write.
vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    local filename = vim.fn.expand('%:t')
    vim.notify('Saved: ' .. filename, vim.log.levels.INFO)
  end,
})

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

-- Keep NeoTree out of sessions (including `:restart`); it would be restored as an empty buffer.
vim.api.nvim_create_autocmd('SessionWritePre', {
  group = vim.api.nvim_create_augroup('NeoTreeCloseBeforeSession', { clear = true }),
  callback = function()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'neo-tree' then
        pcall(vim.api.nvim_win_close, win, true)
      end
    end
  end,
})
