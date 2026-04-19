---@module vim

require("config.options")

-- setup lazy.nvim
require("config.lazy")

require("config.keymaps")

require("config.autocmd")

vim.cmd([[colorscheme tokyonight-night]])
