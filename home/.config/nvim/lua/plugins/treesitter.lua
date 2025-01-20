return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.highlight = opts.highlight or {}

      vim.tbl_extend("force", opts.highlight, {
        enable = false,
        disable = { "markdown", "typescript", "markdown_inline" },
      })

      vim.tbl_extend("force", opts, {
        auto_install = false,
        ensure_installed = {},
      })

      local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

      parser_config.blade = {
        install_info = {
          url = "https://github.com/EmranMR/tree-sitter-blade",
          files = { "src/parser.c" },
          branch = "main",
        },
        filetype = "blade",
      }

      vim.api.nvim_create_augroup("BladeFiltypeRelated", {})

      vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
        group = "BladeFiltypeRelated",
        pattern = { "*.blade.php" },
        callback = function()
          vim.o.filetype = "blade"
        end,
      })
    end,
  },
}
