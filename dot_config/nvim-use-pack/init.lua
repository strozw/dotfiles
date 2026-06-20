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

-- Install third-party plugins via "vim.pack.add()".
vim.pack.add({
  -- Treesitter
  'https://github.com/nvim-treesitter/nvim-treesitter',
  -- Quickstart configs for LSP
  'https://github.com/neovim/nvim-lspconfig',
  -- bootstrap utilities
  'https://github.com/folke/snacks.nvim',
  -- Keymap Viewer
  'https://github.com/folke/which-key.nvim',
  -- Integrate Coding agent CLI
  'https://github.com/folke/sidekick.nvim',
  -- Enhanced Search & Jump
  'https://github.com/folke/flash.nvim',
  --
  'https://github.com/folke/lazydev.nvim',
  -- Autocompletion
  'https://github.com/onsails/lspkind.nvim',
  -- Surround
  'https://github.com/kylechui/nvim-surround',
  -- Enhanced quickfix/loclist
  'https://github.com/stevearc/quicker.nvim',
  -- Git integration
  'https://github.com/lewis6991/gitsigns.nvim',
  -- autoreload
  'https://github.com/ccntrq/autoreload.nvim',
  -- tiny diagnostics
  'https://github.com/rachartier/tiny-inline-diagnostic.nvim',
  -- tiny cmdline
  'https://github.com/rachartier/tiny-cmdline.nvim',
  -- rictch help view
  'https://github.com/OXY2DEV/helpview.nvim',
  -- diffview
  'https://github.com/sindrets/diffview.nvim',
  -- markdown view
  'https://github.com/delphinus/md-render.nvim',
  -- formatter
  'https://github.com/stevearc/conform.nvim',
  -- cursorline decoration per mode
  'https://github.com/mvllow/modes.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/nvim-lualine/lualine.nvim',
  'https://github.com/romgrk/barbar.nvim',
  'https://github.com/nvim-mini/mini.snippets'
})

