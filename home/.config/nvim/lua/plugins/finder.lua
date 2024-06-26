return {
	-- replace in project
	{ "dyng/ctrlsf.vim" },

	{ "thinca/vim-qfreplace" },

	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
	},

	-- fuzzy finder
	-- { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
	-- "junegunn/fzf.vim",

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-dap.nvim",
			"folke/noice.nvim",
		},
		config = function()
			local telescope = require("telescope")

			if telescope then
				telescope.load_extension("noice")
				telescope.load_extension("fzf")
				telescope.load_extension("dap")

				telescope.setup({
					defaults = {
						theme = "cursor",
						sorting_strategy = "ascending",
						layout_config = { prompt_position = "top" },
						mappings = {
							i = {
								["<F2>"] = require("telescope.actions.layout").toggle_preview,
							},
						},
						vimgrep_arguments = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							-- "--hidden",
							-- "--ignore-vcs",
						},
					},
					pickers = {
						find_files = {
							find_command = {
								"rg",
								"--files",
								"--hidden",
								"--glob",
								"!**/.git/*"
							},
							hidden = true,
							no_ignore = false,
						},
					},
					extensions = {
						fzf = {
							fuzzy = true,            -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case", -- or "ignore_case" or "respect_case"
							-- the default case_mode is "smart_case"
						},
						-- ["ui-select"] = {
						-- 	require("telescope.themes").get_cursor {}
						-- }
					},
				})

				vim.api.nvim_exec(
					[[
        nmap <Space>o :Telescope find_files<CR>
        nmap <Space>f :Telescope find_files<CR>
        nmap <Space>b :Telescope buffers<CR>
        nmap <Space>s :Telescope live_grep<CR>
        nmap <Space>ll :Telescope loclist<CR>
        nmap <Space>ln :Telescope jumplist<CR>
        nmap <Space>gf :Telescope git_files<CR>
        nmap <Space>gs :Telescope git_status<CR>
        nmap <Space>gb :Telescope git_bcommits<CR>
        nmap <Space>gla :Telescope git_commits<CR>
        nmap <C-G> :Telescope live_grep<CR>
      ]],
					false
				)
			end
		end,
	},
}
