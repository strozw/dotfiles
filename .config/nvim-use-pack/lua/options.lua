----------------------------------------------------------------------------------------------------
-- GLOBAL VARIABLES CONFIG
----------------------------------------------------------------------------------------------------
vim.g.have_nerd_font = true
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

---------------------------------------------------------------------------------------------------
-- OPTIONS
----------------------------------------------------------------------------------------------------

-- Enable .nvim.lua
vim.o.exrc = true

-- Show line numbers in a column.
vim.o.number = true

-- hide the ~ at the end of the buffer
vim.opt.fillchars = { eob = " " }

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = false
vim.o.smartcase = false

-- Preview substitutions live, as you type!
vim.o.inccommand = "split"

-- Highlight the line where the cursor is on.
vim.o.cursorline = false

-- Keep this many screen lines above/below the cursor.
vim.o.scrolloff = 10

-- Decrease update time
vim.o.updatetime = 250

-- Decrease mapped sequence wait time
vim.o.timeoutlen = 300

-- Configure how new splits should be opened
vim.o.splitright = true
vim.o.splitbelow = true

-- auto refresh
vim.o.autoread = true

-- unsaved changes confirmation prompt
vim.o.confirm = true

-- Save undo history
vim.o.undofile = true

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
vim.o.winblend = 0

-- autocomplete
vim.o.autocomplete = true
vim.o.complete = "o,.,w,b,u"
vim.o.completeopt = "menu,menuone,noselect,fuzzy,popup"
vim.o.pumblend = 0
vim.o.pumborder = 'solid'
vim.o.pumheight = 10

-- wild (cmdline completion)
vim.o.wildmode = "noselect:lastused,full"
vim.o.wildoptions = "pum,fuzzy"

-- autocmd CmdlineChanged [:\/\?] call wildtrigger()
vim.api.nvim_create_autocmd(
  "CmdlineChanged",
  {
    pattern = { ":", "/", "?" },
    callback = function() vim.fn.wildtrigger() end
  }
)

-- statusline
vim.o.laststatus = 3

-- cmdline
vim.o.cmdheight = 0
vim.o.showcmdloc = 'statusline'

-- tabline
vim.o.showtabline = 0

-- clipboard
-- Schedule the setting after `UIEnter` because it can increase startup-time.
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Highlight when yanking (copying) text.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.hl_op()
  end,
})
