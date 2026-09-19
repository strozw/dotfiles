vim.cmd('packadd! nvim.undotree')
vim.cmd('packadd! nvim.difftool')

require("plugins/tokyonight")

require("plugins/which-key")
require("plugins/nvim-notify")

require("plugins/mini")
require("plugins/nvim-autopairs")
require("plugins/nvim-surround")

require("plugins/nvim-lsp-file-operations")
require("plugins/nvim-lspconfig")
require("plugins/lazydev")
require("plugins/conform")
require("plugins/kakehashi")

if vim.env.HERDR_PANE_ID ~= nil then
  require("plugins/nvim-herdr-navigation")
  require("plugins/herdr-context")
else
  -- require("plugins/vim-tmux-navigator")
end

vim.api.nvim_create_autocmd('UIEnter', {
  once = true,
  callback = function()
    require("plugins/nvim-treesitter")

    require("plugins/nvim-web-devicons")
    require("plugins/bufferline")
    require("plugins/neo-tree")
    -- require("plugins/nvim-tree")
    require("plugins/telescope")
    require("plugins/nvim-pack-ui")
    require("plugins/gitsigns")
    require("plugins/helpview")
    require("plugins/lspkind")
    require("plugins/lualine")
    require("plugins/tiny-cmdline")
    require("plugins/tiny-code-action")
    require("plugins/tiny-inline-diagnostic")
    -- require("plugins/flash")
    require("plugins/tsc")
    require("plugins/translate")
    require("plugins/workspace-diagnostics")
    require("plugins/ts-error-translator")
    require("plugins/smooth-resize")
    require("plugins/quicker")
    require("plugins/react-compiler-maker")
  end
})
