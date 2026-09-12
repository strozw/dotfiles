----------------------------------------------------------------------------------------------------
-- GLOBAL VARIABLES CONFIG
-- See `:h vim.g` -------------------------------------------------------------------------------------------------
-- See `:h mapleader`
vim.g.mapleader = ' '
-- See `:h maplocalleader`
vim.g.maplocalleader = '\\'
vim.g.have_nerd_font = true

---------------------------------------------------------------------------------------------------
-- OPTIONS
-- See `:h vim.o`
----------------------------------------------------------------------------------------------------

-- Show line numbers in a column.
vim.o.number = true

-- hide the ~ at the end of the buffer
vim.opt.fillchars = { eob = " " }

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = false
vim.o.smartcase = false

-- Highlight the line where the cursor is on.
vim.o.cursorline = false

-- Keep this many screen lines above/below the cursor.
vim.o.scrolloff = 10

-- Show <tab> and trailing spaces.
vim.o.list = true

-- Show Mode
vim.o.showmode = true

vim.o.showbreak = '↪ '

-- Enable break indent
vim.o.breakindent = true

-- Undo
vim.o.undofile = true

-- disable swapfile
vim.o.swapfile = false

-- See `:h 'confirm'`
vim.o.confirm = true

-- window
vim.o.winborder = 'solid'
vim.o.winblend = 10

-- autocomplete
vim.o.autocomplete = true
vim.o.complete = "o,.,w,b,u"

vim.o.completeopt = "menu,menuone,noselect,fuzzy,popup"
vim.o.pumblend = 10
vim.o.pumborder = 'solid'
vim.o.pumheight = 10

-- wild (cmdline completion)
vim.o.wildmode = "noselect:lastused,full"
vim.o.wildoptions = "pum,fuzzy"

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

----------------------------------------------------------------------------------------------------
-- AUTOCOMMANDS (EVENT HANDLERS)
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`
----------------------------------------------------------------------------------------------------

-- Notify on file write.
vim.api.nvim_create_autocmd('BufWritePost', {
  callback = function()
    local filename = vim.fn.expand('%:t')
    vim.notify('Saved: ' .. filename, vim.log.levels.INFO)
  end,
})

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})


----------------------------------------------------------------------------------------------------
-- USER COMMANDS: DEFINE CUSTOM COMMANDS
-- See `:h nvim_create_user_command()` and `:h user-commands`
----------------------------------------------------------------------------------------------------

-- Create a command `:GitBlameLine` that print the git blame for the current line
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line_number = vim.fn.line('.') -- Get the current line number. See `:h line()`
  local filename = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line_number .. ',+1', filename }):wait().stdout)
end, { desc = 'Print the git blame for the current line' })


----------------------------------------------------------------------------------------------------
-- UI2
----------------------------------------------------------------------------------------------------
-- enable ui2
require('vim._core.ui2').enable()

vim.o.cmdheight = 0

vim.o.laststatus = 3

vim.o.showtabline = 2

vim.o.showcmdloc = 'statusline'

----------------------------------------------------------------------------------------------------
-- PLUGINS
----------------------------------------------------------------------------------------------------
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nvim.undotree')
vim.cmd('packadd! nvim.difftool')

require('./plugins')
require('./lsp')