require('nvim-treesitter').setup {
  -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
  install_dir = vim.fn.stdpath('data') .. '/site'
}
require('snacks').setup {
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  explorer = {
    enabled = true,
    trash = true,
    replace_netrw = true,
  },
  indent = { enabled = true },
  input = { enabled = true },
  notifier = {
    enabled = true,
    timeout = 3000,
    -- style = "fancy"
  },
  picker = {
    enabled = true,
    win = {
      list = { border = "solid" },
      input = { border = "solid" },
      preview = { border = "solid" },
    },
    sources = {
      explorer = {

      }
    }
  },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scroll = { enabled = true },
  statuscolumn = { enabled = true },
  win = {
    border = "none",
  },
  words = { enabled = true },
  styles = {
    notification = {
      border = "bold",
      zindex = 100,
      ft = "markdown",
      wo = {
        winblend = 5,
        wrap = false,
        conceallevel = 2,
        colorcolumn = "",
      },
      bo = { filetype = "snacks_notif" },
    },
  }
}
require('sidekick').setup {

}
require('which-key').setup {}
require('flash').setup {}
require('lazydev').setup {}
require('lspkind').setup { mode = 'symbol_text', }
require("nvim-surround").setup {}
require('quicker').setup {}
require('gitsigns').setup {}
require('autoreload').setup {}
require("tiny-inline-diagnostic").setup {}
require("tiny-cmdline").setup {}
require('helpview').setup {}
require("diffview").setup {}
require("conform").setup({
  format_after_save = {
    lsp_format = "last",
  },
  formatters_by_ft = {
    lua = { lsp_format = "fallback" },
    -- rust = { lsp_format = "fallback" },
    -- Conform will run the first available formatter
    -- javascript = { "prettierd", "prettier", stop_after_first = true },
  },
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
require('lualine').setup {
  options = {
    -- theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    always_divide_middle = true,
    always_show_tabline = true,
    refresh = {          -- sets how often lualine should refresh it's contents (in ms)
      statusline = 100,  -- The refresh option sets minimum time that lualine tries
      tabline = 100,     -- to maintain between refresh. It's not guarantied if situation
      winbar = 100,      -- arises that lualine needs to refresh itself before this time it'll do it.
      refresh_time = 16, -- ~60fps the time after which refresh queue is processed. Mininum refreshtime for lualine
      events = {         -- The auto command events at which lualine refreshes
        'WinEnter',
        'BufEnter',
        'BufWritePost',
        'SessionLoadPost',
        'FileChangedShellPost',
        'VimResized',
        'Filetype',
        'CursorMoved',
        'CursorMovedI',
        'ModeChanged',
      },
    },
  }
}

-- disable barbar auto-setup
vim.g.barbar_auto_setup = false
require 'barbar'.setup {
  animation = true,

  tabpages = true,

  clickable = true,

  -- exclude_ft = { 'qf' },

  icons = {
    separator = { left = '▎', right = ' ' },
    inactive = {
      -- button = '× '
      separator = { left = '▎', right = ' ' },
    },
  },

  sidebar_filetypes = {
    ["snacks_picker_list"] = true,
    -- -- Or, specify the text used for the offset:
    -- undotree = {
    --   text = 'undotree',
    --   align = 'center', -- *optionally* specify an alignment (either 'left', 'center', or 'right')
    -- },
    -- -- Or, specify the event which the sidebar executes when leaving:
    -- ['neo-tree'] = { event = 'BufWipeout' },
    -- -- Or, specify all three
    -- Outline = { event = 'BufWinLeave', text = 'symbols-outline', align = 'right' },
  },
}
require('mini.snippets').setup {
  -- Array of snippets and loaders (see |MiniSnippets.config| for details).
  -- Nothing is defined by default. Add manually to have snippets to match.
  snippets = {},

  -- Module mappings. Use `''` (empty string) to disable one.
  mappings = {
    -- Expand snippet at cursor position. Created globally in Insert mode.
    expand = '<C-j>',

    -- Interact with default `expand.insert` session.
    -- Created for the duration of active session(s)
    jump_next = '<C-l>',
    jump_prev = '<C-h>',
    stop = '<C-c>',
  },

  -- Functions describing snippet expansion. If `nil`, default values
  -- are `MiniSnippets.default_<field>()`.
  expand = {
    -- Resolve raw config snippets at context
    prepare = nil,
    -- Match resolved snippets at cursor position
    match = nil,
    -- Possibly choose among matched snippets
    select = nil,
    -- Insert selected snippet
    insert = nil,
  },
}

----------------------------------------------------------------------------------------------------
-- KEYMAPS
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`
----------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------
local keymaps = {
  --------------------------------------------------------------------------------------------------
  -- Native Feature Keymaps
  --------------------------------------------------------------------------------------------------
  { '<Esc><Esc>',          function() vim.cmd('noh') end,     desc = "no hilight search", },

  -- Use <Esc> to exit terminal mode
  { '<Esc>',               '<C-\\><C-n>',                     desc = "Exit terminal mode",      mode = { 't', } },

  -- Map <C-n>, <C-p> to buffer navigation in insert mode
  { '<C-n>',               function() vim.cmd('bnext') end,   desc = "Next buffer",             mode = { 'n', } },
  { '<C-p>',               function() vim.cmd('bprev') end,   desc = "Previous buffer",         mode = { 'n', } },

  -- Map [b, ]b to buffer navigation in normal mode
  { ']b',                  function() vim.cmd('bnext') end,   desc = "Next buffer",             mode = { 'n', } },
  { '[b',                  function() vim.cmd('bprev') end,   desc = "Previous buffer",         mode = { 'n', } },

  -- Map [<Tab>, ]<Tab> to buffer navigation in normal mode
  { ']<Tab>',              function() vim.cmd('tabnext') end, desc = "Next buffer",             mode = { 'n', } },
  { '[<Tab>',              function() vim.cmd('tabprev') end, desc = "Previous buffer",         mode = { 'n', } },

  -- Map <C-j>, <C-k>, <C-h>, <C-l> to navigate between windows in any modes
  { '<C-h>',               '<C-\\><C-n><C-w>h',               desc = "Go to the left window",   mode = { 't', 'i' }, },
  { '<C-j>',               '<C-\\><C-n><C-w>j',               desc = "Go to the bottom window", mode = { 't', 'i' }, },
  { '<C-k>',               '<C-\\><C-n><C-w>k',               desc = "Go to the top window",    mode = { 't', 'i' }, },
  { '<Cvim.hl.on_yank-l>', '<C-\\><C-n><C-w>l',               desc = "Go to the right window",  mode = { 't', 'i' }, },
  { '<C-h>',               '<C-w>h',                          desc = "Go to the left window",   mode = { 'n' }, },
  { '<C-j>',               '<C-w>j',                          desc = "Go to the bottom window", mode = { 'n' }, },
  { '<C-k>',               '<C-w>k',                          desc = "Go to the top window",    mode = { 'n' }, },
  { '<C-l>',               '<C-w>l',                          desc = "Go to the right window",  mode = { 'n' }, },

  -- Map <Up>, <Down> to select completion item
  {
    '<Down>',
    function() return vim.fn.pumvisible() == 1 and '<C-n>' or '<Down>' end,
    desc = "Select next completion item",
    expr = true,
    noremap = true,
    mode = { 'i', 'c' }
  },
  {
    '<Up>',
    function() return vim.fn.pumvisible() == 1 and '<C-p>' or '<Up>' end,
    desc = "Select prev completion item",
    expr = true,
    noremap = true,
    mode = { 'i', 'c' }
  },

  -- LSP inline completion accept
  {
    '<Tab>',
    function()
      if not vim.lsp.inline_completion.get() then
        return '<Tab>'
      end
    end,
    expr = true,
    desc = 'Accept the current inline completion',
    mode = { 'i' }
  },

  -- {
  --   '<Tab>',
  --   function()
  --     return vim.snippet.active({ direction = 1 }) and '<cmd>lua vim.snippet.jump(1)<cr>' or '<Tab>'
  --   end,
  --   expr = true,
  --   mode = { 'i', 's' },
  -- },
  --
  -- {
  --   '<S-Tab>',
  --   function()
  --     return vim.snippet.active({ direction = -1 }) and '<cmd>lua vim.snippet.jump(-1)<cr>' or '<S-Tab>'
  --   end,
  --   expr = true,
  --   mode = { 'i', 's' },
  -- },

  -------------------------------------------------------------------------------------------------
  -- Snacks
  -------------------------------------------------------------------------------------------------
  -- Top Pickers & Explorer
  { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
  { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
  { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
  { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
  { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
  { "<leader>e",       function() Snacks.explorer() end,                                       desc = "File Explorer" },
  -- find
  { "<leader>fb",      function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
  { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
  { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
  { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
  { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
  { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
  -- git
  { "<leader>gb",      function() Snacks.picker.git_branches() end,                            desc = "Git Branches" },
  { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
  { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
  { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
  { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
  { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
  { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
  -- gh
  { "<leader>gi",      function() Snacks.picker.gh_issue() end,                                desc = "GitHub Issues (open)" },
  { "<leader>gI",      function() Snacks.picker.gh_issue({ state = "all" }) end,               desc = "GitHub Issues (all)" },
  { "<leader>gp",      function() Snacks.picker.gh_pr() end,                                   desc = "GitHub Pull Requests (open)" },
  { "<leader>gP",      function() Snacks.picker.gh_pr({ state = "all" }) end,                  desc = "GitHub Pull Requests (all)" },
  -- Grep
  { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
  { "<leader>sB",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
  { "<leader>sg",      function() Snacks.picker.grep() end,                                    desc = "Grep" },
  { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word",   mode = { "n", "x" } },
  -- search
  { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
  { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
  { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
  { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
  { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
  { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
  { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
  { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
  { "<leader>sh",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
  { "<leader>sH",      function() Snacks.picker.highlights() end,                              desc = "Highlights" },
  { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
  { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
  { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
  { "<leader>sl",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
  { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
  { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
  { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
  { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
  { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
  { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
  { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
  -- LSP
  { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
  { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
  { "gr",              function() Snacks.picker.lsp_references() end,                          nowait = true,                       desc = "References" },
  { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
  { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
  { "gai",             function() Snacks.picker.lsp_incoming_calls() end,                      desc = "C[a]lls Incoming" },
  { "gao",             function() Snacks.picker.lsp_outgoing_calls() end,                      desc = "C[a]lls Outgoing" },
  { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
  { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
  -- Other
  { "<leader>z",       function() Snacks.zen() end,                                            desc = "Toggle Zen Mode" },
  { "<leader>Z",       function() Snacks.zen.zoom() end,                                       desc = "Toggle Zoom" },
  { "<leader>.",       function() Snacks.scratch() end,                                        desc = "Toggle Scratch Buffer" },
  { "<leader>S",       function() Snacks.scratch.select() end,                                 desc = "Select Scratch Buffer" },
  { "<leader>n",       function() Snacks.notifier.show_history() end,                          desc = "Notification History" },
  { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
  { "<leader>cR",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
  { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse",                 mode = { "n", "v" } },
  { "<leader>gg",      function() Snacks.lazygit() end,                                        desc = "Lazygit" },
  { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
  { "<c-/>",           function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
  { "<c-_>",           function() Snacks.terminal() end,                                       desc = "which_key_ignore" },
  { "]]",              function() Snacks.words.jump(vim.v.count1) end,                         desc = "Next Reference",             mode = { "n", "t" } },
  { "[[",              function() Snacks.words.jump(-vim.v.count1) end,                        desc = "Prev Reference",             mode = { "n", "t" } },
  {
    "<leader>N",
    desc = "Neovim News",
    function()
      Snacks.win({
        file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
        width = 0.6,
        height = 0.6,
        wo = {
          spell = false,
          wrap = false,
          signcolumn = "yes",
          statuscolumn = " ",
          conceallevel = 3,
        },
      })
    end,
  },


  --------------------------------------------------------------------------------------------------
  -- Flash
  --------------------------------------------------------------------------------------------------
  { "s",     function() require("flash").jump() end,              desc = "Flash",               mode = { "n", "x", "o" }, },
  { "S",     function() require("flash").treesitter() end,        desc = "Flash Treesitter",    mode = { "n", "x", "o" }, },
  { "r",     function() require("flash").remote() end,            desc = "Remote Flash",        mode = "o", },
  { "R",     function() require("flash").treesitter_search() end, desc = "Treesitter Search",   mode = { "o", "x" }, },
  { "<c-s>", function() require("flash").toggle() end,            desc = "Toggle Flash Search", mode = { "c" }, },

  --------------------------------------------------------------------------------------------------
  -- Sidekick
  --------------------------------------------------------------------------------------------------
  {
    "<Tab>",
    function()
      -- if there is a next edit, jump to it, otherwise apply it if any
      if not require("sidekick").nes_jump_or_apply() then
        return "<Tab>" -- fallback to normal tab
      end
    end,
    expr = true,
    desc = "Goto/Apply Next Edit Suggestion",
  },
  {
    "<c-.>",
    function() require("sidekick.cli").focus() end,
    desc = "Sidekick Focus",
    mode = { "n", "t", "i", "x" },
  },
  {
    "<leader>aa",
    function() require("sidekick.cli").toggle() end,
    desc = "Sidekick Toggle CLI",
  },
  {
    "<leader>as",
    function() require("sidekick.cli").select() end,
    -- Or to select only installed tools:
    -- require("sidekick.cli").select({ filter = { installed = true } })
    desc = "Select CLI",
  },
  {
    "<leader>ad",
    function() require("sidekick.cli").close() end,
    desc = "Detach a CLI Session",
  },
  {
    "<leader>at",
    function() require("sidekick.cli").send({ msg = "{this}" }) end,
    mode = { "x", "n" },
    desc = "Send This",
  },
  {
    "<leader>af",
    function() require("sidekick.cli").send({ msg = "{file}" }) end,
    desc = "Send File",
  },
  {
    "<leader>av",
    function() require("sidekick.cli").send({ msg = "{selection}" }) end,
    mode = { "x" },
    desc = "Send Visual Selection",
  },
  {
    "<leader>ap",
    function() require("sidekick.cli").prompt() end,
    mode = { "n", "x" },
    desc = "Sidekick Select Prompt",
  },
  -- Example of a keybinding to open Claude directly
  {
    "<leader>ac",
    function() require("sidekick.cli").toggle({ name = "claude", focus = true }) end,
    desc = "Sidekick Toggle Claude",
  },

  --------------------------------------------------------------------------------------------------
  -- BarBar
  --------------------------------------------------------------------------------------------------
  { "<leader>bo", function() vim.cmd("BufferCloseAllButCurrent") end, desc = "Close Other Buffers" },
}

for _, map in ipairs(keymaps) do
  local opts = { desc = map.desc }

  if map.silent ~= nil then
    opts.silent = map.silent
  end

  if map.noremap ~= nil then
    opts.noremap = map.noremap
  else
    opts.noremap = true
  end

  if map.expr ~= nil then
    opts.expr = map.expr
  end

  local mode = map.mode or "n"
  vim.keymap.set(mode, map[1], map[2], opts)
end

----------------------------------------------------------------------------------------------------
-- Treesitter
-- See `:h nvim-treesitter.txt`
----------------------------------------------------------------------------------------------------
require('nvim-treesitter').install { 'lua' }

----------------------------------------------------------------------------------------------------
-- LSP
-- See `:h lspconfig-all` or `https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md`
----------------------------------------------------------------------------------------------------
-- disable diagnostic virtual text for tiny-inline-diagnostic
vim.diagnostic.config({ virtual_text = false })

vim.lsp.inline_completion.enable();

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

    vim.lsp.document_color.enable(true)

    if client then
      -- enable lsp completion
      if client:supports_method('textDocument/completion') then
        -- Optional: trigger autocompletion on EVERY keypress. May be slow!
        local triggersChars = {}

        for i = 32, 126 do table.insert(triggersChars, string.char(i)) end
        client.server_capabilities.completionProvider.triggerCharacters = triggersChars

        vim.lsp.completion.enable(
          true,
          client.id,
          ev.buf,
          {
            autotrigger = true,
          }
        )
      end
    end
  end
})

vim.api.nvim_create_autocmd("LspProgress", {
  ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
  callback = function(ev)
    local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
    vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
      id = "lsp_progress",
      title = "LSP Progress",
      opts = function(notif)
        notif.icon = ev.data.params.value.kind == "end" and " "
            or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
      end,
    })
  end,
})

-- lua_ls
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        },
      },
      telemetry = { enable = false },
    },
  },
})
vim.lsp.enable('lua_ls')

-- copilot
vim.lsp.config('copilot', {
  settings = {
    telemetry = {
      telemetryLevel = "off",
    },
  }
})
vim.lsp.enable('copilot')

-- change window sepaarator color to darken
vim.api.nvim_set_hl(0, "WinSeparator", { fg = "Black" })
