local wk = require('which-key')

wk.add({
  { '<Esc><Esc>', function () vim.cmd("nohlsearch") end, desc = "no hilight search" },

  -- Use <Esc> to exit terminal mode
  { '<Esc>', '<C-\\><C-n>', desc = "Exit terminal mode", mode = { 't' } },

  -- Map [<Tab>, ]<Tab> to buffer navigation in normal mode
  { ']<Tab>', function () vim.cmd("tabnext") end, desc = "Next Tab", mode = { 'n' } },
  { '[<Tab>', function () vim.cmd("tabprevious") end, desc = "Previous Tab", mode = { 'n' } },

  -- Buffer Keymaps
  { "<C-n>", function () require("bufferline").cycle(1) end, desc = "Buffer Line Cycle [N]ext", silent = true },
  { "<C-p>", function () require("bufferline").cycle(-1) end, desc = "Buffer Line Cycle [P]rev", silent = true },
  { ']b', function () require("bufferline").cycle(1) end, desc = "Next buffer", mode = { 'n' } },
  { '[b', function () require("bufferline").cycle(-1) end, desc = "Previous buffer", mode = { 'n' } },
  { "<leader>bn", function () require("bufferline").cycle(1) end, desc = "[B]uffer Line Cycle [N]ext", silent = true },
  { "<leader>bp", function () require("bufferline").cycle(-1) end, desc = "[B]uffer Line Cycle [P]rev", silent = true },
  {
    "<leader>bo",
    function () require("bufferline").close_others() end,
    desc = "Close Other Buffers",
    mode = "n",
    silent = true,
    noremap = true
  },
  { "<leader>bd", function () require("mini.bufremove").delete() end, desc = "Delete Buffer" },

  -- Copy Reference Keymaps
  { "yr", function () vim.cmd("CopyReference file") end, mode = { "n", "v" }, desc = "Copy file path" },
  { "yrr", function () vim.cmd("CopyReference line") end, mode = { "n", "v" }, desc = "Copy file:line reference" },

  ----------------------------
  -- Completion Keymaps
  ----------------------------
  -- Map <Up>, <Down> to select completion item
  {
    '<Down>',
    ---@diagnostic disable-next-line: return-type-mismatch
    ---@diagnostic disable-next-line: redundant-return-value
    function () return vim.fn.pumvisible() == 1 and '<C-n>' or '<Down>' end,
    desc = "Select next completion item",
    expr = true,
    noremap = true,
    mode = { 'i', 'c' }
  },
  {
    '<Up>',
    ---@diagnostic disable-next-line: return-type-mismatch
    ---@diagnostic disable-next-line: redundant-return-value
    function () return vim.fn.pumvisible() == 1 and '<C-p>' or '<Up>' end,
    desc = "Select prev completion item",
    expr = true,
    noremap = true,
    mode = { 'i', 'c' }
  },

  {
    "<C-Space>",
    function () vim.lsp.completion.get() end,
    desc = "Trigger LSP completion",
    expr = true,
    noremap = true,
    mode = { "i", "c" }
  },

  -- <CR> only ends completion ("discard") by default, which skips the LSP accept path
  -- and its additionalTextEdits, i.e. auto-import. Accept with <C-y> instead, and fall
  -- back to autopairs for everything else so its bracket handling keeps working.
  {
    '<CR>',
    function ()
      local autopairs = require('nvim-autopairs')

      if vim.fn.pumvisible() == 1 and vim.fn.complete_info({ 'selected' }).selected ~= -1 then
        ---@diagnostic disable-next-line: return-type-mismatch, redundant-return-value
        return autopairs.esc('<C-y>')
      end

      ---@diagnostic disable-next-line: return-type-mismatch, redundant-return-value
      return autopairs.autopairs_cr()
    end,
    desc = 'Accept completion item',
    expr = true,
    noremap = true,
    replace_keycodes = false,
    mode = { 'i' }
  },

  ----------------------------
  -- LSP inline completion accept
  ----------------------------
  {
    '<Tab>',
    function ()
      if not vim.lsp.inline_completion.get() then
        ---@diagnostic disable-next-line: return-type-mismatch, redundant-return-value
        return '<Tab>'
      end
    end,
    expr = true,
    desc = 'Accept the current inline completion',
    mode = { 'i' }
  },
  {
    '<M-CR>',
    function ()
      vim.lsp.inline_completion.get()
    end,
    expr = true,
    desc = 'Accept the current inline completion',
    mode = { 'i' }
  },

  ----------------------------
  -- Top Pickers & Explorer
  ----------------------------
  { "<leader><space>", function () require("telescope.builtin").find_files() end, desc = "Smart Find Files" },
  { "<leader>,", function () require("telescope.builtin").buffers() end, desc = "Buffers" },
  { "<leader>/", function () require("telescope.builtin").live_grep() end, desc = "Grep" },
  { "<leader>:", function () require("telescope.builtin").command_history() end, desc = "Command History" },
  { "<leader>n", function () require("telescope").extensions.messages.messages() end, desc = "Notification History" },
  {
    '<leader>e',
    function ()
      require('neo-tree.command').execute({ action = 'focus', toggle = true, reveal_force_cwd = true })
    end,
    desc = 'Toggle NeoTree',
    noremap = true,
    silent = true,
    mode = 'n'
  },

  ----------------------------
  -- find
  ----------------------------
  { "<leader>fb", function () require("telescope.builtin").buffers() end, desc = "Buffers" },
  { "<leader>ff", function () require("telescope.builtin").find_files() end, desc = "Buffers" },
  { "<leader>fg", function () require("telescope.builtin").git_files() end, desc = "Find Git Files" },
  ----------------------------
  -- git
  ----------------------------
  { "<leader>gb", function () require("telescope.builtin").git_branches() end, desc = "Find Git Files" },
  { "<leader>gl", function () require("telescope.builtin").git_commits() end, desc = "Find Git Files" },
  { "<leader>gL", function () require("telescope.builtin").git_bcommits() end, desc = "Find Git Files" },
  { "<leader>gs", function () require("telescope.builtin").git_status() end, desc = "Find Git Files" },
  { "<leader>gy", function () require("telescope.builtin").git_stash() end, desc = "Find Git Files" },
  { "<leader>gf", function () require("telescope.builtin").git_files() end, desc = "Find Git Files" },
  ----------------------------
  -- Grep
  ----------------------------
  {
    "<leader>sw",
    function () require("telescope.builtin").grep_string() end,
    desc = "Visual selection or word",
    mode = { "n", "x" }
  },
  ----------------------------
  -- search
  ----------------------------
  { '<leader>s"', function () require("telescope.builtin").registers() end, desc = "Registers" },
  { '<leader>s/', function () require("telescope.builtin").search_history() end, desc = "Search History" },
  { "<leader>sa", function () require("telescope.builtin").autocommands() end, desc = "Autocmds" },
  { "<leader>sc", function () require("telescope.builtin").command_history() end, desc = "Command History" },
  { "<leader>sC", function () require("telescope.builtin").commands() end, desc = "Commands" },
  { "<leader>sd", function () require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
  { "<leader>sh", function () require("telescope.builtin").help_tags() end, desc = "Help Pages" },
  { "<leader>sH", function () require("telescope.builtin").highlights() end, desc = "Highlights" },
  { "<leader>sj", function () require("telescope.builtin").jumplist() end, desc = "Jumps" },
  { "<leader>sk", function () require("telescope.builtin").keymaps() end, desc = "Keymaps" },
  { "<leader>sl", function () require("telescope.builtin").loclist() end, desc = "Location List" },
  { "<leader>sm", function () require("telescope.builtin").marks() end, desc = "Marks" },
  { "<leader>sM", function () require("telescope.builtin").man_pages() end, desc = "Man Pages" },
  { "<leader>sq", function () require("telescope.builtin").quickfix() end, desc = "Quickfix List" },
  { "<leader>uC", function () require("telescope.builtin").colorscheme() end, desc = "Colorschemes" },

  ----------------------------
  -- LSP
  ----------------------------
  { "gd", function () require("telescope.builtin").lsp_definitions() end, desc = "Goto Definition" },
  { "gr", function () require("telescope.builtin").lsp_references() end, nowait = true, desc = "References" },
  { "gI", function () require("telescope.builtin").lsp_implementations() end, desc = "Goto Implementation" },
  { "gy", function () require("telescope.builtin").lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
  { "gai", function () require("telescope.builtin").lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
  { "gao", function () require("telescope.builtin").lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
  { "<leader>ss", function () require("telescope.builtin").lsp_document_symbols() end, desc = "LSP Symbols" },
  { "<leader>sS", function () require("telescope.builtin").lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
  {
    "<leader>cx",
    function ()
      for _, client in ipairs(vim.lsp.get_clients()) do
        require("workspace-diagnostics").populate_workspace_diagnostics(client, 0)
      end
    end,
    desc = "Diagnostics (Workspace Diagnostics)"
  },

  ----------------------------
  -- Git Hunk Keymaps
  ----------------------------
  {
    ']c',
    function ()
      if vim.wo.diff then
        vim.cmd.normal({ ']c', bang = true })
      else
        require('gitsigns').nav_hunk('next')
      end
    end,
    desc = 'Next git hunk',
    mode = { 'n' }
  },
  {
    '[c',
    function ()
      if vim.wo.diff then
        vim.cmd.normal({ '[c', bang = true })
      else
        require('gitsigns').nav_hunk('prev')
      end
    end,
    desc = 'Previous git hunk',
    mode = { 'n' }
  },

  -- visual mode: act on the selected range
  {
    "<leader>hs",
    function () require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
    desc = "git [s]tage hunk",
    mode = { "v" }
  },
  {
    "<leader>hr",
    function () require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end,
    desc = "git [r]eset hunk",
    mode = { "v" }
  },

  -- normal mode
  { "<leader>hs", function () require("gitsigns").stage_hunk() end, desc = "git [s]tage hunk", mode = { "n" } },
  { "<leader>hr", function () require("gitsigns").reset_hunk() end, desc = "git [r]eset hunk", mode = { "n" } },
  { "<leader>hS", function () require("gitsigns").stage_buffer() end, desc = "git [S]tage buffer", mode = { "n" } },
  { "<leader>hR", function () require("gitsigns").reset_buffer() end, desc = "git [R]eset buffer", mode = { "n" } },
  { "<leader>hp", function () require("gitsigns").preview_hunk() end, desc = "git [p]review hunk", mode = { "n" } },
  { "<leader>hb", function () require("gitsigns").blame_line() end, desc = "git [b]lame line", mode = { "n" } },
  { "<leader>hd", function () require("gitsigns").diffthis() end, desc = "git [d]iff against index", mode = { "n" } },
  {
    "<leader>hD",
    function () require("gitsigns").diffthis("@") end,
    desc = "git [D]iff against last commit",
    mode = { "n" }
  },

  -- toggles
  {
    "<leader>tb",
    function () require("gitsigns").toggle_current_line_blame() end,
    desc = "[T]oggle git show [b]lame line",
    mode = { "n" }
  },
  {
    "<leader>tB",
    function ()
      -- the blame split has no close mapping of its own, so toggle it from here
      for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "gitsigns-blame" then
          vim.api.nvim_win_close(win, true)
          return
        end
      end

      require("gitsigns").blame()
    end,
    desc = "[T]oggle git show [B]lame",
    mode = { "n" }
  },
  {
    "<leader>tD",
    ---@diagnostic disable-next-line: deprecated
    function () require("gitsigns").toggle_deleted() end,
    desc = "[T]oggle git show [D]eleted",
    mode = { "n" }
  },
  {
    "<leader>tC",
    function ()
      local enable = #vim.lsp.get_clients({ bufnr = 0, name = 'copilot' }) > 0

      vim.lsp.enable("copilot", !enable)
    end,
    desc = "[T]oggle Copilot Completion",
    mode = { "n" }
  }
})

-- LSP
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function (event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    wk.add({
      {
        "<leader>cr",
        function ()
          vim.lsp.buf.rename()
        end,
        desc = "[C]ode [R]ename",
        mode = { "n" }
      },
      {
        "<leader>ca",
        function () vim.lsp.buf.code_action() end,
        desc = "[C]ode [A]ction",
        mode = { "n", "x" }
      },
      {
        "<leader>ca",
        function ()
          require("tiny-code-action").code_action({})
        end,
        desc = "[C]ode [A]ction",
        mode = { "n" }
      },
      {
        "<leader>ch",
        function () vim.lsp.buf.signature_help() end,
        desc = "[C]ode signature [H]elp",
        mode = { "n", "x" }
      },
      {
        "D",
        function () vim.diagnostic.open_float() end,
        desc = "show [D]iagnostic",
        mode = { "n" }
      }
    })

    if client ~= nil and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      wk.add({
        {
          "<leader>th",
          function () vim.cmd.LspToggleInlayHint() end,
          desc = "[T]oggle Inlay [H]ints",
          mode = { "n" }
        },
        {
          "<leader>tH",
          function ()
            -- same list the command completes with, so hidden clients stay selectable
            local names = vim.fn.getcompletion("LspToggleInlayHint ", "cmdline")

            vim.ui.select(names, { prompt = "Toggle inlay hints for:" }, function (name)
              if name then
                vim.cmd.LspToggleInlayHint(name)
              end
            end)
          end,
          desc = "[T]oggle Inlay [H]ints per client",
          mode = { "n" }
        }
      })
    end
  end
})

if vim.env.HERDR_PANE_ID == nil then
  wk.add({
    { "<c-h>", "<CMD>TmuxNavigateLeft<CR>", mode = { "n" }, silent = true },
    { "<c-j>", "<CMD>TmuxNavigateDown<CR>", mode = { "n" }, silent = true },
    { "<c-k>", "<CMD>TmuxNavigateUp<CR>", mode = { "n" }, silent = true },
    { "<c-l>", "<CMD>TmuxNavigateRight<CR>", mode = { "n" }, silent = true },
    -- { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>",    mode = "n",     silent = true },

    { "<c-h>", "<C-\\><C-n><CMD>TmuxNavigateLeft<CR>", mode = { "t" }, silent = true },
    { "<c-j>", "<C-\\><C-n><CMD>TmuxNavigateDown<CR>", mode = { "t" }, silent = true },
    { "<c-k>", "<C-\\><C-n><CMD>TmuxNavigateUp<CR>", mode = { "t" }, silent = true },
    { "<c-l>", "<C-\\><C-n><CMD>TmuxNavigateRight<CR>", mode = { "t" }, silent = true }
  })
else
  wk.add({
    {
      "<leader>hc",
      function ()
        require("herdr-context").compose()
      end,
      mode = { "n", "v" },
      desc = "Compose Herdr Context"
    },
    {
      "<leader>hay",
      function ()
        require("herdr-context").reference()
      end,
      mode = { "n", "v" },
      desc = "Send Reference to Herdr Agent"
    },
    {
      "<leader>haY",
      function ()
        require("herdr-context").send()
      end,
      mode = { "n", "v" },
      desc = "Send Context to Herdr Agent"
    },
    {
      "<leader>had",
      function ()
        require("herdr-context").diagnostics()
      end,
      mode = { "n", "v" },
      desc = "Send Diagnostics to Herdr Agent"
    },
    {
      "<leader>hat",
      function ()
        require("herdr-context").select_target()
      end,
      desc = "Select Herdr Agent"
    },
    {
      "<leader>ha",
      function ()
        require("herdr-context").agents()
      end,
      desc = "Toggle Herdr Agents"
    },
    {
      "<leader>har",
      function ()
        require("herdr-context").refresh()
      end,
      desc = "Refresh Herdr Agents"
    }
  })
end
