return {
	-----------------------------------------------------
	-- git
	-----------------------------------------------------

	-- { "iberianpig/tig-explorer.vim" },

	{
		"tpope/vim-fugitive",
		lazy = false,
		keys = {
			{ "gb", "<cmd>Git blame<CR>" }
		},
		config = function()
			-- NOTE: netrw を無効化した場合は、GBrowe を利用するのに以下の command が必要になる
			-- vim.cmd([[command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)]])
		end,
	},

	-- github extenstions for fugitive
	{ "tpope/vim-rhubarb" },

	-- {
	-- 	"NeogitOrg/neogit",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim", -- required
	-- 		"sindrets/diffview.nvim", -- optional - Diff integration

	-- 		-- Only one of these is needed, not both.
	-- 		"nvim-telescope/telescope.nvim", -- optional
	-- 		"ibhagwan/fzf-lua",           -- optional
	-- 	},
	-- 	config = function()
	-- 		require("neogit").setup({
	-- 			disable_builtin_notifications = false,
	-- 			commit_popup = {
	-- 				kind = "split",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim" },

	-- NOTE: buggy?
	-- {
	-- 	"akinsho/git-conflict.nvim",
	-- 	version = "*",
	-- 	config = function()
	-- 		require("git-conflict").setup({
	-- 			default_mappings = true, -- disable buffer local mapping created by this plugin
	-- 			default_commands = true, -- disable commands created by this plugin
	-- 			disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
	-- 			highlights = {
	-- 				-- They must have background color, otherwise the default color will be used
	-- 				incoming = "DiffText",
	-- 				current = "DiffAdd",
	-- 			},
	-- 		})
	-- 	end,
	-- },

	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require('gitsigns').setup {
				signs                        = {
					add          = { text = '┃' },
					change       = { text = '┃' },
					delete       = { text = '_' },
					topdelete    = { text = '‾' },
					changedelete = { text = '~' },
					untracked    = { text = '┆' },
				},
				signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir                 = {
					follow_files = true
				},
				auto_attach                  = true,
				attach_to_untracked          = false,
				current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts      = {
					virt_text = true,
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
					virt_text_priority = 100,
				},
				current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
				sign_priority                = 6,
				update_debounce              = 100,
				status_formatter             = nil, -- Use default
				max_file_length              = 40000, -- Disable if file is longer than this (in lines)
				preview_config               = {
					-- Options passed to nvim_open_win
					border = 'single',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
			}
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

	-- {
	-- 	"pwntester/octo.nvim",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-telescope/telescope.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 	},
	-- 	config = function()
	-- 		require("octo").setup()
	-- 	end,
	-- },
}
