return {
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
			"f3fora/cmp-spell",
		},
		-- opts = function(_, opts)
		-- 	opts.sources = opts.sources or {}
		-- 	table.insert(opts.sources, {
		-- 		name = "lazydev",
		-- 		group_index = 0, -- set group index to 0 to skip loading LuaLS completions
		-- 	})
		-- end,
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			local common_sources = {
				{ name = "buffer" },
				{ name = "spell" },
			}

			cmp.setup({
				performance = {
					max_view_entries = 1000,
					debounce = 30,
					throttle = 15,
				},
				matching = {},
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol_text", -- show only symbol annotations
						maxwidth = 50,  -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
						ellipsis_char = '...',
						show_labelDetails = true,
						before = function(entry, vim_item)
							local kind = lspkind.cmp_format({ mode = "symbol_text" })(entry, vim_item)
							local menu = kind.menu or ""

							if #menu > 23 then
								menu = string.sub(menu, 1, 23 - 3) .. "..."
							end

							kind.menu = menu

							return kind
						end,
					}),
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
						-- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
						-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
						-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete({}),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				}),
				sources = cmp.config.sources(vim.list_extend({
					{
						name = 'lazydev',
						-- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
						group_index = 0,
					},
					{ name = "copilot",                 group_index = 2 },
					{ name = "nvim_lsp",                group_index = 2, keyword_length = 1 },
					{ name = "nvim_lsp_signature_help", group_index = 2 },
					{ name = "vsnip",                   group_index = 2 },
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
					{
						name = "lazydev",
						group_index = 0, -- set group index to 0 to skip loading LuaLS completions
					},
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
}
