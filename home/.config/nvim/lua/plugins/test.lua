return {
	-- test
	{
		"vim-test/vim-test",
		config = function()
			vim.api.nvim_exec(
				[[
					let test#strategy= "neovim"
					let test#neovim#term_position = "vert"
					let test#neovim#start_normal = 1 " if using neovim strategy
					let test#basic#start_normal = 1 " if using basic strategy

					let g:test#runner_commands = ['Jest', 'Playwright']
				]],
				false
			)
		end,
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"vim-test/vim-test",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-vim-test",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
			{
				'mrcjkb/rustaceanvim',
				version = '^4', -- Recommended
				ft = { 'rust' },
			},
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({}),
					-- require("neotest-python")({
					-- 	dap = { justMyCode = false },
					-- }),
					-- require("neotest-plenary"),
					require('rustaceanvim.neotest'),
					require("neotest-vim-test")({
						-- ignore_file_types = { "python", "vim", "lua" },
					}),
				},
			})

			local opts = { noremap = true, silent = true }

			vim.api.nvim_set_keymap("n", "tn", '<cmd>lua require("neotest").run.run()<CR>', opts)
			vim.api.nvim_set_keymap("n", "tc", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
			vim.api.nvim_set_keymap("n", "td", '<cmd>lua require("neotest").run.run({ strategy = "dap" })<CR>', opts)
			vim.api.nvim_set_keymap("n", "ts", '<cmd>lua require("neotest").run.stop()<CR>', opts)
			vim.api.nvim_set_keymap("n", "ta", '<cmd>lua require("neotest").run.attach()<CR>', opts)
			vim.api.nvim_set_keymap("n", "to", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', opts)
			vim.api.nvim_set_keymap("n", "tt", '<cmd>lua require("neotest").summary.toggle()<CR>', opts)
		end,
	},
}
