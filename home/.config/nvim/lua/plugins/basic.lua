return {
	{ "nvim-lua/plenary.nvim" },

	{ "vim-denops/denops.vim" },

	-- neovim buffer delete improved
	{
		"famiu/bufdelete.nvim",
		lazy = false,
		keys = {
			-- https://github.com/nvim-neo-tree/neo-tree.nvim/wiki/FAQ#bdelete-makes-the-tree-spans-the-whole-window-how-do-i-prevent-it
			{ "<space>x", ":Bdelete<cr>" },
		}
	},

	-- tmux
	{ "christoomey/vim-tmux-navigator" },

	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			triggers_blacklist = {
				n = { "d", "y" }
			}
		}
	},

	{
		"dstein64/vim-startuptime",
		-- lazy-load on a command
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},
}
