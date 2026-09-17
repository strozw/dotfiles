vim.pack.add({
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzy-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim'
})

local telescope = require("telescope")
local actions_layout = require('telescope.actions.layout')

telescope.setup({
  -- defaults = {
  --   mappings = {
  --     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
  --   },
  -- },
  defaults = {
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
    -- borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    mappings = {
      i = {
        ["<M-p>"] = actions_layout.toggle_preview,
      },
      n = {
        ["<M-p>"] = actions_layout.toggle_preview,
      },
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown(),
    },
   fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }

  },
})

telescope.load_extension("ui-select")
telescope.load_extension("fzy_native")


vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopePrompt',
  callback = function()
    vim.o.autocomplete = false
  end,
})

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == 'telescope-fzf-native' and kind == 'update' then
      vim.sysytem({ 'make' }, { cwd = ev.data.path })

      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('make')
    end
  end
})

local wk = require("which-key")

wk.add({
  -- Top Pickers & Explorer
  { "<leader><space>", function() vim.cmd("Telescope find_files") end,            desc = "Smart Find Files" },
  { "<leader>,",       function() vim.cmd("Telescope buffers") end,               desc = "Buffers" },
  { "<leader>/",       function() vim.cmd("Telescope live_grep") end,             desc = "Grep" },
  { "<leader>:",       function() vim.cmd("Telescope command_history") end,       desc = "Command History" },
  -- { "<leader>n",       function() vim.cmd("") end,                          desc = "Notification History" },

  -- find
  { "<leader>fb",      function() vim.cmd("Telescope buffers") end,               desc = "Buffers" },
  { "<leader>ff",      function() vim.cmd("Telescope find_files") end,            desc = "Buffers" },
  { "<leader>fg",      function() vim.cmd("Telescope git_files") end,             desc = "Find Git Files" },
  -- -- git
  { "<leader>gb",      function() vim.cmd("Telescope git_branches") end,          desc = "Find Git Files" },
  { "<leader>gl",      function() vim.cmd("Telescope git_commits") end,           desc = "Find Git Files" },
  { "<leader>gL",      function() vim.cmd("Telescope git_bcommits") end,          desc = "Find Git Files" },
  { "<leader>gs",      function() vim.cmd("Telescope git_status") end,            desc = "Find Git Files" },
  { "<leader>gs",      function() vim.cmd("Telescope git_stash") end,             desc = "Find Git Files" },
  { "<leader>gf",      function() vim.cmd("Telescope git_files") end,             desc = "Find Git Files" },
  -- -- gh
  -- { "<leader>gi",      function() Snacks.picker.gh_issue() end,                                desc = "GitHub Issues (open)" },
  -- { "<leader>gI",      function() Snacks.picker.gh_issue({ state = "all" }) end,               desc = "GitHub Issues (all)" },
  -- { "<leader>gp",      function() Snacks.picker.gh_pr() end,                                   desc = "GitHub Pull Requests (open)" },
  -- { "<leader>gP",      function() Snacks.picker.gh_pr({ state = "all" }) end,                  desc = "GitHub Pull Requests (all)" },
  -- -- Grep
  { "<leader>sw",      function() vim.cmd("Telescope grep_string") end,           desc = "Visual selection or word", mode = { "n", "x" } },
  -- -- search
  { '<leader>s"',      function() vim.cmd("Telescope registers") end,             desc = "Registers" },
  { '<leader>s/',      function() vim.cmd("Telescope search_history") end,        desc = "Search History" },
  { "<leader>sa",      function() vim.cmd("Telescope autocommands") end,          desc = "Autocmds" },
  -- { "<leader>sb",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
  { "<leader>sc",      function() vim.cmd("Telescope command_history") end,       desc = "Command History" },
  { "<leader>sC",      function() vim.cmd("Telescope commands") end,              desc = "Commands" },
  { "<leader>sd",      function() vim.cmd("Telescope diagnostics") end,           desc = "Diagnostics" },
  -- { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
  { "<leader>sh",      function() vim.cmd("Telescope help_tags") end,             desc = "Help Pages" },
  { "<leader>sH",      function() vim.cmd("Telescope highlights") end,            desc = "Highlights" },
  -- { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
  { "<leader>sj",      function() vim.cmd("Telescope jumplist") end,              desc = "Jumps" },
  { "<leader>sk",      function() vim.cmd("Telescope keymaps") end,               desc = "Keymaps" },
  { "<leader>sl",      function() vim.cmd("Telescope loclist") end,               desc = "Location List" },
  { "<leader>sm",      function() vim.cmd("Telescope marks") end,                 desc = "Marks" },
  { "<leader>sM",      function() vim.cmd("Telescope man_pages") end,             desc = "Man Pages" },
  { "<leader>sq",      function() vim.cmd("Telescope quickfix") end,              desc = "Quickfix List" },
  { "<leader>uC",      function() vim.cmd("Telescope colorschemes") end,          desc = "Colorschemes" },
  -- LSP
  { "gd",              function() vim.cmd("Telescope lsp_definitions") end,       desc = "Goto Definition" },
  -- { "gD",              function() vim.cmd("Telescope lsp_declarations") end,      desc = "Goto Declaration" },
  { "gr",              function() vim.cmd("Telescope lsp_references") end,        nowait = true,                     desc = "References" },
  { "gI",              function() vim.cmd("Telescope lsp_implementations") end,   desc = "Goto Implementation" },
  { "gy",              function() vim.cmd("Telescope lsp_type_definitions") end,  desc = "Goto T[y]pe Definition" },
  { "gai",             function() vim.cmd("Telescope lsp_incoming_calls") end,    desc = "C[a]lls Incoming" },
  { "gao",             function() vim.cmd("Telescope lsp_outgoing_calls") end,    desc = "C[a]lls Outgoing" },
  { "<leader>ss",      function() vim.cmd("Telescope lsp_document_symbols") end,  desc = "LSP Symbols" },
  { "<leader>sS",      function() vim.cmd("Telescope lsp_workspace_symbols") end, desc = "LSP Workspace Symbols" },
})
