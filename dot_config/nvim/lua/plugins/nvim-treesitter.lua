return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    branch = "main",
    build = ":TSUpdate",

    config = function()
      local treesitter = require("nvim-treesitter")

      treesitter.setup({})

      treesitter.install({
        "angular",
        "astro",
        "bash",
        "blade",
        "diff",
        "caddy",
        "comment",
        "css",
        "csv",
        "dockerfile",
        "ecma",
        "editorconfig",
        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "gpg",
        "hcl",
        "html",
        "html_tags",
        "http",
        "hurl",
        "javascript",
        "jq",
        "jsdoc",
        "json",
        "json5",
        "jsx",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "mermaid",
        "nginx",
        "pem",
        "php",
        "po",
        "prisma",
        "phpdoc",
        "python",
        "regex",
        "ruby",
        "rust",
        "scss",
        "ssh_config",
        "sql",
        "svelte",
        "terraform",
        "tmux",
        "toml",
        "tsv",
        "tsx",
        "typescript",
        "typst",
        "yaml",
        "vim",
        "vimdoc",
        "xml",
        "zsh",
      })

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
