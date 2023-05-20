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
		config = function()
			local faster = require("faster")

			if faster then
				vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
				vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
			end
		end,
	},

	-- window resizer
	{
		"simeji/winresizer",
		config = function()
			vim.g.winresizer_start_key = "<C-E>"
		end,
	},
}
