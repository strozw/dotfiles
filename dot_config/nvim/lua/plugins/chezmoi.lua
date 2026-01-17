return {
  {
    'alker0/chezmoi.vim',
    lazy = false,
    init = function()
      -- This option is required.
      vim.g['chezmoi#use_tmp_buffer'] = true
      -- add other options here if needed.
    end,
  },
  {
    'xvzc/chezmoi.nvim',
    dependencies = { 'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      require("chezmoi").setup({
        edit = {
          watch = true,
          force = false,
          ignore_patterns = {
            "run_onchange_.*",
            "run_once_.*",
            "%.chezmoiignore",
            "%.chezmoitemplate",
            -- Add custom patterns here
          },
        },
      })

      vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
        pattern = { os.getenv("HOME") .. "/.local/share/chezmoi/*" },
        callback = function(ev)
          local bufnr = ev.buf
          local edit_watch = function()
            require("chezmoi.commands.__edit").watch(bufnr)
          end
          vim.schedule(edit_watch)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyUpdate",
        group = vim.api.nvim_create_augroup("chezmoi_update_lock", { clear = true }),
        callback = function()
          local lock_file = vim.fn.stdpath("config") .. "/lazy-lock.json"
          vim.fn.system("chezmoi re-add " .. vim.fn.shellescape(lock_file))
        end,
      })
    end
  }
}
