return {
	-- markdown highlight
	{
		'MeanderingProgrammer/markdown.nvim',
		name = 'render-markdown',         -- Only needed if you have another plugin named markdown.nvim
		dependencies = {
			'nvim-treesitter/nvim-treesitter', -- Mandatory
			'nvim-tree/nvim-web-devicons',  -- Optional but recommended
		},
		ft = { "markdown", "Avante" },
		opts = {
			file_types = { "markdown", "Avante" },
		},
	},

	-- markdown preview
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				app = { 'chromium', '--new-window' }
			})

			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
		end,
	},
}
