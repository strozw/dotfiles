return {
	-- github copilot
	-- {
	-- 	"github/copilot.vim",
	-- 	config = function()
	-- 		-- I would like to turn off copilot for sensitive projects.
	-- 		-- so if you need use copilot, turn it on in `.nvim.lua` in project root.
	-- 		vim.g.copilot_filetypes = {
	-- 			['*'] = false,
	-- 		}
	-- 	end
	-- },

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
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, {
				name = "lazydev",
				group_index = 0, -- set group index to 0 to skip loading LuaLS completions
			})
		end,
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
					-- debounce = 30,
					-- throttle = 15,
				},
				matching = {},
				window = {
					-- @see {@url https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-get-types-on-the-left-and-offset-the-menu}
					-- completion = {
					-- 	winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
					-- 	col_offset = -3,
					-- 	side_padding = 0,
					-- },
					-- documentation = cmp.config.window.bordered(),
				},
				-- @see {@url https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-get-types-on-the-left-and-offset-the-menu}
				formatting = {
					-- fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
						local kind = lspkind.cmp_format({ mode = "symbol_text" })(entry, vim_item)
						local strings = vim.split(kind.kind, "%s", { trimempty = true })
						kind.kind = " " .. (strings[1] or "") .. " "
						kind.menu = "    (" .. (strings[2] or "") .. ")"

						return kind
					end,
				},
				-- formatting = {
				-- 	format = lspkind.cmp_format({
				-- 		mode = "symbol_text", -- show only symbol annotations
				-- 		maxwidth = 50,  -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
				-- 		-- before = function(entry, vim_item)
				-- 		-- 	-- NOTE: https://stackoverflow.com/questions/72668920/how-to-show-paths-for-auto-imports-with-neovim-nvim-cmp
				-- 		-- 	if entry.completion_item.detail ~= nil and entry.completion_item.detail ~= "" then
				-- 		-- 		vim_item.menu = entry.completion_item.detail
				-- 		-- 		-- else
				-- 		-- 		-- 	vim_item.menu = ({
				-- 		-- 		-- 		nvim_lsp = "[LSP]",
				-- 		-- 		-- 		luasnip = "[Snippet]",
				-- 		-- 		-- 		buffer = "[Buffer]",
				-- 		-- 		-- 		path = "[Path]",
				-- 		-- 		-- 	})[entry.source.name]
				-- 		-- 	end
				-- 		-- 	return vim_item
				-- 		-- end,
				-- 	}),
				-- },
				snippet = {
					-- REQUIRED - you must specify a snippet engine
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
					{ name = "nvim_lsp",               keyword_length = 1 },
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


			-- Customization for Pmenu
			-- @see {@url https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance#how-to-get-types-on-the-left-and-offset-the-menu}
			-- vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#282C34", fg = "NONE" })
			-- vim.api.nvim_set_hl(0, "Pmenu", { fg = "#C5CDD9", bg = "#22252A" })

			-- vim.api.nvim_set_hl(0, "CmpItemAbbrDeprecated", { fg = "#7E8294", bg = "NONE", strikethrough = true })
			-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#82AAFF", bg = "NONE", bold = true })
			-- vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#82AAFF", bg = "NONE", bold = true })
			-- vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", bg = "NONE", italic = true })

			-- vim.api.nvim_set_hl(0, "CmpItemKindField", { fg = "#EED8DA", bg = "#B5585F" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindProperty", { fg = "#EED8DA", bg = "#B5585F" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindEvent", { fg = "#EED8DA", bg = "#B5585F" })

			-- vim.api.nvim_set_hl(0, "CmpItemKindText", { fg = "#C3E88D", bg = "#9FBD73" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindEnum", { fg = "#C3E88D", bg = "#9FBD73" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#C3E88D", bg = "#9FBD73" })

			-- vim.api.nvim_set_hl(0, "CmpItemKindConstant", { fg = "#FFE082", bg = "#D4BB6C" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindConstructor", { fg = "#FFE082", bg = "#D4BB6C" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindReference", { fg = "#FFE082", bg = "#D4BB6C" })

			-- vim.api.nvim_set_hl(0, "CmpItemKindFunction", { fg = "#EADFF0", bg = "#A377BF" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindStruct", { fg = "#EADFF0", bg = "#A377BF" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#EADFF0", bg = "#A377BF" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindModule", { fg = "#EADFF0", bg = "#A377BF" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindOperator", { fg = "#EADFF0", bg = "#A377BF" })

			-- vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#C5CDD9", bg = "#7E8294" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindFile", { fg = "#C5CDD9", bg = "#7E8294" })

			-- vim.api.nvim_set_hl(0, "CmpItemKindUnit", { fg = "#F5EBD9", bg = "#D4A959" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindSnippet", { fg = "#F5EBD9", bg = "#D4A959" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindFolder", { fg = "#F5EBD9", bg = "#D4A959" })

			-- vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#DDE5F5", bg = "#6C8ED4" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindValue", { fg = "#DDE5F5", bg = "#6C8ED4" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindEnumMember", { fg = "#DDE5F5", bg = "#6C8ED4" })

			-- vim.api.nvim_set_hl(0, "CmpItemKindInterface", { fg = "#D8EEEB", bg = "#58B5A8" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindColor", { fg = "#D8EEEB", bg = "#58B5A8" })
			-- vim.api.nvim_set_hl(0, "CmpItemKindTypeParameter", { fg = "#D8EEEB", bg = "#58B5A8" })
		end,
	},
}
