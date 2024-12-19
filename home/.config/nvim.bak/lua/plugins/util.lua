return {
	-- path copy utitlity ex`:CopyPath`
	{ "vim-scripts/copypath.vim" },

	-- text operator
	{ "tpope/vim-surround" },

	{ "machakann/vim-sandwich" },

	-- faster scroll
	{
		"PHSix/faster.nvim",
		event = { "VimEnter *" },
		keys = {
			{ "j", "<Plug>(faster_move_j)" },
			{ "k", "<Plug>(faster_move_k)" },
		},
		config = function()
		end,
	},

	-- window resizer
	{
		"simeji/winresizer",
		config = function()
			vim.g.winresizer_start_key = "<C-E>"
		end,
	},

	{
		"uga-rosa/translate.nvim",
		config = function()
			require("translate").setup({
				lang = "en",
				winhl = "Normal:Normal",
			})
		end
	},

	{
		"jellydn/hurl.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter"
		},
		ft = "hurl",
		opts = {
			-- Show debugging info
			debug = false,
			-- Show notification on run
			show_notification = false,
			-- Show response in popup or split
			mode = "split",
			-- Default formatter
			formatters = {
				json = { 'jq' }, -- Make sure you have install jq in your system, e.g: brew install jq
				html = {
					'prettier', -- Make sure you have install prettier in your system, e.g: npm install -g prettier
					'--parser',
					'html',
				},
			},
		},
		-- keys = {
		-- 	-- Run API request
		-- 	{ "<leader>A",  "<cmd>HurlRunner<CR>",        desc = "Run All requests" },
		-- 	{ "<leader>a",  "<cmd>HurlRunnerAt<CR>",      desc = "Run Api request" },
		-- 	{ "<leader>te", "<cmd>HurlRunnerToEntry<CR>", desc = "Run Api request to entry" },
		-- 	{ "<leader>tm", "<cmd>HurlToggleMode<CR>",    desc = "Hurl Toggle Mode" },
		-- 	{ "<leader>tv", "<cmd>HurlVerbose<CR>",       desc = "Run Api in verbose mode" },
		-- 	-- Run Hurl request in visual mode
		-- 	{ "<leader>h",  ":HurlRunner<CR>",            desc = "Hurl Runner",             mode = "v" },
		-- },
	},

	{
		"notomo/waitevent.nvim",
		config = function()
			vim.env.GIT_EDITOR = require("waitevent").editor({
				done_events = {},
				cancel_events = {},
			})
		end
	}
}
