return {
  {
    "Davidyz/VectorCode",
    enabled = false,
    version = "*", -- optional, depending on whether you're on nightly or release
    build = "pipx upgrade vectorcode",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("vectorcode").setup({
        async_opts = {
          timeout_ms = 5000,
          single_job = false,
          debounce = 10,
          events = { "BufWritePost", "InsertEnter", "BufReadPost" },
          exclude_this = true,
          n_query = 1,
          notify = false,
          query_cb = require("vectorcode.utils").make_surrounding_lines_cb(-1),
          run_on_register = false,
        },
        async_backend = "lsp",
        exclude_this = true,
        n_query = 1,
        notify = true,
        timeout_ms = 5000,
        on_setup = {
          update = false, -- set to true to enable update when `setup` is called.
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function()
          local cacher = require("vectorcode.config").get_cacher_backend()
          local bufnr = vim.api.nvim_get_current_buf()
          cacher.async_check("config", function()
            cacher.register_buffer(bufnr, {
              n_query = 10,
            })
          end, nil)
        end,
        desc = "Register buffer for VectorCode",
      })
    end,
  },
}
