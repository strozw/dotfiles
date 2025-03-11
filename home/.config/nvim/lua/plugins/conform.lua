return {
  {
    "stevearc/conform.nvim",
    -- opts = function(_, opts)
    --   opts.formatters_by_ft = opts.formatters_by_ft or {}
    --
    --   opts.formatters_by_ft["markdown"] = {}
    --   opts.formatters_by_ft["markdown.mdx"] = {}
    --   opts.formatters_by_ft["php"] = {}
    --
    --   for _, ft in ipairs({
    --     "html",
    --     "json",
    --     "css",
    --     "graphql",
    --     "jsonc",
    --     "vue",
    --     "javascript",
    --     "typescript",
    --     "javascriptreact",
    --     "typescriptreact",
    --   }) do
    --     opts.formatters_by_ft[ft] = opts.formatters_by_ft[ft] or {}
    --
    --     opts.formatters_by_ft[ft] = vim.tbl_filter(function(formatter)
    --       return formatter ~= "biome"
    --     end, opts.formatters_by_ft[ft])
    --
    --     table.insert(opts.formatters_by_ft[ft], "biome-check")
    --   end
    --
    --   opts.formatters = opts.formatters or {}
    --   opts.formatters["biome-check"] = {
    --     require_cwd = true,
    --   }
    -- end,
  },
}
