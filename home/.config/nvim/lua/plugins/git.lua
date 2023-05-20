return {
	-----------------------------------------------------
	-- git
	-----------------------------------------------------

	{ "iberianpig/tig-explorer.vim" },

	{
		"tpope/vim-fugitive",
		config = function()
			vim.api.nvim_set_keymap("n", "gb", "<cmd>Git blame<CR>", { noremap = true, silent = true })
			-- NOTE: netrw を無効化した場合は、GBrowe を利用するのに以下の command が必要になる
			-- vim.cmd([[command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)]])
		end,
	},

	-- github extenstions for fugitive
	{ "tpope/vim-rhubarb" },

	{
		"TimUntersberger/neogit",
		config = function()
			local neogit = require("neogit")

			if neogit then
				neogit.setup({
					disable_builtin_notifications = false,
					commit_popup = {
						kind = "split",
					},
				})
			end
		end,
	},

	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

	{
		"akinsho/git-conflict.nvim",
		version = "*",
		config = function()
			require("git-conflict").setup({
				default_mappings = true, -- disable buffer local mapping created by this plugin
				default_commands = true, -- disable commands created by this plugin
				disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
				highlights = {
					-- They must have background color, otherwise the default color will be used
					incoming = "DiffText",
					current = "DiffAdd",
				},
			})
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("gitsigns").setup({
				signs = {
					add = {
						hl = "GitSignsAdd",
						text = "│",
						numhl = "GitSignsAddNr",
						linehl = "GitSignsAddLn",
					},
					change = {
						hl = "GitSignsChange",
						text = "│",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "_",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "‾",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "~",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				keymaps = {
					-- Default keymap options
					noremap = true,
					["n ]c"] = {
						expr = true,
						"&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'",
					},
					["n [c"] = {
						expr = true,
						"&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'",
					},
					-- ['n <leader>hs'] = '<cmd>Gitsigns stage_hunk<CR>',
					-- ['v <leader>hs'] = ':Gitsigns stage_hunk<CR>',
					-- ['n <leader>hu'] = '<cmd>Gitsigns undo_stage_hunk<CR>',
					-- ['n <leader>hr'] = '<cmd>Gitsigns reset_hunk<CR>',
					-- ['v <leader>hr'] = ':Gitsigns reset_hunk<CR>',
					-- ['n <leader>hR'] = '<cmd>Gitsigns reset_buffer<CR>',
					-- ['n <leader>hp'] = '<cmd>Gitsigns preview_hunk<CR>',
					-- ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line{full=true}<CR>',
					-- ['n <leader>hS'] = '<cmd>Gitsigns stage_buffer<CR>',
					-- ['n <leader>hU'] = '<cmd>Gitsigns reset_buffer_index<CR>',

					-- -- Text objects
					-- ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
					-- ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
				},
				watch_gitdir = { interval = 1000, follow_files = true },
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter_opts = { relative_time = false },
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000,
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
				yadm = { enable = false },
			})
		end,
		-- version = 'release' -- To use the latest release
	},

	{
		"samoshkin/vim-mergetool",
		config = function()
			vim.api.nvim_exec(
				[[
          let g:mergetool_layout = 'lmr'
          let g:mergetool_prefer_revision = 'local'
        ]],
				false
			)
		end,
	},

	{
		"pwntester/octo.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},
}
