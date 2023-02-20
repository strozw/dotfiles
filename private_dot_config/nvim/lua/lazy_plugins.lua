local lazy = require("lazy")

lazy.setup({

	-- Performance
	{ "lewis6991/impatient.nvim" },

	-- boiler
	-- {'tpope/vim-sensible'},

	-- editorconfig
	{ "editorconfig/editorconfig-vim" },

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
			require("nvim-treesitter.configs").setup({
				highlight = { enable = true },
				tree_docs = { enable = true },
				-- autotag = {
				-- 	enable = true,
				-- },
				context_commentstring = {
					enable = true,
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
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

	-- todo comments highlight
	{
		"folke/todo-comments.nvim",
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	},

	-- {
	-- 	'xiyaowong/nvim-transparent',
	-- 	config = function()
	-- 		local transparent = require("transparent")

	-- 		transparent.setup({})
	-- 	end
	-- },
	{
		"folke/tokyonight.nvim",
		-- dependencies = {
		-- 	"xiyaowong/nvim-transparent",
		-- },
		config = function()
			require("tokyonight").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				style = "night", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
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
					sidebars = "dark", -- style for sidebars, see below
					floats = "dark", -- style for floating windows
				},
				sidebars = { "qf", "help", "Fern", "Telescope" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
				day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
				hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
				dim_inactive = false, -- dims inactive windows
				lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
			})

			vim.cmd([[colorscheme tokyonight]])
			vim.g.tokyonight_style = "night"
			-- vim.g.tokyonight_transparent = vim.g.transparent_enabled
		end,
	},

	{
		"marko-cerovac/material.nvim",
		config = function()
			vim.g.material_style = "deep ocean"
			-- vim.cmd [[colorscheme material]]
		end,
	},

	-- tmux
	{ "christoomey/vim-tmux-navigator" },

	-- lua
	{ "andrejlevkovitch/vim-lua-format" },

	-- symbol view
	{ "liuchengxu/vista.vim", config = function() end },

	-- { "vim-denops/denops.vim" },

	{ "rafamadriz/friendly-snippets" },

	{
		"hrsh7th/vim-vsnip",
		config = function()
			vim.api.nvim_exec(
				[[
				" Expand
				imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
				smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

				" Expand or jump
				imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
				smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

				" Jump forward or backward
				imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
				smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
				imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
				smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

				" Select or cut text to use as $TM_SEECTED_TEXT in the next snippet.
				" See https://github.com/hrsh7th/vim-vsnip/pull/50
				nmap        s   <Plug>(vsnip-select-text)
				xmap        s   <Plug>(vsnip-select-text)
				nmap        S   <Plug>(vsnip-cut-text)
				xmap        S   <Plug>(vsnip-cut-text)

				" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
				let g:vsnip_filetypes = {}
				let g:vsnip_filetypes.javascriptreact = ['javascript']
				let g:vsnip_filetypes.typescriptreact = ['typescript']
			]],
				false
			)
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-emoji",
			"onsails/lspkind.nvim",
			"yutkat/cmp-mocword",
			-- "f3fora/cmp-spell",
		},
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			local common_sources = {
				{ name = "buffer" },
				-- { name = "spell" },
				{ name = "mocword" },
			}

			cmp.setup({
				-- performance = {
				-- 	debounce = 30,
				-- 	throttle = 15,
				-- },
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						-- before = function(entry, vim_item)
						-- 	if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
						-- 		vim_item.menu = entry.completion_item.detail
						-- 	else
						-- 		vim_item.menu = ({
						-- 			nvim_lsp = "[LSP]",
						-- 			luasnip = "[Snippet]",
						-- 			buffer = "[Buffer]",
						-- 			path = "[Path]",
						-- 		})[entry.source.name]
						-- 	end
						-- 	return vim_item
						-- end,
					}),
				},
				snippet = {
					-- REQUIRED - you must specify a snippet engine
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				window = {
					-- completion = cmp.config.window.bordered(),
					-- documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources(vim.list_extend({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "vsnip" },
					{ name = "emoji" },
				}, common_sources)),
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype("gitcommit", {
				sources = cmp.config.sources(vim.list_extend({
					{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
				}, common_sources)),
			})

			cmp.setup.filetype("lua", {
				sources = cmp.config.sources(vim.list_extend({
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "vsnip" },
				}, common_sources)),
			})

			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources(vim.list_extend({
					{ name = "nvim_lsp_document_symbol" },
				}, common_sources)),
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "cmdline" },
					{ name = "path" },
				}),
			})
		end,
	},

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
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-lua/lsp-status.nvim",
			"tamago324/nlsp-settings.nvim",
			"folke/neodev.nvim",
			"folke/lsp-colors.nvim",
			"yioneko/nvim-vtsls",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
			"jose-elias-alvarez/typescript.nvim",
			"jose-elias-alvarez/null-ls.nvim",
			"MunifTanjim/prettier.nvim",
			"j-hui/fidget.nvim",
			"lvimuser/lsp-inlayhints.nvim",
			"ray-x/go.nvim",
			"ray-x/guihua.lua",
		},
		config = function()
			local lspconfig_util = require("lspconfig.util")
			local lspconfig_configs = require("lspconfig.configs")

			lspconfig_configs.redocly = {
				default_config = {
					filetypes = { "yaml", "yml", "json" },
					root_dir = lspconfig_util.root_pattern(
						"redocly.yaml",
						"redocly.yml",
						".redocly.yaml",
						".redocly.yml"
					),
				},
			}

			-- local lsp_installer = require 'nvim-lsp-installer'
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local lsp_status = require("lsp-status")
			local nlspsettings = require("nlspsettings")
			local null_ls = require("null-ls")
			local lps_inlayhints = require("lsp-inlayhints")

			lps_inlayhints.setup({
				inlay_hints = {
					only_current_line = true,
				},
			})

			-- lsp indicator
			lsp_status.register_progress()
			require("fidget").setup({})

			nlspsettings.setup({
				config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
				local_settings_dir = ".nlsp-settings",
				local_settings_root_markers = { ".git" },
				append_default_schemas = true,
				loader = "json",
			})

			local global_capabilities = vim.lsp.protocol.make_client_capabilities()
			global_capabilities.textDocument.completion.completionItem.snippetSupport = true

			lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
				capabilities = global_capabilities,
			})

			local lspFormattingGroup = vim.api.nvim_create_augroup("LspFormatting", {})

			-- disable diagnostics virtual_text
			vim.lsp.handlers["textDocument/publishDiagnostics"] =
				vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					virtual_text = false,
					underline = true,
					signs = true,
					-- update_in_insert = true,
				})

			-- normal mode のとき CursorHod 舌箇所の diagnostics を float で表示
			vim.api.nvim_exec(
				[[
				autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false })
			]],
				false
			)

			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "<space>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
			vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

			local function common_on_attach(client, bufnr)
				-- attach lsp-status
				lsp_status.on_attach(client)

				-- attach lsp-inlayhints
				lps_inlayhints.on_attach(client, bufnr)

				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "H", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"<space>wa",
					"<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",
					opts
				)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"<space>wr",
					"<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",
					opts
				)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"<space>wl",
					"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
					opts
				)
				vim.api.nvim_buf_set_keymap(bufnr, "n", "cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gi",
					"<cmd>lua require'telescope.builtin'.lsp_implementations(require('telescope.themes').get_ivy({}))<CR>",
					opts
				)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.type_declaration()<CR>', opts)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gD",
					"<cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_ivy({}))<CR>",
					opts
				)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gd",
					"<cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_ivy({}))<CR>",
					opts
				)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				vim.api.nvim_buf_set_keymap(
					bufnr,
					"n",
					"gr",
					"<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy({ show_line = false, fname_width = 100 }))<CR>",
					opts
				)

				vim.api.nvim_buf_set_keymap(bufnr, "n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
				vim.api.nvim_buf_set_keymap(bufnr, "v", "ca", "<cmd>lua vim.lsp.buf.range_code_action()<CR>", opts)

				-- enable format on save
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = lspFormattingGroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = lspFormattingGroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end

			local common_capabilities = require("cmp_nvim_lsp").default_capabilities()
			common_capabilities = vim.tbl_extend("keep", common_capabilities, lsp_status.capabilities)

			lspconfig.redocly.setup({
				cmd = {
					"node",
					vim.fn.expand("~/.vscode/extensions/redocly.openapi-vs-code-0.2.17/out/server/src/server.js"),
					"--stdio",
				},
				on_attach = function(client, bufnr)
					client.server_capabilities.definitionProvider = true
					-- client.server_capabilities = vim.tbl_extend("force", client.server_capabilities, {
					-- 	hoverProvider = true,
					-- 	definitionProvider = true,
					-- 	referencesProvider = true,
					-- 	documentHighlightProvider = true,
					-- 	documentSymbolProvider = true,
					-- 	workspaceSymbolProvider = true,
					-- 	codeActionProvider = true,
					-- 	codeLensProvider = true,
					-- 	documentFormattingProvider = true,
					-- 	documentRangeFormattingProvider = true,
					-- 	documentOnTypeFormattingProvider = true,
					-- 	renameProvider = true,
					-- 	documentLinkProvider = true,
					-- })

					common_on_attach(client, bufnr)
				end,
				capabilities = common_capabilities,
			})

			lspconfig.vtsls.setup({
				on_attach = function(client, bufnr)
					common_on_attach(client, bufnr)
				end,
				capabilities = common_capabilities,
				settings = {
					["typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName"] = true,
					["typescript.inlayHints.parameterTypes.enabled"] = true,
					["typescript.inlayHints.variableTypes.enabled"] = true,
					["typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName"] = true,
					["typescript.inlayHints.propertyDeclarationTypes.enabled"] = true,
					["typescript.inlayHints.functionLikeReturnTypes.enabled"] = true,
					["typescript.inlayHints.enumMemberValues.enabled"] = true,
					typescript = {
						inlayHints = {
							parameterNames = {
								suppressWhenArgumentMatchesName = true,
							},
							parameterTypes = {
								enabled = true,
							},
							variableTypes = {
								enabled = true,
								suppressWhenTypeMatchesName = true,
							},
							propertyDeclarationTypes = {
								enabled = true,
							},
							functionLikeReturnTypes = {
								enabled = true,
							},
							enumMemberValues = {
								enabled = true,
							},
						},
					},
					["javascript.inlayHints.parameterNames.suppressWhenArgumentMatchesName"] = true,
					["javascript.inlayHints.parameterTypes.enabled"] = true,
					["javascript.inlayHints.variableTypes.enabled"] = true,
					["javascript.inlayHints.variableTypes.suppressWhenTypeMatchesName"] = true,
					["javascript.inlayHints.propertyDeclarationTypes.enabled"] = true,
					["javascript.inlayHints.functionLikeReturnTypes.enabled"] = true,
					["javascript.inlayHints.enumMemberValues.enabled"] = true,
					javascript = {
						inlayHints = {
							parameterNames = {
								suppressWhenArgumentMatchesName = true,
							},
							parameterTypes = {
								enabled = true,
							},
							variableTypes = {
								enabled = true,
								suppressWhenTypeMatchesName = true,
							},
							propertyDeclarationTypes = {
								enabled = true,
							},
							functionLikeReturnTypes = {
								enabled = true,
							},
							enumMemberValues = {
								enabled = true,
							},
						},
					},
				},
			})

			mason.setup({})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = common_on_attach,
						capabilities = common_capabilities,
					})
				end,
				["yamlls"] = function()
					lspconfig.yamlls.setup({
						on_attach = function(client, bufnr)
							common_on_attach(client, bufnr)
						end,
						capabilities = common_capabilities,
					})
				end,
				["jsonls"] = function()
					lspconfig.jsonls.setup({
						on_attach = function(client, bufnr)
							common_on_attach(client, bufnr)
						end,
						capabilities = common_capabilities,
					})
				end,
				["lua_lsp"] = function()
					require("neodev").setup({
						library = {
							enabled = true,
							runtime = true,
							types = true,
							plugins = true,
						},
					})

					lspconfig.lua_lsp.setup({
						on_attach = common_on_attach,
						capabilities = common_capabilities,
						-- ref: https://github.com/neovim/nvim-lspconfig/issues/319#issuecomment-1192399104
						single_file_support = false,
						settings = {
							Lua = {
								diagnostics = {
									-- Get the language server to recognize the `vim` global
									globals = { "vim" },
								},
								-- Do not send telemetry data containing a randomized but unique identifier
								telemetry = {
									enable = false,
								},
							},
						},
					})
				end,
				-- ["ruby-lsp"] = function()
				-- 	lsp_config.ruby_ls.setup({
				-- 		on_attach = function(client, bufnr)
				-- 			common_on_attach(client, bufnr)
				-- 		end,
				-- 		capabilities = common_capabilities,
				-- 	})
				-- end,
				["solargraph"] = function()
					lspconfig.solargraph.setup({
						on_attach = function(client, bufnr)
							common_on_attach(client, bufnr)
						end,
						capabilities = common_capabilities,
					})
				end,
				["denols"] = function()
					lspconfig.denols.setup({
						on_attach = function(client, bufnr)
							common_on_attach(client, bufnr)
						end,
						capabilities = common_capabilities,
						root_dir = lspconfig_util.root_pattern("deno.json"),
						single_file_support = false, -- default true なため、root_dir を見るよう false にする
						autostart = false,
					})
				end,
				["gopls"] = function()
					-- TODO: very slow
					-- local path = vim.fn.stdpath("data") .. "/mason"
					-- local install_root_dir = path.concat({ vim.fn.stdpath("data"), "lsp_servers" })
					local install_root_dir = vim.fn.stdpath("data") .. "/mason"

					require("go").setup({
						gopls_cmd = { install_root_dir .. "/go/gopls" },
						fillstruct = "gopls",
						dap_debug = true,
						dap_debug_gui = true,
					})

					lspconfig.gopls.setup({
						on_attach = function(client, bufnr)
							common_on_attach(client, bufnr)
						end,
						capabilities = common_capabilities,
						settings = {
							gopls = {
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									constantValues = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = true,
								},
							},
						},
					})
				end,
				-- ["tsserver"] = function()
				-- 	require("typescript").setup({
				-- 		disable_commands = false, -- prevent the plugin from creating Vim commands
				-- 		debug = false, -- enable debug logging for commands
				-- 		go_to_source_definition = {
				-- 			fallback = true, -- fall back to standard LSP definition on failure
				-- 		},
				-- 		server = { -- pass options to lspconfig's setup method
				-- 			root_dir = lspconfig.util.root_pattern("package.json"),
				-- 			on_attach = function(client, bufnr)
				-- 				common_on_attach(client, bufnr)

				-- 				-- client.resolved_capabilities.document_formatting = false
				-- 				client.server_capabilities.document_formatting = false

				-- 				local ts_utils = require("nvim-lsp-ts-utils")

				-- 				ts_utils.setup({
				-- 					update_imports_on_move = true,
				-- 					require_confirmation_on_move = true,
				-- 					auto_inlay_hints = false,
				-- 				})

				-- 				-- required to fix code action ranges and filter diagnostics
				-- 				ts_utils.setup_client(client)

				-- 				-- no default maps, so you may want to define some here
				-- 				local opts = { silent = true }

				-- 				vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>io", ":TSLspOrganize<CR>", opts)
				-- 				vim.api.nvim_buf_set_keymap(bufnr, "n", "rf", ":TSLspRenameFile<CR>", opts)
				-- 				vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ia", ":TSLspImportAll<CR>", opts)
				-- 			end,
				-- 			capabilities = common_capabilities,
				-- 			settings = {
				-- 				typescript = {
				-- 					inlayHints = {
				-- 						includeInlayParameterNameHints = "all",
				-- 						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				-- 						includeInlayFunctionParameterTypeHints = true,
				-- 						includeInlayVariableTypeHints = true,
				-- 						includeInlayPropertyDeclarationTypeHints = true,
				-- 						includeInlayFunctionLikeReturnTypeHints = true,
				-- 						includeInlayEnumMemberValueHints = true,
				-- 					},
				-- 				},
				-- 				javascript = {
				-- 					inlayHints = {
				-- 						includeInlayParameterNameHints = "all",
				-- 						includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				-- 						includeInlayFunctionParameterTypeHints = true,
				-- 						includeInlayVariableTypeHints = true,
				-- 						includeInlayPropertyDeclarationTypeHints = true,
				-- 						includeInlayFunctionLikeReturnTypeHints = true,
				-- 						includeInlayEnumMemberValueHints = true,
				-- 					},
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
				["eslint"] = function()
					lspconfig.eslint.setup({
						on_attach = function(client, bufnr)
							-- @see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = lspFormattingGroup,
								pattern = { "*.tsx", "*.ts", "*.jsx", "*.js" },
								command = "silent! EslintFixAll",
							})

							common_on_attach(client, bufnr)

							client.server_capabilities.document_formatting = true
							client.server_capabilities.document_range_formatting = true
						end,
						settings = {
							codeActionOnSave = {
								enable = true,
								mode = "all",
							},
							format = {
								enable = true,
							}, -- this will enable formatting
						},
					})
				end,
			})

			local prettier = require("prettier")

			prettier.setup({
				["null-ls"] = {
					condition = function()
						return prettier.config_exists({
							check_package_json = true,
						})
					end,
					runtime_condition = function(params)
						-- return false to skip running prettier
						return true
					end,
					timeout = 5000,
				},
			})

			null_ls.setup({
				sources = {
					null_ls.builtins.code_actions.gitsigns,
					-- null_ls.builtins.formatting.prettier.with({
					-- 	condition = function(utils)
					-- 		return utils.root_has_file({
					-- 			".prettierrc",
					-- 			".prettierrc.js",
					-- 			".prettierrc.json",
					-- 			".prettierrc.ts",
					-- 		})
					-- 	end,
					-- }),
					require("typescript.extensions.null-ls.code-actions"),
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.completion.spell,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.diagnostics.golangci_lint,
					null_ls.builtins.diagnostics.revive,
					null_ls.builtins.formatting.golines.with({
						extra_args = {
							"--max-len=180",
							"--base-formatter=gofumpt",
						},
					}),
					require("go.null_ls").gotest(),
					require("go.null_ls").gotest_action(),
				},
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = lspFormattingGroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = lspFormattingGroup,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({ bufnr = bufnr })
							end,
						})
					end
				end,
			})
		end,
	},

	-- LSP / line diagnostics
	-- {
	-- 	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	-- 	config = function()
	-- 		require("lsp_lines").setup({})

	-- 		vim.diagnostic.config({
	-- 			virtual_text = false,
	-- 			virtual_lines = { only_current_line = true },
	-- 		})

	-- 		-- vim.api.nvim_create_autocmd('InsertEnter', {
	-- 		-- 	callback = function()
	-- 		-- 		vim.diagnostic.config({ virtual_lines = false })
	-- 		-- 	end
	-- 		-- })
	-- 		-- vim.api.nvim_create_autocmd('ModeChanged', {
	-- 		-- 	pattern = 'i:*',
	-- 		-- 	callback = function()
	-- 		-- 		vim.diagnostic.config({ virtual_lines = true })
	-- 		-- 	end
	-- 		-- })
	-- 	end,
	-- },

	-- LSP / diagnostics UI
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})

			vim.api.nvim_set_keymap("n", "<F4>", ":TroubleToggle<CR>", { noremap = true, silent = true })
		end,
	},

	-- buffer delete imple
	{ "famiu/bufdelete.nvim" },

	-- buffer ui
	-- {
	-- 	'akinsho/bufferline.nvim',
	-- 	version= "*",
	-- 	dependencies = { 'kyazdani42/nvim-web-devicons' },
	-- 	config = function()
	-- 		require("bufferline").setup {}
	-- 		vim.api.nvim_set_keymap('n', '<C-n>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
	-- 		vim.api.nvim_set_keymap('n', '<C-p>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
	-- 		vim.api.nvim_exec([[ nnoremap <silent> <space>x :bd<CR> ]], false)
	--
	-- 		-- for fern
	-- 		vim.api.nvim_exec([[
	-- 			let g:fern#default_hidden=1
	-- 			let g:fern#width=50
	-- 			let g:fern#renderer='nerdfont'
	--
	-- 			function! FernInit() abort
	-- 				nmap <buffer> <C-L> :TmuxNavigateRight<CR>
	-- 			endfunction
	--
	-- 			augroup FernEvents
	-- 				autocmd!
	-- 				autocmd FileType fern call FernInit()
	-- 			augroup END
	-- 		]], false)
	-- 	end
	-- },

	{
		"romgrk/barbar.nvim",
		dependencies = { "kyazdani42/nvim-web-devicons" },
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

			{ "lambdalisue/fern-hijack.vim" },

			{ "lambdalisue/glyph-palette.vim" },
		},
		config = function()
			vim.api.nvim_set_keymap(
				"n",
				"<F2>",
				":Fern . -drawer -width=50 -toggle<CR>",
				{ noremap = true, silent = true }
			)
			vim.api.nvim_set_keymap(
				"n",
				"ss",
				":Fern . -drawer -width=50 -reveal=%<CR><CR>",
				{ noremap = true, silent = true }
			)
			vim.g.fern_disable_startup_warnings = 1
		end,
	},

	-----------------------------------------------------
	-- git
	-----------------------------------------------------

	{ "iberianpig/tig-explorer.vim" },

	{
		"tpope/vim-fugitive",
		config = function()
			vim.api.nvim_set_keymap("n", "gb", "<cmd>Git blame<CR>", { noremap = true, silent = true })
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
				highlights = { -- They must have background color, otherwise the default color will be used
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
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("octo").setup()
		end,
	},

	-- debugger
	-- {
	-- 	"microsoft/vscode-js-debug",
	-- 	build = "npm install && npm run compile",
	-- },

	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 	dependencies = {
	-- 		"mfussenegger/nvim-dap",
	-- 		"leoluz/nvim-dap-go",
	-- 		"mxsdev/nvim-dap-vscode-js",
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 		"jbyuki/one-small-step-for-vimkind",
	-- 	},
	-- 	config = function()
	-- 		local dap, dapui = require("dap"), require("dapui")

	-- 		vim.fn.sign_define("DapBreakpoint", { text = "⛔", texthl = "", linehl = "", numhl = "" })
	-- 		vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })

	-- 		dapui.setup({
	-- 			layouts = {
	-- 				{
	-- 					elements = {
	-- 						{ id = "watches", size = 0.20 },
	-- 						{ id = "stacks", size = 0.20 },
	-- 						{ id = "breakpoints", size = 0.20 },
	-- 						{ id = "scopes", size = 0.40 },
	-- 					},
	-- 					size = 64,
	-- 					position = "right",
	-- 				},
	-- 				{
	-- 					elements = {
	-- 						"repl",
	-- 						"console",
	-- 					},
	-- 					size = 0.20,
	-- 					position = "bottom",
	-- 				},
	-- 			},
	-- 		})

	-- 		require("dap-go").setup()

	-- 		-- require("dap-vscode-js").setup({
	-- 		-- 	debugger_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vscode-js-debug", -- Path to vscode-js-debug installation.
	-- 		-- 	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
	-- 		-- })

	-- 		dap.configurations.lua = {
	-- 			{
	-- 				type = "nlua",
	-- 				request = "attach",
	-- 				name = "Attach to running Neovim instance",
	-- 			},
	-- 		}

	-- 		dap.adapters.nlua = function(callback, config)
	-- 			callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
	-- 		end

	-- 		dap.adapters.node2 = {
	-- 			type = "executable",
	-- 			command = "node",
	-- 			args = { os.getenv("HOME") .. "/ghq/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
	-- 		}

	-- 		dap.adapters.chrome = {
	-- 			type = "executable",
	-- 			command = "node",
	-- 			args = { os.getenv("HOME") .. "/ghq/github.com/microsoft/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
	-- 		}

	-- 		dap.configurations.javascript = {
	-- 			{
	-- 				type = "pwa-node",
	-- 				request = "launch",
	-- 				name = "Launch file",
	-- 				program = "${file}",
	-- 				cwd = "${workspaceFolder}",
	-- 			},
	-- 			{
	-- 				type = "pwa-node",
	-- 				request = "attach",
	-- 				name = "Attach",
	-- 				processId = require("dap.utils").pick_process,
	-- 				cwd = "${workspaceFolder}",
	-- 			},
	-- 			{
	-- 				type = "pwa-node",
	-- 				request = "launch",
	-- 				name = "Debug Jest Tests",
	-- 				trace = true, -- include debugger info
	-- 				runtimeExecutable = "node",
	-- 				runtimeArgs = {
	-- 					"./node_modules/jest/bin/jest.js",
	-- 					"--runInBand",
	-- 				},
	-- 				rootPath = "${workspaceFolder}",
	-- 				cwd = "${workspaceFolder}",
	-- 				console = "integratedTerminal",
	-- 				internalConsoleOptions = "neverOpen",
	-- 			},
	-- 		}

	-- 		dap.configurations.javascriptreact = dap.configurations.javascript
	-- 		dap.configurations.typescript = dap.configurations.javascript
	-- 		dap.configurations.typescriptreact = dap.configurations.javascript

	-- 		dap.listeners.after.event_initialized["dapui_config"] = function()
	-- 			dapui.open()
	-- 		end
	-- 		dap.listeners.before.event_terminated["dapui_config"] = function()
	-- 			dapui.close()
	-- 		end
	-- 		dap.listeners.before.event_exited["dapui_config"] = function()
	-- 			dapui.close()
	-- 		end

	-- 		local function map(mode, lhs, rhs, opts)
	-- 			local options = { noremap = true }
	-- 			if opts then
	-- 				options = vim.tbl_extend("force", options, opts)
	-- 			end
	-- 			vim.api.nvim_set_keymap(mode, lhs, rhs, options)
	-- 		end

	-- 		map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true })
	-- 		map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true })
	-- 		map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
	-- 		map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
	-- 		map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
	-- 		map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
	-- 		map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
	-- 		map(
	-- 			"n",
	-- 			"<leader>bc",
	-- 			":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
	-- 			{ silent = true }
	-- 		)
	-- 		map(
	-- 			"n",
	-- 			"<leader>l",
	-- 			":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
	-- 			{ silent = true }
	-- 		)
	-- 	end,
	-- },

	-- test
	{
		"vim-test/vim-test",
		config = function()
			vim.api.nvim_exec(
				[[
					let test#strategy= "neovim"
					let test#neovim#term_position = "vert"
					let test#neovim#start_normal = 1 " if using neovim strategy
					let test#basic#start_normal = 1 " if using basic strategy

					let g:test#runner_commands = ['Jest', 'Playwright']
				]],
				false
			)
		end,
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"vim-test/vim-test",
			"haydenmeade/neotest-jest",
			"nvim-neotest/neotest-vim-test",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-jest")({}),
					-- require("neotest-python")({
					-- 	dap = { justMyCode = false },
					-- }),
					-- require("neotest-plenary"),
					require("neotest-vim-test")({
						-- ignore_file_types = { "python", "vim", "lua" },
					}),
				},
			})

			local opts = { noremap = true, silent = true }

			vim.api.nvim_set_keymap("n", "tn", '<cmd>lua require("neotest").run.run()<CR>', opts)
			vim.api.nvim_set_keymap("n", "tc", '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
			vim.api.nvim_set_keymap("n", "td", '<cmd>lua require("neotest").run.run({ strategy = "dap" })<CR>', opts)
			vim.api.nvim_set_keymap("n", "ts", '<cmd>lua require("neotest").run.stop()<CR>', opts)
			vim.api.nvim_set_keymap("n", "ta", '<cmd>lua require("neotest").run.attach()<CR>', opts)
			vim.api.nvim_set_keymap("n", "to", '<cmd>lua require("neotest").output.open({ enter = true })<CR>', opts)
			vim.api.nvim_set_keymap("n", "tt", '<cmd>lua require("neotest").summary.toggle()<CR>', opts)
		end,
	},

	-- fuzzy finder
	-- { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },

	-- "junegunn/fzf.vim",

	{ "nvim-lua/plenary.nvim" },

	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-github.nvim",
		},
		config = function()
			local telescope = require("telescope")

			if telescope then
				-- telescope.load_extension("fzf")
				-- telescope.load_extension("dap")
				telescope.load_extension("gh")

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
							"--hidden",
						},
					},
					pickers = {
						find_files = {
							find_comand = "rg",
							hidden = true,
							no_ignore = false,
						},
					},
					extensions = {
						fzf = {
							fuzzy = true, -- false will only do exact matching
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

	-- window resizer
	{
		"simeji/winresizer",
		config = function()
			vim.api.nvim_exec(
				[[
          let g:winresizer_start_key = '<C-E>'
        ]],
				false
			)
		end,
	},

	-- replace in project
	{ "dyng/ctrlsf.vim" },

	{ "thinca/vim-qfreplace" },

	{
		"nvim-pack/nvim-spectre",
		config = function()
			require("spectre").setup()
		end,
	},

	-- text operator
	{ "tpope/vim-surround" },

	{ "machakann/vim-sandwich" },

	-- terraform
	{
		"hashivim/vim-terraform",
		config = function()
			vim.api.nvim_exec(
				[[
					let g:terraform_fmt_on_save = 1
				]],
				false
			)
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

	-- path copy utitlity ex`:CopyPath`
	{ "vim-scripts/copypath.vim" },

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- faster scroll
	{
		"PHSix/faster.nvim",
		event = { "VimEnter *" },
		config = function()
			local faster = require("faster")

			if faster then
				vim.api.nvim_set_keymap("n", "j", "<Plug>(faster_move_j)", { noremap = false, silent = true })
				vim.api.nvim_set_keymap("n", "k", "<Plug>(faster_move_k)", { noremap = false, silent = true })
			end
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
})
