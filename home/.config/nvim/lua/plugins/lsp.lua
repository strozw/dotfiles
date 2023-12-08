return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"nvim-lua/plenary.nvim",
			-- "nvim-lua/lsp-status.nvim",
			"tamago324/nlsp-settings.nvim",
			"folke/neodev.nvim",
			"folke/lsp-colors.nvim",
			"yioneko/nvim-vtsls",
			"nvimtools/none-ls.nvim",
			{ "j-hui/fidget.nvim", tag = "legacy" },
			"lvimuser/lsp-inlayhints.nvim",
			"pmizio/typescript-tools.nvim",
			"ray-x/go.nvim",
			"ray-x/guihua.lua",
			"strozw/github-actions-languageserver.nvim",
			"lukas-reineke/lsp-format.nvim",
			-- { dir = "~/ghq/github.com/strozw/github-actions-languageserver.nvim" },
		},
		config = function()
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
			-- local lsp_status = require("lsp-status")
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
			-- lsp_status.register_progress()

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
					-- lsp_status.on_attach(client)

					-- attach lsp-inlayhints
					lps_inlayhints.on_attach(client, buffer)

					-- diagnostic config
					vim.diagnostic.config({ virtual_text = false, underline = true, signs = true })

					lsp_format.on_attach(client, buffer)

					local opts = { buffer = buffer }

					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

					-- Mappings.
					-- See `:help vim.lsp.*` for documentation on any of the below functions
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "H", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
					vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
					vim.keymap.set("n", "<space>wl", function()
						print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
					end, opts)
					vim.keymap.set("n", "cr", vim.lsp.buf.rename, opts)

					-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "gi", function()
						require("telescope.builtin").lsp_implementations(require("telescope.themes").get_ivy({}))
					end, opts)

					-- vim.keymap.set('n', 'gD', function() vim.lsp.buf.type_declaration end, opts)
					vim.keymap.set("n", "gD", function()
						require("telescope.builtin").lsp_type_definitions(require("telescope.themes").get_ivy({}))
					end, opts)

					-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gd", function()
						require("telescope.builtin").lsp_definitions(require("telescope.themes").get_ivy({}))
					end, opts)

					-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gr", function()
						require("telescope.builtin").lsp_references(require("telescope.themes").get_ivy({
							show_line = false,
							fname_width = 100,
						}))
					end, opts)

					vim.keymap.set("n", "ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("v", "ca", function()
						vim.lsp.buf.code_action({ range = vim.lsp.util.compute_range() })
					end, opts)
				end,
			})

			local common_capabilities = require("cmp_nvim_lsp").default_capabilities()
			-- common_capabilities = vim.tbl_extend("keep", common_capabilities, lsp_status.capabilities)

			lspconfig.github_actions.setup({
				capabilities = common_capabilities,
				init_options = {
					logLevel = 1,
					-- repos = {
					-- 	{
					-- 		id = 'MDEwOlJlcG9zaXRvcnkzMzE0NjMxMzY=',
					-- 		owner = 'Baseconnect',
					-- 		organizationOwned = true,
					-- 		name = 'musubu-frontend',
					-- 		workspaceUri = '/Users/satoru/ghq/github.com/Baseconnect/musubu-frontend'
					-- 	}
					-- }
				},
			})

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
				end,
				capabilities = common_capabilities,
			})

			-- lspconfig.solargraph.setup({
			-- 	cmd = { "bundle", "exec", "steep", "langserver" },
			-- 	settings = {
			-- 		solargraph = {
			-- 			-- commandPath = "~/.asdf/shims/solargraph",
			-- 			-- diagnostics = true,
			-- 			completion = true,
			-- 		},
			-- 	},
			-- 	init_options = {
			-- 		-- formatting = false,
			-- 	},
			-- 	on_attach = function(client, bufnr)
			-- 		client.server_capabilities.definitionProvider = true
			-- 	end,
			-- 	capabilities = common_capabilities,
			-- 	root_dir = function(fname)
			-- 		local hasSteepConfig = lspconfig_util.root_pattern("steep")(fname)
			-- 		local hasSorbetConfig = lspconfig_util.root_pattern("sorbet")(fname)

			-- 		if hasSorbetConfig or hasSteepConfig then
			-- 			return nil
			-- 		end

			-- 		local hasSolargraphConfig =
			-- 				lspconfig_util.root_pattern(".solargraph.yaml", ".solargraph.yml")(fname)

			-- 		return hasSolargraphConfig
			-- 	end,
			-- })

			lspconfig.steep.setup({
				cmd = { "bundle", "exec", "steep", "langserver" },
				capabilities = common_capabilities,
				-- root_dir = function(fname)
				-- 	local hasSorbetConfig = lspconfig_util.root_pattern("sorbet")(fname)
				-- 	local hasSolargraphConfig =
				-- 			lspconfig_util.root_pattern(".solargraph.yaml", ".solargraph.yml")(fname)

				-- 	if hasSorbetConfig or hasSolargraphConfig then
				-- 		return nil
				-- 	end

				-- 	local hasSteepConfig = lspconfig_util.root_pattern("steep")(fname)

				-- 	return hasSteepConfig
				-- end,

				-- on_new_config = function(config, root_dir)
				-- end
			})

			require("neodev").setup({
				library = {
					enabled = true,
					runtime = true,
					types = true,
					plugins = true,
				},
			})

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
					})
				end,
				["jsonls"] = function()
					lspconfig.jsonls.setup({
						capabilities = common_capabilities,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
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

					lspconfig.tsserver.setup({
						root_dir = lspconfig.util.root_pattern("package.json"),
						on_attach = function(client)
							client.server_capabilities.document_formatting = false
						end,
						capabilities = common_capabilities,
						settings = {
							typescript = lang_config,
							javascript = lang_config,
						},
					})

					-- require("typescript-tools").setup({
					-- 	root_dir = lspconfig.util.root_pattern("package.json"),
					-- 	on_attach = function(client)
					-- 		client.server_capabilities.document_formatting = false
					-- 	end,
					-- 	capabilities = common_capabilities,
					-- 	settings = {
					-- 		tsserver_locale = "ja",
					-- 		-- code_lens = "all"
					-- 	}
					-- })
				end,
				["vtsls"] = function()
					lspconfig.vtsls.setup({
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
				end,
				["eslint"] = function()
					lspconfig.eslint.setup({
						settings = {
							-- codeActionOnSave = {
							-- 	enable = true,
							-- 	mode = "all",
							-- },
							-- format = {
							-- 	enable = true,
							-- }, -- this will enable formatting
						},
						-- on_attach = function(_client, bufnr)
						-- 	vim.api.nvim_create_autocmd("BufWritePre", {
						-- 		buffer = bufnr,
						-- 		command = "EslintFixAll",
						-- 	})
						-- end,
					})
				end,
				["jsonls"] = function()
					lspconfig.jsonls.setup({
						capabilities = common_capabilities,
						filetypes = { "json", "jsonc", "json5" },
						init_options = {
							provideFormatter = false,
						},
					})
				end,
			})

			null_ls.setup({
				sources = {
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.formatting.eslint_d,
					null_ls.builtins.formatting.prettierd,
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

	-- LSP / diagnostics UI
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})

			vim.api.nvim_set_keymap("n", "<F4>", ":TroubleToggle<CR>", { noremap = true, silent = true })
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
	}
}
