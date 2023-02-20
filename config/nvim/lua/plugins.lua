
local lsp_type = 'coc'
-- local lsp_type = 'nvim'
local ENABLE_COC = lsp_type == 'coc'
local ENABLE_NVIM_LSP = lsp_type == 'nvim'

-- nvim-lsp enhance opts
vim.g.enhance_lsp_opts = {}


local fn = vim.fn

-- setup script for when not installed
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path
    })
end

-- for lazy loading
vim.cmd [[packadd packer.nvim]]

-- plugins
require'packer'.startup(function()
    -- boiler use {'tpope/vim-sensible'}
    -- editorconfig
    use {'editorconfig/editorconfig-vim'}

    -- color
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require'nvim-treesitter.configs'.setup {highlight = {enable = true}}
        end
    }
    use {
        'ghifarit53/tokyonight-vim',
        config = function()
            vim.cmd 'colorscheme tokyonight'
            vim.api.nvim_exec([[
							let g:tokyonight_style = 'night'
							let g:tokyonight_enable_italic = 1
							let g:tokyonight_disable_italic_comment = 1
						]], false)
        end
		}
		-- use {
		-- 	'marko-cerovac/material.nvim',
    --     config = function()
    --         -- vim.cmd 'colorscheme material'
    --         vim.g.material_style = "deep ocean"
    --         require('material').setup({
    --             contrast = true,
    --             borders = true,
    --             popup_menu = "dark",
    --             italics = {
    --                 comments = true, -- Enable italic comments
    --                 keywords = false, -- Enable italic keywords
    --                 functions = false, -- Enable italic functions
    --                 strings = false, -- Enable italic strings
    --                 variables = false -- Enable italic variables
    --             }
    --         })
    --     end
    -- }

    -- tmux
    use {'christoomey/vim-tmux-navigator'}

    -- lua
    use {'folke/lua-dev.nvim'}
    use {'andrejlevkovitch/vim-lua-format'}

    -- symbol view
    use {'liuchengxu/vista.vim', config = function() end}

		use { 'vim-denops/denops.vim' }


		if ENABLE_NVIM_LSP then
			use {'Shougo/ddc-nvim-lsp'}
			use {
				'Shougo/ddc.nvim',
				config = function()
				end
			}
			use { 'neovim/nvim-lspconfig' }
			use { 'jose-elias-alvarez/nvim-lsp-ts-utils' }
			use {
				'nvim-lua/lsp-status.nvim',
				config = function()
					local lsp_status = require('lsp-status')
					lsp_status.register_progress()
				end
			}
			use {
				'williamboman/nvim-lsp-installer',
        requires = {
					'nvim-lua/lsp-status.nvim'
				},
				config = function()
					-- stop active lsp clients
					vim.lsp.stop_client(vim.lsp.get_active_clients())

					-- disable diagnostics virtual_text
					vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
						vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
					)

					local opts = { noremap=true, silent=true }
					vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
					vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
					vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
					vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

					local lsp_status = require('lsp-status')
					local function on_attach(client, bufnr)
						-- attach lsp-status
						lsp_status.on_attach(client)

						-- Enable completion triggered by <c-x><c-o>
						vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

						-- Mappings.
						-- See `:help vim.lsp.*` for documentation on any of the below functions
						vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
						vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)

						-- enable format on save
						if client.resolved_capabilities.document_formatting then
            	vim.cmd([[
								augroup LspFormatting
									autocmd! * <buffer>
									autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
								augroup END
							]])
						end
					end

					local lsp_installer = require 'nvim-lsp-installer'

					lsp_installer.on_server_ready(function(server)
						local lsp_opts = {
							on_attach = on_attach
						}

						if server.name == 'sumneko_lua' then
							local lua_dev = require('lua-dev').setup({
							})
							for k,v in pairs(lua_dev) do lsp_opts[k] = v end
						end

						if server.name == 'tsserver' then
							lsp_opts.on_attach = function(client, bufnr)
								on_attach(client, bufnr)

								local ts_utils = require('nvim-lsp-ts-utils')

								ts_utils.setup({
									enable_import_on_completion = true,
									-- update imports on file move
									update_imports_on_move = true,
									require_confirmation_on_move = true,
								})

								-- required to fix code action ranges and filter diagnostics
								ts_utils.setup_client(client)

								-- no default maps, so you may want to define some here
								local opts = { silent = true }
								vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
								vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
								vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
							end
						end

						--if vim.g.enhance_lsp_opts[server.name] then
						 	--vim.g.enhance_lsp_opts[server.name](opts)
						--end

						server:setup(lsp_opts)
					end)
				end
			}
		end


		if ENABLE_COC then
			-- LSP / coc
			use {
					'neoclide/coc.nvim',
					branch = 'release',
					config = function()
							vim.api.nvim_exec([[
						" Always show the signcolumn, otherwise it would shift the text each time
						" diagnostics appear/become resolved.
						if has("nvim-0.5.0") || has("patch-8.1.1564")
							" Recently vim can merge signcolumn and number column into one
							set signcolumn=number
						else
							set signcolumn=yes
						endif

						" Use <c-space> to trigger completion.
						if has('nvim')
							inoremap <silent><expr> <c-space> coc#refresh()
						else
							inoremap <silent><expr> <c-@> coc#refresh()
						endif


						" Make <CR> auto-select the first completion item and notify coc.nvim to
						" format on enter, <cr> could be remapped by other vim plugin
						inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

						nmap <silent> [d <Plug>(coc-diagnostic-prev)
						nmap <silent> ]d <Plug>(coc-diagnostic-next)

						" GoTo code navigation.
						"nmap <silent> gd <Plug>(coc-definition)
						nmap <silent> gd :Telescope coc definitions theme=ivy<CR>
						"nmap <silent> gy <Plug>(coc-type-definition)
						nmap <silent> gy :Telescope coc type_definitions theme=ivy<CR>
						"nmap <silent> gi <Plug>(coc-implementation)
						nmap <silent> gi :Telescope coc implementations theme=ivy<CR>
						"nmap <silent> gr <Plug>(coc-references)
						nmap <silent> gr :Telescope coc references theme=ivy<CR>

						" Symbol renaming.
						nmap cr <Plug>(coc-rename)

						" Applying codeAction to the selected region.
						xmap ca  <Plug>(coc-codeaction-selected)
						nmap ca  <Plug>(coc-codeaction-selected)

						" Remap keys for applying codeAction to the current buffer.
						nmap ca  <Plug>(coc-codeaction)

						" Use K to show documentation in preview window.
						function! s:show_documentation()
							if (index(['vim','help'], &filetype) >= 0)
								execute 'h '.expand('<cword>')
							elseif (coc#rpc#ready())
								call CocActionAsync('doHover')
							else
								execute '!' . &keywordprg . " " . expand('<cword>')
							endif
						endfunction

						" Use K to show documentation in preview window.
						nnoremap <silent> K :call <SID>show_documentation()<CR>


						""""""""""""""""""""""""""""""""""""
						" snippets
						""""""""""""""""""""""""""""""""""""
						" Use <C-l> for trigger snippet expand.
						imap <C-l> <Plug>(coc-snippets-expand)

						" Use <C-j> for select text for visual placeholder of snippet.
						vmap <C-j> <Plug>(coc-snippets-select)

						" Use <C-j> for jump to next placeholder, it's default of coc.nvim
						let g:coc_snippet_next = '<c-j>'

						" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
						let g:coc_snippet_prev = '<c-k>'

						" Use <C-j> for both expand and jump (make expand higher priority.)
						imap <C-j> <Plug>(coc-snippets-expand-jump)

						" Use <leader>x for convert visual selected code to snippet
						xmap <leader>x  <Plug>(coc-convert-snippet)
					]], false)
					end
			}
			use {'rafcamlet/coc-nvim-lua'}
		end

    -- LSP / color
    use { 'folke/lsp-colors.nvim'}

    -- tab ui
    use {
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            vim.api.nvim_set_keymap('n', '<C-n>', ':BufferNext<CR>',
                                    {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', '<C-p>', ':BufferPrev<CR>',
                                    {noremap = true, silent = true})

            vim.api.nvim_exec([[
          nnoremap <silent> <space>x :BufferClose<CR>
        ]], false)

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

    -- status line
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
                        theme = 'auto',
                        -- theme = 'material-nvim',
                        component_separators = {left = ' ', right = ' '},
                        section_separators = {left = ' ', right = ' '},
                        always_divide_middle = true
                    },
                    sections = {
                        lualine_a = {'mode'},
                        lualine_b = {
                            'branch', 'diff', {'diagnostics', sources = {'coc'}}
                        },
                        lualine_c = {'g:coc_status', "require'lsp-status'.status()", 'filename'},
                        lualine_x = {'encoding', 'fileformat', 'filetype'},
                        lualine_y = {'progress'},
                        lualine_z = {'location'}
                    },
                    inactive_sections = {
                        lualine_a = {},
                        lualine_b = {},
                        lualine_c = {'filename'},
                        lualine_x = {'location'},
                        lualine_y = {},
                        lualine_z = {}
                    },
                    tabline = {},
                    extensions = {'fern'}
                }
            end
        end
    }

    -- filer
    use {
        'lambdalisue/fern.vim',
        config = function()
            vim.api.nvim_set_keymap('n', '<F2>',
                                    ':Fern . -drawer -width=50 -toggle<CR>',
                                    {noremap = true, silent = true})
            vim.api.nvim_set_keymap('n', 'ss',
                                    ':Fern . -drawer -width=50 -reveal=%<CR><CR>',
                                    {noremap = true, silent = true})
        end
    }
    use {
        'lambdalisue/fern-renderer-nerdfont.vim',
        requires = {'lambdalisue/nerdfont.vim'}
    }
    use {'lambdalisue/fern-git-status.vim'}
    use {'lambdalisue/fern-hijack.vim'}
    use {'lambdalisue/glyph-palette.vim'}

    -- git
    use {'iberianpig/tig-explorer.vim'}
    use {'tpope/vim-fugitive'}
    use {'tpope/vim-rhubarb'}
    use {
        'lambdalisue/gina.vim',
        config = function()
            vim.api.nvim_exec([[
          let g:gina#command#blame#formatter#format="%au:%su%=on %ti %ma%in"
          nmap <silent> gb :Gina blame<CR>
        ]], false)
        end
    }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {'nvim-lua/plenary.nvim'},
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
                watch_gitdir = {interval = 1000, follow_files = true},
                attach_to_untracked = true,
                current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 1000,
                    ignore_whitespace = false
                },
                current_line_blame_formatter_opts = {relative_time = false},
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
                yadm = {enable = false}
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

    -- debugger
    use {'mfussenegger/nvim-dap'}
    use {'Pocco81/DAPInstall.nvim', requires = {'mfussenegger/nvim-dap'}}

    -- test
    use {
        "rcarriga/vim-ultest",
        requires = {"vim-test/vim-test"},
        run = ":UpdateRemotePlugins"
    }

    -- fuzzy finder
    use {'nvim-lua/plenary.nvim'}
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            local telescope = require('telescope')

            if telescope then
                telescope.setup {
                    defaults = {
                        theme = "cursor",
                        sorting_strategy = "ascending",
                        layout_config = {prompt_position = "top"},
                        mappings = {
                            i = {
                                ['<F2>'] = require('telescope.actions.layout').toggle_preview
                            }
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
                        }
                    }
                }
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
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        requires = {'nvim-telescope/telescope.nvim'},
        run = 'make',
        config = function() require('telescope').load_extension('fzf') end
    }
    use {
        'nvim-telescope/telescope-dap.nvim',
        requires = {'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap'},
        config = function() require('telescope').load_extension('dap') end
    }
    use {
        'fannheyward/telescope-coc.nvim',
        requires = {'nvim-telescope/telescope.nvim'},
        config = function() require('telescope').load_extension('coc') end
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
    use {'dyng/ctrlsf.vim'}
		use {'thinca/vim-qfreplace'}

    -- comentout
    use {'tomtom/tcomment_vim'}

    -- text operator
    use {'tpope/vim-surround'}
    use {'machakann/vim-sandwich'}

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

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then require('packer').sync() end
end)

-- `:PackerCompile` automatically in write `plugin.lua`
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
