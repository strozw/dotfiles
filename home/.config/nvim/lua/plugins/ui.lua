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
	-- status line
	-----------------------------------------------------
	{
		"nvim-lualine/lualine.nvim",
		lazy = false,
		dependencies = {
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
					extensions = { "fern", "nvim-tree", "neo-tree", "fugitive", "trouble", "nvim-dap-ui", "lazy", "mason" },
					-- disabled_filetypes = {  }
				})
			end
		end,
	},

	-----------------------------------------------------
	-- filer
	-----------------------------------------------------
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		cmd = "Neotree",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim",           -- Optional image support in preview window: See `# Preview Mode` for more information
			"luckasRanarison/neo-rename.nvim"
		},
		keys = {
			{ "<F2>", "<cmd>Neotree toggle<cr>" },
			{ "ss",   "<cmd>Neotree reveal <CR>" }
		},
		config = function()
			require("neo-tree").setup({
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

	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
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

	{
		'uga-rosa/ccc.nvim',
		config = function()
			vim.opt.termguicolors = true

			local ccc = require("ccc")
			local mapping = ccc.mapping

			ccc.setup({
				highlighter = {
					auto_enable = true,
					lsp = true,
				},
			})
		end
	},


	-- LSP / diagnostics UI
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		keys = {
			{ "<F4>", "<cmd>TroubleToggle<cr>" },
		},
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

}
