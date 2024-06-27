return {
	{
		"williamboman/mason.nvim",
		dependencies = { "zapling/mason-conform.nvim", "williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			"nvim-lua/lsp-status.nvim",
			"tamago324/nlsp-settings.nvim",
			"folke/lsp-colors.nvim",
			"yioneko/nvim-vtsls",
			"davidmh/cspell.nvim",
			"nvimtools/none-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy" },
			"lvimuser/lsp-inlayhints.nvim",
			-- "pmizio/typescript-tools.nvim",
			'dmmulroy/ts-error-translator.nvim',
			"ray-x/go.nvim",
			"ray-x/guihua.lua",
			"strozw/github-actions-languageserver.nvim",
			"lukas-reineke/lsp-format.nvim",
			"MunifTanjim/prettier.nvim",
			"b0o/schemastore.nvim",
			"folke/neoconf.nvim",
			"Fildo7525/pretty_hover",
			"stevearc/dressing.nvim",
			-- { dir = "~/ghq/github.com/strozw/github-actions-languageserver.nvim" },
			{
				'mrcjkb/rustaceanvim',
				version = '^4', -- Recommended
				-- ft = { 'rust' },
			},
		},
		config = function()
			require("neoconf").setup({
				-- override any of the default settings here
			})

			require("github-actions-languageserver").setup()

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

			-- lspconfig_configs.cspell = {
			-- 	default_config = {
			-- 		filetypes = { "javascript", "javascriptreact", "python", "typescript", "typescriptreact" },
			-- 		root_dir = lspconfig_util.root_pattern(
			-- 			"cspell.json",
			-- 			"cspell.jsonc"
			-- 		),
			-- 	},
			-- }

			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local lsp_status = require("lsp-status")
			local nlspsettings = require("nlspsettings")
			local cspell = require('cspell')
			local null_ls = require("null-ls")
			local lps_inlayhints = require("lsp-inlayhints")
			local fidget = require("fidget")
			local lsp_format = require("lsp-format")


			lps_inlayhints.setup({
				inlay_hints = {
					only_current_line = true,
				},
			})

			-- lsp indicator
			lsp_status.register_progress()

			-- lsp progress indicator
			fidget.setup({})

			nlspsettings.setup({
				config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
				local_settings_dir = ".nlsp-settings",
				local_settings_root_markers = { ".git" },
				append_default_schemas = true,
				loader = "json",
			})

			lsp_format.setup({})

			-- normal mode のとき CursorHold 箇所の diagnostics を float で表示
			-- vim.api.nvim_exec(
			-- 	[[
			-- 	autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false })
			-- ]],
			-- 	false
			-- )

			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap("n", "E", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
			vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
			vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
			vim.api.nvim_set_keymap("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)

			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(event)
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					local buffer = event.buf

					-- attach lsp-status
					lsp_status.on_attach(client)

					-- attach lsp-inlayhints
					lps_inlayhints.on_attach(client, buffer)

					-- diagnostic config
					vim.diagnostic.config({ virtual_text = false, underline = true, signs = true, float = true })

					lsp_format.on_attach(client, buffer)

					-- Mappings.
					local keymap_opts = { buffer = buffer }

					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
					-- vim.keymap.set("n", "H", function() require("pretty_hover").hover() end, keymap_opts)
					vim.keymap.set("n", "H", vim.lsp.buf.signature_help, keymap_opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, keymap_opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, keymap_opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, keymap_opts)
					vim.keymap.set("n", "cr", vim.lsp.buf.rename, keymap_opts)

					-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gi", function()
						require("telescope.builtin").lsp_implementations(require("telescope.themes").get_ivy({}))
					end, keymap_opts)

					-- vim.keymap.set('n', 'gD', function() vim.lsp.buf.type_declaration end, opts)
					vim.keymap.set("n", "gD", function()
						require("telescope.builtin").lsp_type_definitions(require("telescope.themes").get_ivy({}))
					end, keymap_opts)

					-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gd", function()
						require("telescope.builtin").lsp_definitions(require("telescope.themes").get_ivy({}))
					end, keymap_opts)

					-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gr", function()
						require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy({
							show_line = false,
							fname_width = 100,
						}))
					end, keymap_opts)

					vim.keymap.set("n", "ca", vim.lsp.buf.code_action, keymap_opts)
					vim.keymap.set("v", "ca", function()
						vim.lsp.buf.code_action({ range = vim.lsp.util.compute_range() })
					end, keymap_opts)

					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
				end,
			})

			local common_capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
			common_capabilities = vim.tbl_extend("keep", common_capabilities, lsp_status.capabilities)

			lspconfig.github_actions.setup({
				cmd = {
					"github-actions-languageserver",
					"--stdio",
				},
				capabilities = common_capabilities,
				init_options = {
					logLevel = 1,
				},
			})

			lspconfig.redocly.setup({
				capabilities = common_capabilities,
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
				end,
			})

			-- lspconfig.cspell.setup({
			-- 	capabilities = common_capabilities,
			-- 	cmd = {
			-- 		"node",
			-- 		vim.fn.expand(
			-- 			"~/.vscode/extensions/streetsidesoftware.code-spell-checker-3.0.1/packages/_server/dist/main.cjs"
			-- 		),
			-- 		"--stdio"
			-- 	},
			-- 	on_attach = function(client, bufnr)
			-- 		-- client.server_capabilities = vim.tbl_extend("force", client.server_capabilities, {
			-- 		-- 	hoverProvider = true,
			-- 		-- 	definitionProvider = true,
			-- 		-- 	referencesProvider = true,
			-- 		-- 	documentHighlightProvider = true,
			-- 		-- 	documentSymbolProvider = true,
			-- 		-- 	workspaceSymbolProvider = true,
			-- 		-- 	codeActionProvider = true,
			-- 		-- 	codeLensProvider = true,
			-- 		-- 	documentFormattingProvider = true,
			-- 		-- 	documentRangeFormattingProvider = true,
			-- 		-- 	documentOnTypeFormattingProvider = true,
			-- 		-- 	renameProvider = true,
			-- 		-- 	documentLinkProvider = true,
			-- 		-- })
			-- 	end,
			-- })


			lspconfig.solargraph.setup({
				cmd = { "bundle", "exec", "solargraph", "stdio" },
				settings = {
					solargraph = {
						diagnostics = true,
						completion = true,
					},
				},
				init_options = {
					formatting = false,
				},
				on_attach = function(client, bufnr)
					client.server_capabilities.definitionProvider = true
				end,
				capabilities = common_capabilities,
				root_dir = function(fname)
					local hasSteepConfig = lspconfig_util.root_pattern("steep")(fname)
					local hasSorbetConfig = lspconfig_util.root_pattern("sorbet")(fname)

					if hasSorbetConfig or hasSteepConfig then
						return nil
					end

					local hasSolargraphConfig =
							lspconfig_util.root_pattern(".solargraph.yaml", ".solargraph.yml")(fname)

					return hasSolargraphConfig
				end,
			})

			-- lspconfig.steep.setup({
			-- 	cmd = { "bundle", "exec", "steep", "langserver" },
			-- 	capabilities = common_capabilities,
			-- 	-- root_dir = function(fname)
			-- 	-- 	local hasSorbetConfig = lspconfig_util.root_pattern("sorbet")(fname)
			-- 	-- 	local hasSolargraphConfig =
			-- 	-- 			lspconfig_util.root_pattern(".solargraph.yaml", ".solargraph.yml")(fname)

			-- 	-- 	if hasSorbetConfig or hasSolargraphConfig then
			-- 	-- 		return nil
			-- 	-- 	end

			-- 	-- 	local hasSteepConfig = lspconfig_util.root_pattern("steep")(fname)

			-- 	-- 	return hasSteepConfig
			-- 	-- end,

			-- 	-- on_new_config = function(config, root_dir)
			-- 	-- end
			-- })


			mason.setup({})

			mason_lspconfig.setup({
				ensure_installed = { "lua_ls", "rust_analyzer", "yamlls", "jsonls", "cssmodules_ls", "emmet_language_server", "gopls", "denols", "vtsls", "phpactor", "biome" }
			})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = common_capabilities,
					})
				end,
				["yamlls"] = function()
					lspconfig.yamlls.setup({
						capabilities = common_capabilities,
						settings = {
							yaml = {
								schemaStore = {
									enable = false,
									url = "",
								},
								schemas = require('schemastore').yaml.schemas(),
							}
						}
					})
				end,
				["jsonls"] = function()
					lspconfig.jsonls.setup({
						capabilities = common_capabilities,
						filetypes = { "json", "jsonc", "json5" },
						init_options = {
							provideFormatter = false,
						},
						settings = {
							json = {
								schemas = require('schemastore').json.schemas(),
								validate = { enable = true },
							}
						}
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = common_capabilities,
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
				["sorbet"] = function()
					lspconfig.sorbet.setup({
						capabilities = common_capabilities,
						root_dir = function(fname)
							local hasSolargraphConfig =
									lspconfig_util.root_pattern(".solargraph.yaml", ".solargraph.yml")(fname)

							local hasSorbetConfig = lspconfig_util.root_pattern("sorbet")(fname)

							return not hasSolargraphConfig and hasSorbetConfig
						end,
					})
				end,
				["denols"] = function()
					lspconfig.denols.setup({
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
				["vtsls"] = function()
					lspconfig.vtsls.setup({
						capabilities = common_capabilities,
						filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
						settings = {
							complete_function_calls = true,
							vtsls = {
								enableMoveToFileCodeAction = true,
								autoUseWorkspaceTsdk = true,
								experimental = {
									completion = {
										enableServerSideFuzzyMatch = true,
									},
								},
								tsserver = {
									globalPlugins = {
										{
											name = "@vue/typescript-plugin",
											location = require("mason-registry").get_package("vue-language-server"):get_install_path()
													.. "/node_modules/@vue/language-server",
											languages = { "vue" },
											configNamespace = "typescript",
											enableForWorkspaceTypeScriptVersions = true,
										},
									},
								},
							},
							typescript = {
								updateImportsOnFileMove = { enabled = "always" },
								suggest = {
									completeFunctionCalls = true,
								},
								inlayHints = {
									parameterNames = {
										enabled = "literals"
										-- suppressWhenArgumentMatchesName = true,
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

					require('vtsls').config({
						-- customize handlers for commands
						-- handlers = {
						-- 	source_definition = function(err, locations) end,
						-- 	file_references = function(err, locations) end,
						-- 	code_action = function(err, actions) end,
						-- },
						-- automatically trigger renaming of extracted symbol
						refactor_auto_rename = true,
						refactor_move_to_file = {
							-- If dressing.nvim is installed, telescope will be used for selection prompt. Use this to customize
							-- the opts for telescope picker.
							-- telescope_opts = function(items, default) end,
						}
					})
				end,
				["emmet_language_server"] = function()
					lspconfig.emmet_language_server.setup({
						capabilities = common_capabilities,
						filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
						-- Read more about this options in the [vscode docs](https://code.visualstudio.com/docs/editor/emmet#_emmet-configuration).
						-- **Note:** only the options listed in the table are supported.
						init_options = {
							--- @type string[]
							excludeLanguages = {},
							--- @type string[]
							extensionsPath = {},
							--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/preferences/)
							preferences = {},
							--- @type boolean Defaults to `true`
							showAbbreviationSuggestions = true,
							--- @type "always" | "never" Defaults to `"always"`
							showExpandedAbbreviation = "always",
							--- @type boolean Defaults to `false`
							showSuggestionsAsSnippets = false,
							--- @type table<string, any> [Emmet Docs](https://docs.emmet.io/customization/syntax-profiles/)
							syntaxProfiles = {},
							--- @type table<string, string> [Emmet Docs](https://docs.emmet.io/customization/snippets/#variables)
							variables = {},
						}
					})
				end,
				["eslint"] = function()
					lspconfig.eslint.setup({
						settings = {
							codeAction = {
								disableRuleComment = {
									enable = true,
									location = "separateLine"
								},
								showDocumentation = {
									enable = true
								}
							},
							codeActionOnSave = {
								enable = false,
								mode = "all"
							},
							experimental = {
								useFlatConfig = false
							},
							format = true,
							nodePath = "",
							onIgnoredFiles = "off",
							problems = {
								shortenToSingleLine = false
							},
							quiet = false,
							rulesCustomizations = {},
							run = "onType",
							useESLintClass = false,
							validate = "on",
							workingDirectory = {
								mode = "location"
							}
						}
					})
				end,
				["stylelint_lsp"] = function()
					lspconfig.stylelint_lsp.setup({
						capabilities = common_capabilities,
						-- filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss", "javascript", "javascriptreact", "typescript", "typescriptreact", "astro" },
						filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss" },
						settings = {

						},
						on_attach = function(client)
							client.server_capabilities.document_formatting = false
						end,
					})
				end,
				["biome"] = function()
					lspconfig.biome.setup({
						capabilities = common_capabilities,
						on_attach = function(client)
							-- conform で行う
							client.server_capabilities.document_formatting = false
						end,
					})
				end,
				["phpactor"] = function()
					lspconfig.phpactor.setup({
						capabilities = common_capabilities,
						init_options = {
							["language_server_phpstan.enabled"] = false,
							["language_server_psalm.enabled"] = false,
						}
					})
				end
			})

			null_ls.setup({
				capabilities = common_capabilities,
				sources = {
					null_ls.builtins.code_actions.gitsigns,
				},
			})
		end,
	},

	-- LSP / codelens
	{
		'VidocqH/lsp-lens.nvim',
		config = function()
			require 'lsp-lens'.setup({
				enable = true,
				include_declaration = false, -- Reference include declaration
				sections = {             -- Enable / Disable specific request
					definition = false,
					references = true,
					implements = true,
				},
				ignore_filetype = {
					"prisma",
				},
			})
		end
	},

	{
		'stevearc/conform.nvim',
		config = function()
			local util = require("conform.util")

			require('conform').setup({
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 3000,
					lsp_fallback = true,
				},
				formatters_by_ft = {
					json = { "deno_fmt", "prettierd", "biome-check" },
					jsond = { "deno_fmt", "prettierd", "biome-check" },
					markdown = { "prettierd", "biome-check" },
					javascript = { "eslint_d", "prettierd", "biome-check" },
					typescript = { "eslint_d", "prettierd", "biome-check" },
					javascriptreact = { "eslint_d", "prettierd", "biome-check" },
					typescriptreact = { "eslint_d", "prettierd", "biome-check" },
					css = { "stylelint" },
					scss = { "stylelint" },
					sass = { "stylelint" }
				},
				formatters = {
					["deno_fmt"] = {
						cwd = util.root_file({ 'deno.json', }),
						require_cwd = true,
					},
					["stylelint"] = { require_cwd = true, },
					["eslint_d"] = {
						cwd = util.root_file({
							'.eslintrc',
							'.eslintrc.js',
							'.eslintrc.cjs'
						}),
						require_cwd = true,
					},
					["prettierd"] = { require_cwd = true, },
					["biome"] = { require_cwd = true, },
					["biome-check"] = { require_cwd = true, },
				}
			})
		end
	},

	-- {
	-- 	"hinell/lsp-timeout.nvim",
	-- 	dependencies = { "neovim/nvim-lspconfig" },
	-- 	init = function()
	-- 		vim.g.lspTimeoutConfig = {
	-- 			-- see config below
	-- 		}
	-- 	end
	-- },
}
