-- nvim-lsp enhance opts
vim.g.enhance_lsp_opts = {}
local LUA_PATH = vim.split(package.path, ';')
table.insert(LUA_PATH, "lua/?.lua")
table.insert(LUA_PATH, "lua/?/init.lua")

local fn = vim.fn


-- setup script for when not installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(vim.fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
	})
end

-- for lazy loading
vim.cmd [[packadd packer.nvim]]

local packer = require 'packer'
packer.init({
	max_jobs = 50
})

-- plugins
packer.startup(function(use)
	-- boiler use {'tpope/vim-sensible'}
	-- editorconfig
	use { 'editorconfig/editorconfig-vim' }

	-- color
	use {
		'nvim-treesitter/nvim-treesitter',
		requires = {
			'tpope/vim-commentary',
			'JoosepAlviste/nvim-ts-context-commentstring',
			-- 'windwp/nvim-ts-autotag',
			'nvim-treesitter/playground',
		},
		run = ':TSUpdate',
		config = function()
			require 'nvim-treesitter.configs'.setup {
				highlight = { enable = true },
				-- autotag = {
				-- 	enable = true,
				-- },
				context_commentstring = {
					enable = true
				},
				playground = {
					enable = true,
					disable = {},
					updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
					persist_queries = false, -- Whether the query persists across vim sessions
					keybindings = {
						toggle_query_editor = 'o',
						toggle_hl_groups = 'i',
						toggle_injected_languages = 't',
						toggle_anonymous_nodes = 'a',
						toggle_language_display = 'I',
						focus_language = 'f',
						unfocus_language = 'F',
						update = 'R',
						goto_node = '<cr>',
						show_help = '?',
					},
				}
			}
		end
	}
	use {
		'folke/tokyonight.nvim',
		config = function()
			vim.g.tokyonight_style = "night"
			vim.g.tokyonight_italic_functions = true
			vim.cmd [[colorscheme tokyonight]]
		end
	}
	use {
		'marko-cerovac/material.nvim',
		config = function()
			vim.g.material_style = "deep ocean"
			-- vim.cmd [[colorscheme material]]
		end
	}

	-- tmux
	use { 'christoomey/vim-tmux-navigator' }

	-- lua
	use { 'folke/lua-dev.nvim' }
	use { 'andrejlevkovitch/vim-lua-format' }

	-- symbol view
	use { 'liuchengxu/vista.vim', config = function() end }

	use { 'vim-denops/denops.vim' }

	use { 'rafamadriz/friendly-snippets' }

	use {
		'hrsh7th/vim-vsnip',
		config = function()
			vim.api.nvim_exec([[
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
			]], false)
		end
	}

	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lsp-document-symbol',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lua',
			'hrsh7th/cmp-cmdline',
			'hrsh7th/cmp-emoji',
			'onsails/lspkind.nvim',
			'yutkat/cmp-mocword',
			'f3fora/cmp-spell',
		},
		config = function()
			local cmp = require 'cmp'
			local lspkind = require('lspkind')

			cmp.setup({
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol_text', -- show only symbol annotations
						maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						before = function(entry, vim_item)
							if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
								vim_item.menu = entry.completion_item.detail
							else
								vim_item.menu = ({
									nvim_lsp = "[LSP]",
									luasnip = "[Snippet]",
									buffer = "[Buffer]",
									path = "[Path]",
								})[entry.source.name]
							end
							return vim_item
						end
					})
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
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),
					['<C-Space>'] = cmp.mapping.complete(),
					['<C-e>'] = cmp.mapping.abort(),
					['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp' },
					{ name = 'nvim_lsp_signature_help' },
					{ name = 'vsnip' },
				}, {
					{ name = 'buffer' },
					{ name = 'emoji' },
					{ name = 'spell' },
					{ name = 'mocword' },
				})
			})

			-- Set configuration for specific filetype.
			cmp.setup.filetype('gitcommit', {
				sources = cmp.config.sources({
					{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
				}, {
					{ name = 'buffer' },
					{ name = 'emoji' },
					{ name = 'spell' },
					{ name = 'mocword' },
				})
			})

			cmp.setup.filetype('lua', {
				sources = cmp.config.sources({
					{ name = 'nvim_lua' },
				}, {
					{ name = 'buffer' },
					{ name = 'emoji' },
					{ name = 'spell' },
					{ name = 'mocword' },
				})
			})

			-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline('/', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'nvim_lsp_document_symbol' },
				}, {
					{ name = 'buffer' },
					{ name = 'spell' },
					{ name = 'mocword' },
				})
			})

			-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = 'path' }
				}, {
					{ name = 'cmdline' }
				})
			})
		end
	}

	use 'rcarriga/nvim-notify'

	use {
		'stevearc/dressing.nvim',
		requires = {
			'nvim-telescope/telescope.nvim',
		},
		config = function()
			require('dressing').setup({
				select = {
					telescope = require('telescope.themes').get_cursor({
						layout_config = {
							width = 100,
							height = 20,
						}
					})
				}
			})
		end
	}

	use {
		'williamboman/mason.nvim',
		requires = {
			'williamboman/mason-lspconfig.nvim',
			'neovim/nvim-lspconfig',
			"nvim-lua/plenary.nvim",
			'tamago324/nlsp-settings.nvim',
			'nvim-lua/lsp-status.nvim',
			'folke/lsp-colors.nvim',
			'jose-elias-alvarez/nvim-lsp-ts-utils',
			"jose-elias-alvarez/null-ls.nvim",
			'j-hui/fidget.nvim',
			'lvimuser/lsp-inlayhints.nvim',
			'ray-x/go.nvim',
			'ray-x/guihua.lua',
		},
		config = function()
			-- local lsp_installer = require 'nvim-lsp-installer'
			local mason = require('mason')
			local mason_lspconfig = require('mason-lspconfig')
			local lsp_config = require('lspconfig')
			local lsp_status = require('lsp-status')
			local nlspsettings = require("nlspsettings")
			local null_ls = require('null-ls')
			local lps_inlayhints = require('lsp-inlayhints')


			lps_inlayhints.setup({
				inlay_hints = {
					only_current_line = true
				}
			})

			-- lsp indicator
			lsp_status.register_progress()
			require "fidget".setup {}

			nlspsettings.setup({
				config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
				local_settings_dir = ".nlsp-settings",
				local_settings_root_markers = { '.git' },
				append_default_schemas = true,
				loader = 'json'
			})

			local lspFormattingGroup = vim.api.nvim_create_augroup("LspFormatting", {})

			-- disable diagnostics virtual_text
			vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
				vim.lsp.diagnostic.on_publish_diagnostics,
				{
					virtual_text = false,
					underline = true,
					signs = true,

					-- update_in_insert = true,
				}
			)

			-- normal mode のとき CUrsorHod 舌箇所の diagnostics を float で表示
			-- vim.api.nvim_exec([[
			-- 	autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focus=false })
			-- ]], false)

			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
			vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
			vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
			vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

			local function common_on_attach(client, bufnr)
				-- attach lsp-status
				lsp_status.on_attach(client)

				-- attach lsp-inlayhints
				lps_inlayhints.on_attach(client, bufnr)


				vim.api.nvim_command [[autocmd CursorHold,CursorHoldI,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]]
				vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>l", "<Cmd>lua vim.lsp.codelens.run()<CR>", { silent = true; })

				-- Enable completion triggered by <c-x><c-o>
				vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

				-- Mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl',
					'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'cr', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi',
					"<cmd>lua require'telescope.builtin'.lsp_implementations(require('telescope.themes').get_ivy({}))<CR>", opts)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.type_declaration()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD',
					"<cmd>lua require'telescope.builtin'.lsp_type_definitions(require('telescope.themes').get_ivy({}))<CR>", opts)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd',
					"<cmd>lua require'telescope.builtin'.lsp_definitions(require('telescope.themes').get_ivy({}))<CR>", opts)

				-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr',
					"<cmd>lua require'telescope.builtin'.lsp_references(require('telescope.themes').get_ivy({ show_line = false, fname_width = 100 }))<CR>"
					, opts)

				vim.api.nvim_buf_set_keymap(bufnr, 'n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
				vim.api.nvim_buf_set_keymap(bufnr, 'v', 'ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)

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

			local common_capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
			common_capabilities = vim.tbl_extend('keep', common_capabilities, lsp_status.capabilities)

			mason.setup({})

			mason_lspconfig.setup({})

			mason_lspconfig.setup_handlers({
				function(server_name)
					lsp_config[server_name].setup({
						on_attach = common_on_attach,
						capabilities = common_capabilities
					})
				end,
				['sumneko_lua'] = function()
					local luadev = require('lua-dev').setup({
						library = {
							vimruntime = true,
							types = true,
							plugins = { "nvim-treesitter", "plenary.nvim", "neotest" },
						},
						runtime_path = false, -- enable this to get completion in require strings. Slow!
						lspconfig = {
							on_attach = common_on_attach,
							capabilities = common_capabilities,
							settings = {
								Lua = {
									runtime = {
										-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
										version = 'LuaJIT',
										-- Setup your lua path
										path = LUA_PATH,
									},
									diagnostics = {
										-- Get the language server to recognize the `vim` global
										globals = { 'vim' },
									},
									-- Do not send telemetry data containing a randomized but unique identifier
									telemetry = {
										enable = false,
									},

									-- single_file_support = false,
									-- workspace = { library = vim.api.nvim_get_runtime_file('', true) },
								},
							},
						}
					})

					lsp_config.sumneko_lua.setup(luadev)
				end,
				['denols'] = function()
					lsp_config.denols.setup({
						on_attach = function(client, bufnr)
							common_on_attach(client, bufnr)
						end,
						capabilities = common_capabilities,
						root_dir = lsp_config.util.root_pattern("deno.json"),
						single_file_support = false, -- default true なため、root_dir を見るよう false にする
						autostart = false
					})
				end,
				['gopls'] = function()
					-- require('go').setup({})

					lsp_config.gopls.setup({
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
									rangeVariableTypes = true
								},
							},
						}
					})
				end,
				['tsserver'] = function()
					lsp_config.tsserver.setup({
						root_dir = lsp_config.util.root_pattern("package.json"),
						on_attach = function(client, bufnr)
							common_on_attach(client, bufnr)

							-- client.resolved_capabilities.document_formatting = false
							client.server_capabilities.document_formatting = false

							local ts_utils = require('nvim-lsp-ts-utils')
							ts_utils.setup({
								update_imports_on_move = true,
								require_confirmation_on_move = true,
								auto_inlay_hints = false
							})

							-- required to fix code action ranges and filter diagnostics
							ts_utils.setup_client(client)

							-- no default maps, so you may want to define some here
							local opts = { silent = true }

							vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>io", ":TSLspOrganize<CR>", opts)
							vim.api.nvim_buf_set_keymap(bufnr, "n", "rf", ":TSLspRenameFile<CR>", opts)
							vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>ia", ":TSLspImportAll<CR>", opts)
						end,
						capabilities = common_capabilities,
						settings = {
							typescript = {
								inlayHints = {
									includeInlayParameterNameHints = 'all',
									includeInlayParameterNameHintsWhenArgumentMatchesName = false,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								}
							},
							javascript = {
								inlayHints = {
									includeInlayParameterNameHints = 'all',
									includeInlayParameterNameHintsWhenArgumentMatchesName = false,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								}
							}
						}
					})
				end,
				['eslint'] = function()
					lsp_config.eslint.setup({
						on_attach = function(client, bufnr)
							client.server_capabilities.document_formatting = true
							client.server_capabilities.document_range_formatting = true

							common_on_attach(client, bufnr)

							-- @see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
							vim.api.nvim_create_autocmd("BufWritePre", {
								group = lspFormattingGroup,
								pattern = { '*.tsx', '*.ts', '*.jsx', '*.js' },
								command = 'silent! EslintFixAll',
							})
						end,
						settings = {
							codeActionOnSave = {
								enable = true,
								mode = "all"

							},
							format = {
								enable = true,
							}, -- this will enable formatting
						}
					})
				end
			})

			null_ls.setup {
				sources = {
					-- null_ls.builtins.code_actions.eslint,
					null_ls.builtins.formatting.prettier,
					-- null_ls.builtins.formatting.goimports,
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.formatting.stylua,
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
			}
		end,
	}

	-- LSP / line diagnostics
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup({})

			vim.diagnostic.config({
				virtual_text = false,
				virtual_lines = { only_current_line = true }
			})


			-- vim.api.nvim_create_autocmd('InsertEnter', {
			-- 	callback = function()
			-- 		vim.diagnostic.config({ virtual_lines = false })
			-- 	end
			-- })
			-- vim.api.nvim_create_autocmd('ModeChanged', {
			-- 	pattern = 'i:*',
			-- 	callback = function()
			-- 		vim.diagnostic.config({ virtual_lines = true })
			-- 	end
			-- })
		end,
	})

	-- LSP / diagnostics UI
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}

			vim.api.nvim_set_keymap('n', '<F4>', ':TroubleToggle<CR>', { noremap = true, silent = true })
		end
	}

	-- buffer delete imple
	use 'famiu/bufdelete.nvim'

	-- buffer ui
	-- use {
	-- 	'akinsho/bufferline.nvim',
	-- 	tag = "*",
	-- 	requires = { 'kyazdani42/nvim-web-devicons' },
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
	-- }
	use {
		'romgrk/barbar.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
		config = function()
			vim.api.nvim_set_keymap('n', '<C-n>', ':BufferNext<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', '<C-p>', ':BufferPrev<CR>', { noremap = true, silent = true })
			vim.api.nvim_exec([[ nnoremap <silent> <space>x :BufferClose<CR> ]], false)
			vim.api.nvim_exec([[
					let g:fern#default_hidden=1
					let g:fern#width=50
					let g:fern#renderer='nerdfont'

					function! FernInit() abort
						nmap <buffer> <C-L> :TmuxNavigateRight<CR>
					endfunction

					augroup FernEvents
						autocmd!
						autocmd FileType fern call FernInit()
					augroup END
				]], false)
		end
	}

	-----------------------------------------------------
	-- status line
	-----------------------------------------------------
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'nvim-lua/lsp-status.nvim'
		},
		config = function()
			local lualine = require('lualine')

			if lualine then
				lualine.setup {
					options = {
						icons_enabled = true,
						-- theme = 'auto',
						theme = 'tokyonight',
						-- theme = 'material-nvim',
						component_separators = { left = ' ', right = ' ' },
						section_separators = { left = ' ', right = ' ' },
						always_divide_middle = true
					},
					sections = {
						lualine_a = { 'mode' },
						lualine_b = {
							'branch', 'diff', { 'diagnostics', sources = { 'coc' } }
						},
						lualine_c = { 'g:coc_status', "require'lsp-status'.status()", 'filename' },
						lualine_x = { 'encoding', 'fileformat', 'filetype' },
						lualine_y = { 'progress' },
						lualine_z = { 'location' }
					},
					inactive_sections = {
						lualine_a = {},
						lualine_b = {},
						lualine_c = { 'filename' },
						lualine_x = { 'location' },
						lualine_y = {},
						lualine_z = {}
					},
					tabline = {},
					extensions = { 'fern' }
				}
			end
		end
	}

	-----------------------------------------------------
	-- filer
	-----------------------------------------------------
	use {
		'lambdalisue/fern.vim',
		config = function()
			vim.api.nvim_set_keymap('n', '<F2>', ':Fern . -drawer -width=50 -toggle<CR>', { noremap = true, silent = true })
			vim.api.nvim_set_keymap('n', 'ss', ':Fern . -drawer -width=50 -reveal=%<CR><CR>', { noremap = true, silent = true })
			vim.g.fern_disable_startup_warnings = 1
		end
	}
	use {
		'lambdalisue/fern-renderer-nerdfont.vim',
		requires = { 'lambdalisue/nerdfont.vim' }
	}
	use { 'lambdalisue/fern-git-status.vim' }
	use { 'lambdalisue/fern-hijack.vim' }
	use { 'lambdalisue/glyph-palette.vim' }

	-----------------------------------------------------
	-- git
	-----------------------------------------------------
	use { 'iberianpig/tig-explorer.vim' }
	use { 'tpope/vim-fugitive' }
	-- github extenstions for fugitive
	use { 'tpope/vim-rhubarb' }
	use { 'TimUntersberger/neogit' }
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
	use {
		'akinsho/git-conflict.nvim',
		tag = "*",
		config = function()
			require('git-conflict').setup()
		end
	}
	use {
		'lewis6991/gitsigns.nvim',
		requires = { 'nvim-lua/plenary.nvim' },
		config = function()
			require('gitsigns').setup {
				signs = {
					add = {
						hl = 'GitSignsAdd',
						text = '│',
						numhl = 'GitSignsAddNr',
						linehl = 'GitSignsAddLn'
					},
					change = {
						hl = 'GitSignsChange',
						text = '│',
						numhl = 'GitSignsChangeNr',
						linehl = 'GitSignsChangeLn'
					},
					delete = {
						hl = 'GitSignsDelete',
						text = '_',
						numhl = 'GitSignsDeleteNr',
						linehl = 'GitSignsDeleteLn'
					},
					topdelete = {
						hl = 'GitSignsDelete',
						text = '‾',
						numhl = 'GitSignsDeleteNr',
						linehl = 'GitSignsDeleteLn'
					},
					changedelete = {
						hl = 'GitSignsChange',
						text = '~',
						numhl = 'GitSignsChangeNr',
						linehl = 'GitSignsChangeLn'
					}
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				keymaps = {
					-- Default keymap options
					noremap = true,

					['n ]c'] = {
						expr = true,
						"&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'"
					},
					['n [c'] = {
						expr = true,
						"&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'"
					}

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
					virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false
				},
				current_line_blame_formatter_opts = { relative_time = false },
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000,
				preview_config = {
					-- Options passed to nvim_open_win
					border = 'single',
					style = 'minimal',
					relative = 'cursor',
					row = 0,
					col = 1
				},
				yadm = { enable = false }
			}
		end
		-- tag = 'release' -- To use the latest release
	}
	use {
		'samoshkin/vim-mergetool',
		config = function()
			vim.api.nvim_exec([[
          let g:mergetool_layout = 'lmr'
          let g:mergetool_prefer_revision = 'local'
        ]], false)
		end
	}
	use {
		'pwntester/octo.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope.nvim',
			'kyazdani42/nvim-web-devicons',
		},
		config = function()
			require "octo".setup()
		end
	}

	-- debugger
	use {
		"microsoft/vscode-js-debug",
		opt = true,
		run = "npm install --legacy-peer-deps && npm run compile"
	}

	use {
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
			"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			vim.fn.sign_define('DapBreakpoint', { text = '⛔', texthl = '', linehl = '', numhl = '' })
			vim.fn.sign_define('DapStopped', { text = '👉', texthl = '', linehl = '', numhl = '' })

			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "watches", size = 0.20 },
							{ id = "stacks", size = 0.20 },
							{ id = "breakpoints", size = 0.20 },
							{ id = "scopes", size = 0.40 },
						},
						size = 64,
						position = "right",
					},
					{
						elements = {
							"repl",
							"console",
						},
						size = 0.20,
						position = "bottom",
					},
				},
			})

			require('dap-go').setup()

			require('dap-vscode-js').setup({
				debugger_path = vim.fn.stdpath('data') .. "/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
				adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' },
			})

			dap.adapters.node2 = {
				type = 'executable',
				command = 'node',
				args = { os.getenv('HOME') .. '/ghq/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js' },
			}

			dap.adapters.chrome = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/ghq/github.com/microsoft/vscode-chrome-debug/out/src/chromeDebug.js" } -- TODO adjust
			}

			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require 'dap.utils'.pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug Jest Tests",
					trace = true, -- include debugger info
					runtimeExecutable = "node",
					runtimeArgs = {
						"./node_modules/jest/bin/jest.js",
						"--runInBand",
					},
					rootPath = "${workspaceFolder}",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
				}
			}

			dap.configurations.javascriptreact = dap.configurations.javascript
			dap.configurations.typescript = dap.configurations.javascript
			dap.configurations.typescriptreact = dap.configurations.javascript

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local function map(mode, lhs, rhs, opts)
				local options = { noremap = true }
				if opts then options = vim.tbl_extend('force', options, opts) end
				vim.api.nvim_set_keymap(mode, lhs, rhs, options)
			end

			map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true })
			map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true })
			map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
			map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
			map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
			map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
			map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
			map("n", "<leader>bc", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
				{ silent = true })
			map("n", "<leader>l", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
				{ silent = true })
		end
	}

	-- test
	use {
		"vim-test/vim-test",
		config = function()
			vim.api.nvim_exec([[
					let test#strategy= "neovim"
					let test#neovim#term_position = "vert"
					let test#neovim#start_normal = 1 " if using neovim strategy
					let test#basic#start_normal = 1 " if using basic strategy
				]], false)
		end
	}

	use {
		"nvim-neotest/neotest",
		requires = {
			"nvim-lua/plenary.nvim",
			"vim-test/vim-test",
			'haydenmeade/neotest-jest',
			"nvim-neotest/neotest-vim-test",
			"nvim-treesitter/nvim-treesitter",
			"antoinemadec/FixCursorHold.nvim"
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require('neotest-jest')({}),
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

			vim.api.nvim_set_keymap('n', 'tn', '<cmd>lua require("neotest").run.run()<CR>', opts)
			vim.api.nvim_set_keymap('n', 'tc', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>', opts)
			vim.api.nvim_set_keymap('n', 'td', '<cmd>lua require("neotest").run.run({ strategy = "dap" })<CR>', opts)
			vim.api.nvim_set_keymap('n', 'ts', '<cmd>lua require("neotest").run.stop()<CR>', opts)
			vim.api.nvim_set_keymap('n', 'ta', '<cmd>lua require("neotest").run.attach()<CR>', opts)
			vim.api.nvim_set_keymap('n', 'to', '<cmd>lua require("neotest").output.open({ enter = true })<CR>', opts)
			vim.api.nvim_set_keymap('n', 'tt', '<cmd>lua require("neotest").summary.toggle()<CR>', opts)
		end
	}


	-- fuzzy finder
	use { 'junegunn/fzf', dir = '~/.fzf', run = './install --all' }
	use { 'junegunn/fzf.vim' }
	use { 'nvim-lua/plenary.nvim' }
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			-- 'nvim-telescope/telescope-ui-select.nvim',
			'nvim-telescope/telescope-fzf-native.nvim',
			'nvim-telescope/telescope-dap.nvim',
			'nvim-telescope/telescope-github.nvim',
		},
		config = function()
			local telescope = require('telescope')

			if telescope then
				telescope.setup {
					defaults = {
						theme = "cursor",
						sorting_strategy = "ascending",
						layout_config = { prompt_position = "top" },
						mappings = {
							i = {
								['<F2>'] = require('telescope.actions.layout').toggle_preview
							}
						},
						vimgrep_arguments = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
							"--hidden"
						}
					},
					pickers = {
						find_files = {
							find_comand = 'rg',
							hidden = true,
							no_ignore = false
						}
					},
					extensions = {
						fzf = {
							fuzzy = true, -- false will only do exact matching
							override_generic_sorter = true, -- override the generic sorter
							override_file_sorter = true, -- override the file sorter
							case_mode = "smart_case" -- or "ignore_case" or "respect_case"
							-- the default case_mode is "smart_case"
						},
						-- ["ui-select"] = {
						-- 	require("telescope.themes").get_cursor {}
						-- }
					}
				}

				-- telescope.load_extension("ui-select")
				telescope.load_extension('fzf')
				telescope.load_extension('dap')
				telescope.load_extension('gh')
			end

			vim.api.nvim_exec([[
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
      ]], false)
		end
	}

	-- window resizer
	use {
		'simeji/winresizer',
		config = function()
			vim.api.nvim_exec([[
          let g:winresizer_start_key = '<C-E>'
        ]], false)
		end
	}

	-- replace in project
	use { 'dyng/ctrlsf.vim' }
	use { 'thinca/vim-qfreplace' }
	use {
		'nvim-pack/nvim-spectre',
		config = function()

			require('spectre').setup()
		end
	}

	-- text operator
	use { 'tpope/vim-surround' }
	use { 'machakann/vim-sandwich' }

	-- terraform
	use {
		'hashivim/vim-terraform',
		config = function()
			vim.api.nvim_exec([[
					let g:terraform_fmt_on_save = 1
				]], false)
		end
	}

	use {
		'folke/zen-mode.nvim',
		config = function()
			require("zen-mode").setup {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	}


	-- line coloring for modes
	use({
		'mvllow/modes.nvim',
		config = function()
			require('modes').setup({
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
		end
	})

	-- path copy utitlity (ex`:CopyPath`
	use { 'vim-scripts/copypath.vim' }


	-- markdown preview
	use {
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	}

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

-- `:PackerCompile` automatically in write `plugin.lua`
vim.cmd([[
  augroup packer_user_config
    autocmd!
    " autocmd BufWritePre plugins.lua lua vim.lsp.stop_client(vim.lsp.get_active_clients())
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
