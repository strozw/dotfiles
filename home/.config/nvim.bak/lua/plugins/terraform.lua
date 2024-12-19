return {
	-- terraform
	{
		"hashivim/vim-terraform",
		config = function()
			vim.api.nvim_exec(
				[[
					let g:terraform_fmt_on_save = 1
				]],
				false
			)
		end,
	},
}
