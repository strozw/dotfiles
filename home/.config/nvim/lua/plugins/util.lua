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
	}
}
