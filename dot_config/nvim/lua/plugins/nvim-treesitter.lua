return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",

    config = function()
      require("nvim-treesitter").setup({})

      -- fold に treesitter を使用
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

      -- indent に treesitter を使用
      vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

      -- 自動ハイライトの有効化
      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
        pattern = { '<filetype>' },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end
  }
}
