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
      width = 0.9,
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
