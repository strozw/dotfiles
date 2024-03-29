return {
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
			-- "yioneko/nvim-vtsls",
			"nvimtools/none-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy" },
			"lvimuser/lsp-inlayhints.nvim",
			"pmizio/typescript-tools.nvim",
			'dmmulroy/ts-error-translator.nvim',
			"ray-x/go.nvim",
			"ray-x/guihua.lua",
			"strozw/github-actions-languageserver.nvim",
			"lukas-reineke/lsp-format.nvim",
			"MunifTanjim/prettier.nvim",
			"b0o/schemastore.nvim",
			-- { dir = "~/ghq/github.com/strozw/github-actions-languageserver.nvim" },
			{
				'mrcjkb/rustaceanvim',
				version = '^4', -- Recommended
				-- ft = { 'rust' },
			},
		},
		config = function()
			require("neodev").setup({
				library = {
					enabled = true,
					runtime = true,
					types = true,
					plugins = true,
				},
				lspconfig = true,
				-- pathStrict = false,
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

			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local lsp_status = require("lsp-status")
			local nlspsettings = require("nlspsettings")
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

			-- normal mode のとき CursorHodld 箇所の diagnostics を float で表示
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
					vim.diagnostic.config({ virtual_text = false, underline = true, signs = true })

					lsp_format.on_attach(client, buffer)

					-- Mappings.
					local keymap_opts = { buffer = buffer }

					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set("n", "K", vim.lsp.buf.hover, keymap_opts)
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

			mason_lspconfig.setup({})

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
						-- ref: https://github.com/neovim/nvim-lspconfig/issues/319#issuecomment-1192399104
						-- single_file_support = false,
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
				-- 		capabilities = common_capabilities,
				-- 	})
				-- end,
				-- ["solargraph"] = function()
				-- 	lspconfig.solargraph.setup({
				-- 		capabilities = common_capabilities,
				-- 		root_dir = function(fname)
				-- 			local hasSorbetConfig = lspconfig_util.root_pattern("sorbet")(fname)

				-- 			if hasSorbetConfig then
				-- 				return nil
				-- 			end

				-- 			local hasSolargraphConfig =
				-- 				lspconfig_util.root_pattern(".solargraph.yaml", ".solargraph.yml")(fname)

				-- 			return hasSolargraphConfig
				-- 		end,
				-- 	})
				-- end,
				-- ["sorbet"] = function()
				-- 	lspconfig.sorbet.setup({
				-- 		capabilities = common_capabilities,
				-- 		root_dir = function(fname)
				-- 			local hasSolargraphConfig =
				-- 				lspconfig_util.root_pattern(".solargraph.yaml", ".solargraph.yml")(fname)

				-- 			local hasSorbetConfig = lspconfig_util.root_pattern("sorbet")(fname)

				-- 			return not hasSolargraphConfig and hasSorbetConfig
				-- 		end,
				-- 	})
				-- end,
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
				["tailwindcss"] = function()
					lspconfig.tailwindcss.setup({
						capabilities = common_capabilities,
					})
				end,
				["tsserver"] = function()
					local lang_config = {
						inlayHints = {
							includeInlayEnumMemberValueHints = true,
							includeInlayFunctionLikeReturnTypeHints = true,
							includeInlayFunctionParameterTypeHints = true,
							includeInlayParameterNameHints = "all",
							includeInlayParameterNameHintsWhenArgumentMatchesName = false,
							includeInlayPropertyDeclarationTypeHints = true,
							includeInlayVariableTypeHints = true,
							includeInlayVariableTypeHintsWhenTypeMatchesName = true
						},
						implementationsCodeLens = true,
						referencesCodeLens = {
							enabled = true,
							showOnAllFunctions = true,
						}
					}

					-- lspconfig.tsserver.setup({
					-- 	root_dir = lspconfig.util.root_pattern("package.json"),
					-- 	on_attach = function(client)
					-- 		client.server_capabilities.document_formatting = false
					-- 	end,
					-- 	capabilities = common_capabilities,
					-- 	settings = {
					-- 		typescript = lang_config,
					-- 		javascript = lang_config,
					-- 	},
					-- })


					require("typescript-tools").setup({
						root_dir = lspconfig.util.root_pattern("package.json"),
						on_attach = function(client)
							client.server_capabilities.document_formatting = false
						end,
						capabilities = common_capabilities,
						init_options = {
							preferences = {
								importModuleSpecifier = "non-relative"
							}
						},
						settings = {
							-- tsserver_locale = "ja",
							-- code_lens = "all"
						}
					})

					require("ts-error-translator").setup()
				end,

				-- ["vtsls"] = function()
				-- 	lspconfig.vtsls.setup({
				-- 		capabilities = common_capabilities,
				-- 		settings = {
				-- 			["typescript.inlayHints.parameterNames.suppressWhenArgumentMatchesName"] = true,
				-- 			["typescript.inlayHints.parameterTypes.enabled"] = true,
				-- 			["typescript.inlayHints.variableTypes.enabled"] = true,
				-- 			["typescript.inlayHints.variableTypes.suppressWhenTypeMatchesName"] = true,
				-- 			["typescript.inlayHints.propertyDeclarationTypes.enabled"] = true,
				-- 			["typescript.inlayHints.functionLikeReturnTypes.enabled"] = true,
				-- 			["typescript.inlayHints.enumMemberValues.enabled"] = true,
				-- 			typescript = {
				-- 				inlayHints = {
				-- 					parameterNames = {
				-- 						suppressWhenArgumentMatchesName = true,
				-- 					},
				-- 					parameterTypes = {
				-- 						enabled = true,
				-- 					},
				-- 					variableTypes = {
				-- 						enabled = true,
				-- 						suppressWhenTypeMatchesName = true,
				-- 					},
				-- 					propertyDeclarationTypes = {
				-- 						enabled = true,
				-- 					},
				-- 					functionLikeReturnTypes = {
				-- 						enabled = true,
				-- 					},
				-- 					enumMemberValues = {
				-- 						enabled = true,
				-- 					},
				-- 				},
				-- 			},
				-- 			["javascript.inlayHints.parameterNames.suppressWhenArgumentMatchesName"] = true,
				-- 			["javascript.inlayHints.parameterTypes.enabled"] = true,
				-- 			["javascript.inlayHints.variableTypes.enabled"] = true,
				-- 			["javascript.inlayHints.variableTypes.suppressWhenTypeMatchesName"] = true,
				-- 			["javascript.inlayHints.propertyDeclarationTypes.enabled"] = true,
				-- 			["javascript.inlayHints.functionLikeReturnTypes.enabled"] = true,
				-- 			["javascript.inlayHints.enumMemberValues.enabled"] = true,
				-- 			javascript = {
				-- 				inlayHints = {
				-- 					parameterNames = {
				-- 						suppressWhenArgumentMatchesName = true,
				-- 					},
				-- 					parameterTypes = {
				-- 						enabled = true,
				-- 					},
				-- 					variableTypes = {
				-- 						enabled = true,
				-- 						suppressWhenTypeMatchesName = true,
				-- 					},
				-- 					propertyDeclarationTypes = {
				-- 						enabled = true,
				-- 					},
				-- 					functionLikeReturnTypes = {
				-- 						enabled = true,
				-- 					},
				-- 					enumMemberValues = {
				-- 						enabled = true,
				-- 					},
				-- 				},
				-- 			},
				-- 		},
				-- 	})
				-- end,
				["emmet_language_server"] = function()
					lspconfig.emmet_language_server.setup({
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
				["cssls"] = function()
					lspconfig.cssls.setup({
						capabilities = common_capabilities,
					})
				end,
				["cssmodules_ls"] = function()
					lspconfig.cssmodules_ls.setup({
						capabilities = common_capabilities,
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
						},
						on_attach = function(client, bufnr)
							-- `vim.lsp.buf.format` なら動作する `lsp-format.nvim` plugin ではなぜか動作しない
							client.server_capabilities.documentFormattingProvider = true

							-- vim.api.nvim_create_autocmd("BufWritePre", {
							-- 	callback = function()
							-- 		vim.lsp.buf.format({
							-- 			filter = function()
							-- 				return client.name == "eslint"
							-- 			end
							-- 		})
							-- 	end
							-- })

							-- vim.api.nvim_create_autocmd("BufWritePre", {
							-- 	buffer = bufnr,
							-- 	command = "EslintFixAll",
							-- })

							vim.api.nvim_create_autocmd("BufWritePre", {
								callback = function()
									client.request(
										'workspace/executeCommand',
										{
											command = 'eslint.applyAllFixes',
											arguments = {
												{
													uri = vim.uri_from_bufnr(bufnr),
													version = vim.lsp.util.buf_versions[bufnr],
												},
											},
										},
										nil,
										0
									)
								end
							})
						end,
					})
				end,
				["stylelint_lsp"] = function()
					lspconfig.stylelint_lsp.setup({
						capabilities = common_capabilities,
						filetypes = { "css", "less", "scss", "sugarss", "vue", "wxss", "javascript", "javascriptreact", "typescript", "typescriptreact", "astro" },
					})
				end
			})

			local prettier = require("prettier")

			prettier.setup({
				bin = 'prettier',
				filetypes = {
					"css",
					"graphql",
					"html",
					"javascript",
					"javascriptreact",
					"json",
					"jsonc",
					"json5",
					"less",
					"markdown",
					"scss",
					"typescript",
					"typescriptreact",
					"yaml",
				},
				["null-ls"] = {
					condition = function()
						return prettier.config_exists({
							-- if `false`, skips checking `package.json` for `"prettier"` key
							check_package_json = true,
						})
					end,
					runtime_condition = function(params)
						-- return false to skip running prettier
						return true
					end,
					timeout = 5000,
				}
			})

			null_ls.setup({
				capabilities = common_capabilities,
				sources = {
					null_ls.builtins.code_actions.gitsigns,
					-- require("none-ls.code_actions.eslint_d"),
					-- require("none-ls.formatting.eslint_d"),
				},
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
	}
}
