-- Build the native sorter on install/update (must be defined before vim.pack.add)
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function (ev)
    local name, kind = ev.data.spec.name, ev.data.kind

    if name == 'telescope-fzf-native.nvim' and (kind == 'install' or kind == 'update') then
      vim.system({ 'make' }, { cwd = ev.data.path }):wait()
    end
  end
})

vim.pack.add({
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  "https://github.com/d4wns-l1ght/telescope-messages.nvim"
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
    -- show hidden (dotfiles) in live_grep / grep_string
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden"
    },
    layout_config = {
      prompt_position = "top",
      width = 0.9
    },
    -- borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
    borderchars = { ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ' },
    mappings = {
      i = {
        ["<M-p>"] = actions_layout.toggle_preview
      },
      n = {
        ["<M-p>"] = actions_layout.toggle_preview
      }
    }
  },
  pickers = {
    -- show hidden (dotfiles) in file pickers
    find_files = { hidden = true, no_ignore = false }
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_dropdown()
    },
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    }
  }
})

-- Load extensions only when their plugin is available (pcall also covers an unbuilt fzf-native)
for _, ext in ipairs({ "ui-select", "fzf", "messages" }) do
  pcall(telescope.load_extension, ext)
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'TelescopePrompt',
  callback = function (event)
    vim.bo[event.buf].autocomplete = false
  end
})
