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

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local highlight = {
				"RainbowBlue",
				"RainbowCyan",
				"RainbowViolet",
				"RainbowGreen",
				-- "RainbowYellow",
				-- "RainbowOrange",
				-- "RainbowRed",
			}

			local hooks = require "ibl.hooks"

			-- create the highlight groups in the highlight setup hook, so they are reset
			-- every time the colorscheme changes
			hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
			end)

			require("ibl").setup {
				indent = {
					-- highlight = highlight,
					char = '│',
				},
				scope = {
					-- highlight = highlight,
				},
			}
		end,
	},

	-----------------------------------------------------
	-- tabbar
	-----------------------------------------------------
	-- {
	-- 	"romgrk/barbar.nvim",
	-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- 	config = function()
	-- 		vim.api.nvim_set_keymap("n", "<C-n>", ":BufferNext<CR>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap("n", "<C-p>", ":BufferPrev<CR>", { noremap = true, silent = true })
	-- 		vim.api.nvim_exec([[ nnoremap <silent> <space>x :BufferClose<CR> ]], false)
	-- 	end,
	-- },

	-- {
	-- 	"akinsho/bufferline.nvim",
	-- 	dependencies = 'nvim-tree/nvim-web-devicons',
	-- 	config = function()
	-- 		vim.opt.termguicolors = true
	-- 		local bufferline = require("bufferline")

	-- 		bufferline.setup {
	-- 			options = {
	-- 				mode = "buffers",
	-- 				style_preset = bufferline.style_preset.minimal,
	-- 				-- separator_style = { "", "" },
	-- 				separator_style = "slant",
	-- 				-- themable = true,
	-- 				-- numbers = "ordinal",
	-- 				-- indicator = {
	-- 				-- 	style = "udnerline"
	-- 				-- },
	-- 				diagnostics = "nvim_lsp",
	-- 				highlights = {
	-- 					fill = {
	-- 						fg = '#000000',
	-- 						bg = '#000000',
	-- 					},
	-- 					background = {
	-- 						fg = '#000000',
	-- 						bg = '#000000',
	-- 					},
	-- 					tab_selected = {
	-- 						fg = '#000000',
	-- 						bg = '#000000',
	-- 					},
	-- 					tab_separator = {
	-- 						fg = '#000000',
	-- 						bg = '#000000',
	-- 					},
	-- 				}
	-- 			}
	-- 		}

	-- 		vim.api.nvim_set_keymap("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap("n", "<C-p>", ":bprevious<CR>", { noremap = true, silent = true })
	-- 		vim.api.nvim_exec([[ nnoremap <silent> <space>x :bdelete<CR> ]], false)
	-- 	end
	-- },

	-----------------------------------------------------
	-- status line
	-----------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			-- "nvim-lua/lsp-status.nvim",
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
						component_separators = { left = "", right = "" },
						section_separators = { left = "", right = "" },
						always_divide_middle = true,
						globalstatus = true
					},
					sections = {
						lualine_a = { "mode" },
						lualine_b = {
							"branch",
							"diff",
							{ "diagnostics", sources = { "coc" } },
						},
						-- lualine_c = { "g:coc_status", "require'lsp-status'.status()", "filename" },
						lualine_c = { "filename" },
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
					tabline = {
						lualine_a = { 'tabs' },
						lualine_b = {
							{
								'buffers',
								show_filename_only = false, -- Shows shortened relative path when set to false.
								hide_filename_extension = false, -- Hide filename extension when set to true.
								show_modified_status = true, -- Shows indicator when the buffer is modified.

								mode = 0,                -- 0: Shows buffer name
								-- 1: Shows buffer index
								-- 2: Shows buffer name + buffer index
								-- 3: Shows buffer number
								-- 4: Shows buffer name + buffer number

								-- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
								max_length = vim.o.columns * 4 / 5, -- Maximum width of buffers component,
								-- it can also be a function that returns
								-- the value of `max_length` dynamically.
								filetype_names = {
									TelescopePrompt = 'Telescope',
									dashboard = 'Dashboard',
									packer = 'Packer',
									fzf = 'FZF',
									alpha = 'Alpha'
								}, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

								-- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
								use_mode_colors = true,

								-- buffers_color = {
								-- 	-- Same values as the general color option can be used here.
								-- 	active = 'lualine_{section}_normal', -- Color for active buffer.
								-- 	inactive = 'lualine_{section}_inactive', -- Color for inactive buffer.
								-- },

								symbols = {
									modified = ' ●', -- Text to show when the buffer is modified
									alternate_file = '#', -- Text to show to identify the alternate file
									directory = '', -- Text to show when the buffer is a directory
								},
							}
						},
						-- lualine_c = { 'filename' },
						-- lualine_x = {},
						-- lualine_y = {  },
						-- lualine_z = { 'tabs' }
					},
					extensions = { "fern", "nvim-tree", "fugitive", "trouble", "nvim-dap-ui", "lazy", "mason" },
					-- disabled_filetypes = {  }
				})

				vim.api.nvim_set_keymap("n", "<C-n>", ":bnext<CR>", { noremap = true, silent = true })
				vim.api.nvim_set_keymap("n", "<C-p>", ":bprevious<CR>", { noremap = true, silent = true })
				vim.api.nvim_exec([[ nnoremap <silent> <space>x :bdelete<CR> ]], false)
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
	},

	{
		'Bekaboo/dropbar.nvim',
		-- optional, but required for fuzzy finder support
		dependencies = {
			'nvim-telescope/telescope-fzf-native.nvim'
		},
		config = function()
			require("dropbar").setup({})
		end,
	},
}
