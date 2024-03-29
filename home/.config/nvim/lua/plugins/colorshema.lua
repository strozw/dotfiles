return {
	-- color
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"tpope/vim-commentary",
			"JoosepAlviste/nvim-ts-context-commentstring",
			-- 'windwp/nvim-ts-autotag',
			"nvim-treesitter/playground",
			"nvim-treesitter/nvim-tree-docs",
		},
		build = ":TSUpdate",
		config = function()
			require('ts_context_commentstring').setup {
				enable_autocmd = false,
			}

			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				tree_docs = { enable = true },
				-- autotag = {
				-- 	enable = true,
				-- },
				playground = {
					enable = true,
					disable = {},
					updatetime = 25,    -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = "o",
						toggle_hl_groups = "i",
						toggle_injected_languages = "t",
						toggle_anonymous_nodes = "a",
						toggle_language_display = "I",
						focus_language = "f",
						unfocus_language = "F",
						update = "R",
						goto_node = "<cr>",
						show_help = "?",
					},
				},
			})
		end,
	},

	-- line coloring for modes
	{
		"mvllow/modes.nvim",
		config = function()
			require("modes").setup({
				colors = {
					copy = "#f5c359",
					delete = "#c75c6a",
					insert = "#78ccc5",
					visual = "#9745be",
				},
				-- Set opacity for cursorline and number background
				line_opacity = 0.3,
				-- Enable cursor highlights
				set_cursor = true,
				-- Enable cursorline initially, and disable cursorline for inactive windows
				-- or ignored filetypes
				set_cursorline = true,
				-- Enable line number highlights to match cursorline
				set_number = true,
				-- Disable modes highlights in specified filetypes
				-- Please PR commonly ignored filetypes
				-- ignore_filetypes = { 'NvimTree', 'TelescopePrompt' }
			})
		end,
	},

	{
		"folke/tokyonight.nvim",
		-- dependencies = {
		-- 	"xiyaowong/nvim-transparent",
		-- },
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "night",    -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value `:help attr-list`
					comments = "italic",
					keywords = "italic",
					functions = "NONE",
					variables = "NONE",
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark",                          -- style for sidebars, see below
					floats = "dark",                            -- style for floating windows
				},
				sidebars = { "qf", "help", "Fern", "Telescope" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3,                         -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false,             -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false,                         -- dims inactive windows
				lualine_bold = true,                          -- When `true`, section headers in the lualine theme will be bold
				on_highlights = function(hl, c)
					local prompt = "#2d3149"
					hl.TelescopeNormal = {
						bg = c.bg_dark,
						fg = c.fg_dark,
					}
					hl.TelescopeBorder = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopePromptNormal = {
						bg = prompt,
					}
					hl.TelescopePromptBorder = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePromptTitle = {
						bg = prompt,
						fg = prompt,
					}
					hl.TelescopePreviewTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
					hl.TelescopeResultsTitle = {
						bg = c.bg_dark,
						fg = c.bg_dark,
					}
				end,
			})

			vim.cmd([[colorscheme tokyonight]])
			vim.g.tokyonight_style = "night"
			-- vim.g.tokyonight_transparent = vim.g.transparent_enabled
		end,
	},
}
