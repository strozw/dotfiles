return {
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			notify = {
				-- Noice can be used as `vim.notify` so you can route any notification like other messages
				-- Notification messages have their level and other properties set.
				-- event is always "notify" and kind can be any log level as a string
				-- The default routes will forward notifications to nvim-notify
				-- Benefit of using Noice for this is the routing and consistent history view
				enabled = true,
				view = "notify",
			},
			lsp = {
				cmdline = {
					enabled = true,    -- enables the Noice cmdline UI
					view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
					opts = {},         -- global options for the cmdline. See section on views
					---@type table<string, CmdlineFormat>
					format = {
						-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
						-- view: (default is cmdline view)
						-- opts: any options passed to the view
						-- icon_hl_group: optional hl_group for the icon
						-- title: set to anything or empty string to hide
						cmdline = { pattern = "^:", icon = "", lang = "vim" },
						search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
						search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
						filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
						lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
						help = { pattern = "^:%s*he?l?p?%s+", icon = "" },
						input = { view = "cmdline_input", icon = "󰥻 " }, -- Used by input()
						-- lua = false, -- to disable a format, set to `false`
					},
				},
				messages = {
					-- NOTE: If you enable messages, then the cmdline is enabled automatically.
					-- This is a current Neovim limitation.
					enabled = true,         -- enables the Noice messages UI
					view = "notify",        -- default view for messages
					view_error = "mini",    -- view for errors
					view_warn = "mini",     -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
				},
				popupmenu = {
					enabled = true, -- enables the Noice popupmenu UI
					---@type 'nui'|'cmp'
					backend = "nui", -- backend to use to show regular cmdline completions
					---@type NoicePopupmenuItemKind|false
					-- Icons for completion item kinds (see defaults at noice.config.icons.kinds)
					kind_icons = {}, -- set to `false` to disable icons
				},
				-- default options for require('noice').redirect
				-- see the section on Command Redirection
				---@type NoiceRouteConfig
				-- redirect = {
				-- 	view = "popup",
				-- 	filter = { event = "msg_show" },
				-- },
				-- You can add any custom commands below that will be available with `:Noice command`
				---@type table<string, NoiceCommand>
				commands = {
					history = {
						-- options for the message history that you get with `:Noice`
						view = "split",
						opts = { enter = true, format = "details" },
						filter = {
							any = {
								{ event = "notify" },
								{ error = true },
								{ warning = true },
								{ event = "msg_show", kind = { "" } },
								{ event = "lsp",      kind = "message" },
							},
						},
					},
					-- :Noice last
					last = {
						view = "popup",
						opts = { enter = true, format = "details" },
						filter = {
							any = {
								{ event = "notify" },
								{ error = true },
								{ warning = true },
								{ event = "msg_show", kind = { "" } },
								{ event = "lsp",      kind = "message" },
							},
						},
						filter_opts = { count = 1 },
					},
					-- :Noice errors
					errors = {
						-- options for the message history that you get with `:Noice`
						view = "popup",
						opts = { enter = true, format = "details" },
						filter = { error = true },
						filter_opts = { reverse = true },
					},
					all = {
						-- options for the message history that you get with `:Noice`
						view = "split",
						opts = { enter = true, format = "details" },
						filter = {},
					},
				},
				progress = {
					enabled = true,
					-- Lsp Progress is formatted using the builtins for lsp_progress. See config.format.builtin
					-- See the section on formatting for more details on how to customize.
					--- @type NoiceFormat|string
					format = "lsp_progress",
					--- @type NoiceFormat|string
					format_done = "lsp_progress_done",
					throttle = 1000 / 30, -- frequency to update lsp progress message
					view = "mini",
				},
				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				},
				hover = {
					enabled = true,
					silent = false, -- set to true to not show a message if hover is not available
					view = nil, -- when nil, use defaults from documentation
					---@type NoiceViewOptions
					opts = {}, -- merged with defaults from documentation
				},
				signature = {
					enabled = true,
					auto_open = {
						enabled = true,
						trigger = true, -- Automatically show signature help when typing a trigger character from the LSP
						luasnip = true, -- Will open signature help when jumping to Luasnip insert nodes
						throttle = 50, -- Debounce lsp signature help request by 50ms
					},
					view = nil, -- when nil, use defaults from documentation
					---@type NoiceViewOptions
					opts = {},  -- merged with defaults from documentation
				},
				message = {
					-- Messages shown by lsp servers
					enabled = true,
					view = "notify",
					opts = {},
				},
				-- defaults for hover and signature help
				documentation = {
					view = "hover",
					---@type NoiceViewOptions
					opts = {
						lang = "markdown",
						replace = true,
						render = "plain",
						format = { "{message}" },
						win_options = { concealcursor = "n", conceallevel = 3 },
					},
				},
			},

			markdown = {
				hover = {
					["|(%S-)|"] = vim.cmd.help,                  -- vim help links
					["%[.-%]%((%S-)%)"] = require("noice.util").open, -- markdown links
				},
				highlights = {
					["|%S-|"] = "@text.reference",
					["@%S+"] = "@parameter",
					["^%s*(Parameters:)"] = "@text.title",
					["^%s*(Return:)"] = "@text.title",
					["^%s*(See also:)"] = "@text.title",
					["{%S-}"] = "@parameter",
				},
			},
			health = {
				checker = true, -- Disable if you don't want health checks to run
			},
			---@type NoicePresets
			presets = {
				bottom_search = true,     -- use a classic bottom cmdline for search
				command_palette = true,   -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				inc_rename = false,       -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = false,   -- add a border to hover docs and signature help
			},
			throttle = 1000 / 30,       -- how frequently does Noice need to check for ui updates? This has no effect when in blocking mode.
			---@type NoiceConfigViews
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
			---@type NoiceRouteConfig[]
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
				{ view = "mini", filter = { event = "msg_show", kind = "emsg", find = "", }, },
			},
			---@type table<string, NoiceFilter>
			status = {}, --- @see section on statusline components
			---@type NoiceFormatOptions
			format = {}, --- @see section on formatting

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

								mode = 0,
								-- 0: Shows buffer name
								-- 1: Shows buffer index
								-- 2: Shows buffer name + buffer index
								-- 3: Shows buffer number
								-- 4: Shows buffer name + buffer number

								max_length = vim.o.columns,
								-- max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
								-- max_length = vim.o.columns * 4 / 5, -- Maximum width of buffers component,

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
						lualine_c = {},
						-- lualine_c = { 'filename' },
						lualine_x = {},
						lualine_y = {},
						-- lualine_z = { 'tabs' }
						lualine_z = {}
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
