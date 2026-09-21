vim.cmd('packadd! nvim.undotree')
vim.cmd('packadd! nvim.difftool')

require("plugins/tokyonight")

require("plugins/mini")
require("plugins/nvim-autopairs")
require("plugins/nvim-surround")

require("plugins/which-key")
-- require("plugins/nvim-notify")
-- require("plugins/fidget")

require("plugins/nvim-lsp-file-operations")
require("plugins/nvim-lspconfig")
require("plugins/kakehashi")
require("plugins/conform")
require("plugins/lazydev")
require("plugins/minuet-ai")
require("plugins/react-compiler-maker")

vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function()
    vim.schedule(function()
      require("plugins/nvim-treesitter")
      require("plugins/nvim-web-devicons")
      require("plugins/neo-tree")
      require("plugins/bufferline")
      require("plugins/telescope")
      require("plugins/nvim-pack-ui")
      require("plugins/gitsigns")
      require("plugins/helpview")
      require("plugins/lspkind")
      require("plugins/lualine")
      require("plugins/tiny-cmdline")
      require("plugins/tiny-code-action")
      require("plugins/tiny-inline-diagnostic")
      require("plugins/tsc")
      require("plugins/translate")
      require("plugins/workspace-diagnostics")
      require("plugins/ts-error-translator")
      require("plugins/smooth-resize")
      require("plugins/quicker")

      if vim.env.HERDR_PANE_ID ~= nil then
        require("plugins/nvim-herdr-navigation")
        require("plugins/herdr-context")
      else
        require("plugins/vim-tmux-navigator")
      end
    end)
  end
})
