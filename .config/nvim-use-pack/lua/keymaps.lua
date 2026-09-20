local wk = require('which-key')

wk.add({
  --------------------------------------------------------------------------------------------------
  -- Native Feature Keymaps
  --------------------------------------------------------------------------------------------------
  { '<Esc><Esc>', ":noh<CR>",                                        desc = "no hilight search", },

  -- Use <Esc> to exit terminal mode
  { '<Esc>',      '<C-\\><C-n>',                                     desc = "Exit terminal mode",         mode = { 't', } },

  -- Map [<Tab>, ]<Tab> to buffer navigation in normal mode
  { ']<Tab>',     ":tabnext<CR>",                                    desc = "Next Tab",                   mode = { 'n', } },
  { '[<Tab>',     ":tabprev<CR>",                                    desc = "Previous Tab",               mode = { 'n', } },

  -- Buffer Keymaps
  { "<C-n>",      ":BufferLineCycleNext<CR>",                        desc = "Buffer Line Cycle [N]ext",   silent = true, },
  { "<C-p>",      ":BufferLineCyclePrev<CR>",                        desc = "Buffer Line Cycle [P]rev",   silent = true, },
  { ']b',         ":BufferLineCycleNext<CR>",                        desc = "Next buffer",                mode = { 'n', } },
  { '[b',         ":BufferLineCyclePrev<CR>",                        desc = "Previous buffer",            mode = { 'n', } },
  { "<leader>bn", ":BufferLineCycleNext<CR>",                        desc = "[B]uffer Line Cycle [N]ext", silent = true, },
  { "<leader>bp", ":BufferLineCyclePrev<CR>",                        desc = "[B]uffer Line Cycle [P]rev", silent = true, },
  { "<leader>bo", ":BufferLineCloseOthers<CR>",                      desc = "Close Other Buffers",        mode = "n",                       silent = true, noremap = true, },
  { "<leader>bd", function() require("mini.bufremove").delete() end, desc = "Delete Buffer" },

  -- Copy Reference Keymaps
  { "yr",         "<cmd>CopyReference file<cr>",                     mode = { "n", "v" },                 desc = "Copy file path" },
  { "yrr",        "<cmd>CopyReference line<cr>",                     mode = { "n", "v" },                 desc = "Copy file:line reference" },

  -- NeoTree Keymaps
  { '<leader>e',  ':Neotree toggle reveal_force_cwd<CR>',            desc = 'Toggle NeoTree',             noremap = true,                   silent = true, mode = 'n' },
})

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
  { "<leader>gy",      function() vim.cmd("Telescope git_stash") end,             desc = "Find Git Files" },
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

wk.add({
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

  {
    "<C-Space>",
    function() vim.lsp.completion.get() end,
    desc = "Trigger LSP completion",
    expr = true,
    noremap = true,
    mode = { "i", "c" },
  },

  -- LSP inline completion accept
  -- {
  --   '<Tab>',
  --   function()
  --     if not vim.lsp.inline_completion.get() then
  --       return '<Tab>'
  --     end
  --   end,
  --   expr = true,
  --   desc = 'Accept the current inline completion',
  --   mode = { 'i' }
  -- },
  {
    '<M-CR>',
    function()
      vim.lsp.inline_completion.get()
    end,
    expr = true,
    desc = 'Accept the current inline completion',
    mode = { 'i' }
  },

  {
    '<Tab>',
    function()
      return vim.snippet.active({ direction = 1 }) and '<cmd>lua vim.snippet.jump(1)<cr>' or '<Tab>'
    end,
    expr = true,
    mode = { 'i', 's' },
  },

  {
    '<S-Tab>',
    function()
      return vim.snippet.active({ direction = -1 }) and '<cmd>lua vim.snippet.jump(-1)<cr>' or '<S-Tab>'
    end,
    expr = true,
    mode = { 'i', 's' },
  },
})



wk.add({
  "<leader>cx",
  function()
    for _, client in ipairs(vim.lsp.buf_get_clients()) do
      require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
    end
  end,
  desc = "Diagnostics (Workspace Diagnostics)",
})


-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    wk.add({
      { "<leader>cr", vim.lsp.buf.rename,                         desc = "[C]ode [R]ename" },
      { "<leader>ca", vim.lsp.buf.code_action,                    desc = "[C]ode [A]ction",         mode = { "n", "x" } },
      -- { "<leader>ca", function() require("tiny-code-action").code_action() end, desc = "[C]ode [A]ction",         mode = { "n", "x" } },
      { "<leader>ch", vim.lsp.buf.signature_help,                 desc = "[C]ode signature [H]elp", mode = { "n", "x" } },
      { "D",          function() vim.diagnostic.open_float() end, desc = "show [D]iagnostic",       mode = { "n" } },

    })

    if client.supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      wk.add({
        {
          "<leader>th",
          function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end,
          desc = "[T]oggle Inlay [H]ints"
        }
      })
    end
  end
})

if vim.env.HERDR_PANE_ID == nil then
  --   wk.add({
  --     { "<c-h>", "<CMD>TmuxNavigateLeft<CR>",             mode = { "n" }, silent = true },
  --     { "<c-j>", "<CMD>TmuxNavigateDown<CR>",             mode = { "n" }, silent = true },
  --     { "<c-k>", "<CMD>TmuxNavigateUp<CR>",               mode = { "n" }, silent = true },
  --     { "<c-l>", "<CMD>TmuxNavigateRight<CR>",            mode = { "n" }, silent = true },
  --     -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>",    mode = "n",     silent = true },
  --
  --     { "<c-h>", "<C-\\><C-n><CMD>TmuxNavigateLeft<CR>",  mode = { "t" }, silent = true },
  --     { "<c-j>", "<C-\\><C-n><CMD>TmuxNavigateDown<CR>",  mode = { "t" }, silent = true },
  --     { "<c-k>", "<C-\\><C-n><CMD>TmuxNavigateUp<CR>",    mode = { "t" }, silent = true },
  --     { "<c-l>", "<C-\\><C-n><CMD>TmuxNavigateRight<CR>", mode = { "t" }, silent = true },
  --   })
else
  wk.add({
    {
      "<leader>hc",
      function()
        require("herdr-context").compose()
      end,
      mode = { "n", "v" },
      desc = "Compose Herdr Context",
    },
    {
      "<leader>hay",
      function()
        require("herdr-context").reference()
      end,
      mode = { "n", "v" },
      desc = "Send Reference to Herdr Agent",
    },
    {
      "<leader>haY",
      function()
        require("herdr-context").send()
      end,
      mode = { "n", "v" },
      desc = "Send Context to Herdr Agent",
    },
    {
      "<leader>had",
      function()
        require("herdr-context").diagnostics()
      end,
      mode = { "n", "v" },
      desc = "Send Diagnostics to Herdr Agent",
    },
    {
      "<leader>hat",
      function()
        require("herdr-context").select_target()
      end,
      desc = "Select Herdr Agent",
    },
    {
      "<leader>ha",
      function()
        require("herdr-context").agents()
      end,
      desc = "Toggle Herdr Agents",
    },
    {
      "<leader>har",
      function()
        require("herdr-context").refresh()
      end,
      desc = "Refresh Herdr Agents",
    },
  })
end
