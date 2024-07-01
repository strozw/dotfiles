return {
	-- color
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			"nvim-treesitter/nvim-tree-docs",
		},
		-- build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
					disable = function(lang, buf)
						local max_filesize = 100 * 1024 -- 100 KB
						local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
						if ok and stats and stats.size > max_filesize then
							return true
						end
					end,
				},
				tree_docs = { enable = true },
			})

			require('ts_context_commentstring').setup {
				enable_autocmd = false,
			}

			local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

			parser_config.blade = {
				install_info = {
					url = "https://github.com/EmranMR/tree-sitter-blade",
					files = { "src/parser.c" },
					branch = "main",
				},
				filetype = "blade"
			}

			parser_config.ejs = {
				install_info = {
					url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
					files = { "src/parser.c" },
					requires_generate_from_grammar = true,
				},
				filetype = "ejs",
			}

			parser_config.eta = {
				install_info = {
					url = "https://github.com/tree-sitter/tree-sitter-embedded-template",
					files = { "src/parser.c" },
					requires_generate_from_grammar = true,
				},
				filetype = "eta",
			}

			parser_config.github_actions = {
				install_info = {
					url = "https://github.com/rewinfrey/tree-sitter-github-action",
					files = { "src/parser.c" },
					-- requires_generate_from_grammar = true,
				},
				filetype = "yaml",
			}

			vim.api.nvim_create_augroup("BladeFiltypeRelated", {})

			vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
				group = "BladeFiltypeRelated",
				pattern = { "*.blade.php" },
				callback = function()
					vim.o.filetype = "blade"
				end
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
				light_style = "day", -- The theme is used when the background is set to light
				transparent = true, -- Enable this to disable setting the background color
				terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value `:help attr-list`
					comments = { italic = true },
					keywords = { italic = true },
					functions = {},
					variables = {},
					-- Background styles. Can be "dark", "transparent" or "normal"
					sidebars = "dark",                          -- style for sidebars, see below
					floats = "dark",                            -- style for floating windows
				},
				sidebars = { "qf", "help", "Fern", "Telescope" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 1,                           -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false,             -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false,                         -- dims inactive windows
				lualine_bold = false,                         -- When `true`, section headers in the lualine theme will be bold
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

	{ "tpope/vim-commentary" },

	-- todo comments highlight
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
}
