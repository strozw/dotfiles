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
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>",     mode = "n" },
			{ "<c-j>",  "<cmd><C-U>TmuxNavigateDown<cr>",     mode = "n" },
			{ "<c-k>",  "<cmd><C-U>TmuxNavigateUp<cr>",       mode = "n" },
			{ "<c-l>",  "<cmd><C-U>TmuxNavigateRight<cr>",    mode = "n" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", mode = "n" },
			{ "<c-h>",  "<c-\\><C-n>:TmuxNavigateLeft<cr>",   mode = "t" },
			{ "<c-j>",  "<c-\\><C-n>:TmuxNavigateDown<cr>",   mode = "t" },
			{ "<c-k>",  "<c-\\><C-n>:TmuxNavigateUp<cr>",     mode = "t" },
			{ "<c-l>",  "<c-\\><C-n>:TmuxNavigateRight<cr>",  mode = "t" },
		},
	},

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
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
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
