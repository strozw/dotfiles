return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<F2>", "<cmd>Neotree toggle<cr>" },
    },
    opts = {
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
      close_if_last_window = true,
      enable_git_status = true,
      enable_diagnostics = true,
      open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
      default_component_configs = {},
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_hidden = false,
          hide_gitignored = false,
        },
      },
    },
  },
}
