return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "lewis6991/gitsigns.nvim" },
    opts = function(_, opts)
      local null_ls = require("null-ls")

      opts.sources = opts.sources or {}

      local remove_sources = { "markdownlint-cli2" }

      opts.sources = vim.tbl_filter(function(source)
        return not vim.tbl_contains(remove_sources, source.name)
      end, opts.sources)

      -- table.insert(opts.sources, null_ls.builtins.code_actions.gitsigns)

      table.insert(opts.sources, require("custom.none-ls.formatting.biome_check"))

      return opts
    end,
  },
}
