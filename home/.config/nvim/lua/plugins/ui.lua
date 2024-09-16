return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			lsp = {
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
			},
			-- you can enable a preset for easier configuration
			presets = {
				bottom_search = true,     -- use a classic bottom cmdline for search
				command_palette = true,   -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false,       -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false,   -- add a border to hover docs and signature help
			},
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					border = {
						style = "none",
						padding = { 1, 3 },
					},
					filter_options = {},
					win_options = {
						winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
					},
				},
			},
			routes = {
				{
					filter = {
						event = "notify",
						find = "No information available",
					},
					opts = { skip = true },
				},
				{ view = "mini", filter = { event = "msg_show", kind = "", find = "written", }, },
				{ view = "mini", filter = { event = "msg_show", kind = "", find = "書込み", }, },
			},
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
			"nvim-treesitter/nvim-treesitter",
		}
	},

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
		event = "VeryLazy",
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
		"monaqa/dial.nvim",
		-- lazy-load on keys
		-- mode is `n` by default. For more advanced options, check the section on key mappings
		keys = { "<C-a>", { "<C-x>", mode = "n" } },
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			local colors = require("tokyonight.colors").setup()

			local highlight = {
				"RainbowRed",
				"RainbowYellow",
				"RainbowBlue",
				"RainbowOrange",
				"RainbowGreen",
				"RainbowViolet",
				"RainbowCyan",
			}

			local hooks = require "ibl.hooks"

			-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			-- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = colors.red })
			-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = colors.yellow })
			-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = colors.blue })
			-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = colors.orange })
			-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = colors.green })
			-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = colors.purple })
			-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = colors.cyan })
			-- end)

			require("ibl").setup {
				indent = {
					-- highlight = highlight,
					char = '│',
				},
			}
		end,
	},

	-----------------------------------------------------
	-- status line
	-----------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
			'AndreM222/copilot-lualine'
			-- "nvim-lua/lsp-status.nvim",
		},
		keys = {
			{ "<C-n>", ":bnext<cr>" },
			{ "<C-p>", ":bprevious<cr>" },
		},
		config = function()
			local lualine = require("lualine")

			if lualine then
				lualine.setup({
					options = {
						icons_enabled = true,
						-- theme = 'auto',
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
							-- "diff",
							{ "diagnostics", sources = { "coc" } },
						},
						-- lualine_c = { "g:coc_status", "require'lsp-status'.status()", "filename" },
						lualine_c = { "filename" },
						lualine_x = {
							{ "copilot", show_colors = true }, "encoding", "fileformat", "filetype",
							-- {
							-- 	require("noice").api.status.message.get_hl,
							-- 	cond = require("noice").api.status.message.has,
							-- },
							-- {
							-- 	require("noice").api.status.command.get,
							-- 	cond = require("noice").api.status.command.has,
							-- 	color = { fg = "#ff9e64" },
							-- },
							-- {
							-- 	require("noice").api.status.mode.get,
							-- 	cond = require("noice").api.status.mode.has,
							-- 	color = { fg = "#ff9e64" },
							-- },
							{
								require("noice").api.status.search.get,
								cond = require("noice").api.status.search.has,
								color = { fg = "#ff9e64" },
							},
						},
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
					extensions = { "fern", "nvim-tree", "neo-tree", "fugitive", "trouble", "nvim-dap-ui", "lazy", "mason" },
					-- disabled_filetypes = {  }
				})
			end
		end,
	},

	-- { "nvim-tree/nvim-web-devicons", lazy = true },
	{
		"echasnovski/mini.icons",
		opts = {},
		lazy = true,
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				-- needed since it will be false when loading and mini will fail
				package.loaded["nvim-web-devicons"] = {}
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},

	-----------------------------------------------------
	-- filer
	-----------------------------------------------------
	-- NOTE: `brew fetch lua@5.1 && brew install "$(brew --cache lua@5.1)"`
	{
		"3rd/image.nvim",
		config = function()
		end
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",           -- Optional image support in preview window: See `# Preview Mode` for more information
			"luckasRanarison/neo-rename.nvim",
			-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
			{
				's1n7ax/nvim-window-picker',
				version = '2.*',
				config = function()
					require 'window-picker'.setup({
						filter_rules = {
							include_current_win = false,
							autoselect_one = true,
							-- filter using buffer options
							bo = {
								-- if the file type is one of following, the window will be ignored
								filetype = { 'neo-tree', "neo-tree-popup", "notify" },
								-- if the buffer type is one of following, the window will be ignored
								buftype = { 'terminal', "quickfix" },
							},
						},
					})
				end,
			},
		},
		keys = {
			{ "<F2>", "<cmd>Neotree toggle<cr>" },
			{ "ss",   "<cmd>Neotree reveal <CR>" }
		},
		config = function()
			require("neo-tree").setup({
				follow_current_file = {
					enabled = true
				},
				use_libuv_file_watcher = true,
				close_if_last_window = true,
				enable_git_status = true,
				enable_diagnostics = true,
				open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
				default_component_configs = {
				},
				filesystem = {
					filtered_items = {
						hide_dotfiles = false,
						hide_hidden = false,
						hide_gitignored = false,
					}
				}
			})

			require("neo-rename").setup()
		end
	},

	-- {
	-- 	"nvim-tree/nvim-tree.lua",
	-- 	keys = {
	-- 		{ "<F2>", "<cmd>NvimTreeToggle<CR>" },
	-- 		{ "ss",   "<cmd>NvimTreeFocus<CR>" }
	-- 	},
	-- 	config = function()
	-- 		-- disable netrw at the very start of your init.lua
	-- 		vim.g.loaded_netrw = 1
	-- 		vim.g.loaded_netrwPlugin = 1

	-- 		-- optionally enable 24-bit colour
	-- 		vim.opt.termguicolors = true

	-- 		-- OR setup with some options
	-- 		require("nvim-tree").setup({
	-- 			sort = {
	-- 				sorter = "case_sensitive",
	-- 			},
	-- 			view = {
	-- 				width = 30,
	-- 			},
	-- 			renderer = {
	-- 				group_empty = true,
	-- 			},
	-- 			filters = {
	-- 				enable = false,
	-- 			},
	-- 		})
	-- 	end
	-- },

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- "nvim-neo-tree/neo-tree.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},

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

	-- {
	-- 	'uga-rosa/ccc.nvim',
	-- 	dependencies = { "vim-denops/denops.vim" },
	-- 	config = function()
	-- 		vim.opt.termguicolors = true

	-- 		local ccc = require("ccc")
	-- 		local mapping = ccc.mapping

	-- 		ccc.setup({
	-- 			highlighter = {
	-- 				auto_enable = true,
	-- 				lsp = true,
	-- 			},
	-- 		})
	-- 	end
	-- },


	-- LSP / diagnostics UI
	{
		"folke/trouble.nvim",
		branch = "main",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<F4>", "<cmd>Trouble diagnostics<cr>" },
		},
		config = function()
			require("trouble").setup({})
		end,
	},

	-- Hover
	{
		"Fildo7525/pretty_hover",
		event = "LspAttach",
		opts = {}
	},

	{ 'akinsho/toggleterm.nvim',   version = "*", opts = { --[[ things you want to change go here ]] } },

	-- cursor
	{ 'danilamihailov/beacon.nvim' },

	-- animation
	-- {
	-- 	'echasnovski/mini.animate',
	-- 	version = '*',
	-- 	config = function()
	-- 		require('mini.animate').setup()
	-- 	end
	-- },
}
