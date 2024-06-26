-- local lazy = require("lua.configg.lazy")

-- local plugins_sets = {
-- 	{
-- 		{ "nvim-lua/plenary.nvim" },

-- 		{ "vim-denops/denops.vim" },

-- 		-- neovim buffer delete improved
-- 		{
-- 			"famiu/bufdelete.nvim",
-- 			lazy = false,
-- 			keys = {
-- 				-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/FAQ#bdelete-makes-the-tree-spans-the-whole-window-how-do-i-prevent-it
-- 				{ "<space>x", ":Bdelete<cr>" },
-- 			}
-- 		},

-- 		-- tmux
-- 		{ "christoomey/vim-tmux-navigator" },

-- 		-- todo comments highlight
-- 		{
-- 			"folke/todo-comments.nvim",
-- 			dependencies = "nvim-lua/plenary.nvim",
-- 			config = function()
-- 				require("todo-comments").setup({})
-- 			end,
-- 		},
-- 	},

-- 	-- color highlight plugins
-- 	require("plugins/colorshema"),

-- 	-- util plugins
-- 	require("plugins/util"),

-- 	-- uiplugins
-- 	require("plugins/ui"),

-- 	-- finder plugins
-- 	require("plugins/finder"),

-- 	-- lsp plugins
-- 	require("plugins/cmp"),

-- 	-- lsp plugins
-- 	require("plugins/lsp"),

-- 	-- debugger plugins
-- 	require("plugins/debugger"),

-- 	-- git plugins
-- 	require("plugins/git"),

-- 	-- terraform plugins
-- 	require("plugins/terraform"),

-- 	-- test plugins
-- 	require("plugins/test"),

-- 	-- markdown plugins
-- 	require("plugins/markdown"),

-- 	-- plugin development
-- 	require("plugins/dev"),
-- }

-- local plugins = {}

-- for _, plugins_set in pairs(plugins_sets) do
-- 	vim.list_extend(plugins, plugins_set)
-- end

-- lazy.setup(plugins)
