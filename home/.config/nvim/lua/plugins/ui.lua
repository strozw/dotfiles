return {

	-- symbol view
	{ "liuchengxu/vista.vim" },

	-----------------------------------------------------
	-- vim ui improvements
	-----------------------------------------------------
	{
		"stevearc/dressing.nvim",
		dependencies = {
			"nvim-telescope/telescope.nvim",
		},
		config = function()
			require("dressing").setup({
				select = {
					telescope = require("telescope.themes").get_cursor({
						layout_config = {
							width = 100,
							height = 20,
						},
					}),
				},
			})
		end,
	},

	-----------------------------------------------------
	-- tabbar
	-----------------------------------------------------
	{
		"romgrk/barbar.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			vim.api.nvim_set_keymap("n", "<C-n>", ":BufferNext<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "<C-p>", ":BufferPrev<CR>", { noremap = true, silent = true })
			vim.api.nvim_exec([[ nnoremap <silent> <space>x :BufferClose<CR> ]], false)
			vim.api.nvim_exec(
				[[
					let g:fern#default_hidden=1
					let g:fern#width=50
					let g:fern#renderer='nerdfont'

					function! FernInit() abort
						nmap <buffer> <C-L> :TmuxNavigateRight<CR>

						set nonumber
					endfunction

					augroup FernEvents
						autocmd!
						autocmd FileType fern call FernInit()
					augroup END
				]],
				false
			)
		end,
	},

	-----------------------------------------------------
	-- status line
	-----------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-lua/lsp-status.nvim",
		},
		config = function()
			local lualine = require("lualine")

			if lualine then
				lualine.setup({
					options = {
						icons_enabled = true,
						-- theme = 'auto',
						theme = "tokyonight",
						-- theme = 'material-nvim',
						component_separators = { left = " ", right = " " },
						section_separators = { left = " ", right = " " },
						always_divide_middle = true,
					},
					sections = {
						lualine_a = { "mode" },
						lualine_b = {
							"branch",
							"diff",
							{ "diagnostics", sources = { "coc" } },
						},
						lualine_c = { "g:coc_status", "require'lsp-status'.status()", "filename" },
						lualine_x = { "encoding", "fileformat", "filetype" },
						lualine_y = { "progress" },
						lualine_z = { "location" },
					},
					inactive_sections = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = { "filename" },
						lualine_x = { "location" },
						lualine_y = {},
						lualine_z = {},
					},
					tabline = {},
					extensions = { "fern" },
				})
			end
		end,
	},

	-----------------------------------------------------
	-- filer
	-----------------------------------------------------
	{
		"lambdalisue/fern.vim",
		dependencies = {
			{
				"lambdalisue/fern-renderer-nerdfont.vim",
				dependencies = { "lambdalisue/nerdfont.vim" },
			},

			{ "lambdalisue/fern-git-status.vim" },

			-- { "lambdalisue/fern-hijack.vim" },

			{ "lambdalisue/glyph-palette.vim" },
		},
		config = function()
			-- vim.api.nvim_set_keymap(
			-- 	"n",
			-- 	"<F2>",
			-- 	":Fern . -drawer -width=50 -toggle<CR>",
			-- 	{ noremap = true, silent = true }
			-- )
			-- vim.api.nvim_set_keymap(
			-- 	"n",
			-- 	"ss",
			-- 	":Fern . -drawer -width=50 -reveal=%<CR><CR>",
			-- 	{ noremap = true, silent = true }
			-- )
			vim.g.fern_disable_startup_warnings = 1
		end,
	},

	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			-- 以下を行うと :GBrowse が動作しなくなる
			-- disable netrw at the very start of your init.lua (strongly advised)
			-- vim.g.loaded_netrw = 1
			-- vim.g.loaded_netrwPlugin = 1

			-- set termguicolors to enable highlight groups
			vim.opt.termguicolors = true

			-- OR setup with some options
			require("nvim-tree").setup({
				-- sort_by = "case_sensitive",
				-- renderer = {
				-- 	group_empty = true,
				-- },
				-- filters = {
				-- 	dotfiles = true,
				-- },
				trash = {
					cmd = "gomi",
				},
				view = {
					width = 50,
					float = {
						enable = false,
						quit_on_focus_loss = true,
						open_win_config = {
							relative = "editor",
							border = "rounded",
							width = 30,
							height = 30,
							row = 1,
							col = 1,
						},
					},
				},
			})

			vim.api.nvim_set_keymap("n", "<F2>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
			vim.api.nvim_set_keymap("n", "ss", ":NvimTreeFindFile<CR>", { noremap = true, silent = true })
		end,
	},

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-tree/nvim-tree.lua" },
		},
	},

	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("noice").setup()
	-- 	end,
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- },

	-- zen mode
	{
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup({
				-- your config goes here
				-- or just leave it empty :)
			})
		end,
	}
}
