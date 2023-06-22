local lazy = require("lazy")

local plugins_sets = {
	{
		-- Performance
		{ "lewis6991/impatient.nvim" },

		{ "nvim-lua/plenary.nvim" },

		{ "vim-denops/denops.vim" },

		-- buffer delete imple
		{ "famiu/bufdelete.nvim" },

		-- tmux
		{ "christoomey/vim-tmux-navigator" },

		-- todo comments highlight
		{
			"folke/todo-comments.nvim",
			dependencies = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup({})
			end,
		},
	},

	-- color highlight plugins
	require("plugins/colorshema"),

	-- util plugins
	require("plugins/util"),

	-- uiplugins
	require("plugins/ui"),

	-- finder plugins
	require("plugins/finder"),

	-- lsp plugins
	require("plugins/cmp"),

	-- lsp plugins
	require("plugins/lsp"),

	-- debugger plugins
	require("plugins/debugger"),

	-- git plugins
	require("plugins/git"),

	-- terraform plugins
	require("plugins/terraform"),

	-- test plugins
	require("plugins/test"),

	-- markdown plugins
	require("plugins/markdown"),
}

local plugins = {}

for _, plugins_set in pairs(plugins_sets) do
	vim.list_extend(plugins, plugins_set)
end

lazy.setup(plugins)
