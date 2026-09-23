vim.loader.enable()

require('options')

require("plugins/tokyonight")

require("plugins/mini")
require("plugins/nvim-autopairs")
require("plugins/nvim-surround")

require("plugins/nvim-treesitter")
require("plugins/nvim-lsp-file-operations")
require("plugins/nvim-lspconfig")
require("plugins/mason")
require("plugins/schemastore")
require("plugins/lazydev")
require("plugins/kakehashi")
require("plugins/react-compiler-maker")
require("plugins/minuet-ai")
-- require("plugins/llm")
require("plugins/conform")

vim.api.nvim_create_autocmd('VimEnter', {
  once = true,
  callback = function ()
    vim.schedule(function ()
      require("plugins/which-key")

      -- typescript lsp plugin
      require("plugins/twoslash-queries")
      require("plugins/ts-error-translator")
      require("plugins/tsc")

      require("plugins/nvim-web-devicons")
      require("plugins/neo-tree")
      require("plugins/bufferline")
      require("plugins/telescope")
      require("plugins/nvim-pack-ui")
      require("plugins/helpview")
      require("plugins/lspkind")
      require("plugins/lualine")
      require("plugins/tiny-cmdline")
      require("plugins/tiny-code-action")
      require("plugins/tiny-inline-diagnostic")
      require("plugins/translate")
      require("plugins/workspace-diagnostics")
      require("plugins/smooth-resize")
      require("plugins/quicker")

      require("plugins/gitsigns")
      require("plugins/diffbandit")
      require("plugins/diffview-plus")

      if vim.env.HERDR_PANE_ID ~= nil then
        require("plugins/nvim-herdr-navigation")
        require("plugins/herdr-context")
      else
        require("plugins/vim-tmux-navigator")
      end

      require('lsp')

      require('keymaps')
    end)
  end
})
