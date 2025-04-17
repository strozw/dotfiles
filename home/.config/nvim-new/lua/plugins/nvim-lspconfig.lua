---@module "lspconfig"

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      {
        "williamboman/mason.nvim",
        opts = {
          "file:~/ghq/github.com/strozw/my-mason-registry",
          "github:mason-org/mason-registry",
        },
      },
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",

      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },

      -- Allows extra capabilities provided by nvim-cmp
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
      "yioneko/nvim-vtsls",
    },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map("<leader>cr", vim.lsp.buf.rename, "[C]ode [R]ename")

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })

          map("<leader>ch", vim.lsp.buf.code_action, "[C]ode signature [H]elp", { "n", "x" })

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            map("<leader>th", function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
            end, "[T]oggle Inlay [H]ints")
          end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config({
        severity_sort = true,
        -- float = { border = "rounded", source = "if_many" },
        -- underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚 ",
            [vim.diagnostic.severity.WARN] = "󰀪 ",
            [vim.diagnostic.severity.INFO] = "󰋽 ",
            [vim.diagnostic.severity.HINT] = "󰌶 ",
          },
        } or {},

        virtual_lines = {
          current_line = true,
        },

        -- virtual_text = {
        --   current_line = true,
        --   source = "if_many",
        --   spacing = 2,
        -- },
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

      local lspconfig_util = require("lspconfig.util")

      ---@type table<string, lspconfig.Config>
      --- @diagnostic disable: missing-fields
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },

        vtsls = {
          settings = {
            vtsls = {
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                  entriesLimit = 50,
                },
              },
              tsserver = {
                globalPlugins = {
                  -- {
                  --   name = "@css-modules-kit/ts-plugin",
                  --   location = vim.fn.stdpath("data") .. "/mason/packages/typescript-plugin_css-modules-kit",
                  --   languages = { "css" },
                  -- },
                },
              },
            },
            typescript = {
              tsserver = {
                maxTsServerMemory = 20480,
                enableProjectDiagnostics = true,
                pluginPaths = { "./node_modules" },
              },
              inlayHints = {
                enumMemberValues = { enabled = false },
                functionLikeReturnTypes = { enabled = false },
                parameterNames = { enabled = false },
                parameterTypes = { enabled = false },
                propertyDeclarationTypes = { enabled = false },
                variableTypes = { enabled = false },
              },
              preferences = {
                includePackageJsonAutoImports = "off",
                importModuleSpecifierEnding = "off",
              },
              workspaceSymbols = {
                excludeLibrarySymbols = true,
                -- scope = "currentProject"
              },
            },
            javascript = {
              preferences = {
                includePackageJsonAutoImports = "off",
                importModuleSpecifierEnding = "minimal",
              },
            },
          },
        },

        stylelint_lsp = {},

        biome = {
          root_dir = lspconfig_util.root_pattern("biome.json", "biome.jsonc"),
        },

        dprint = {
          root_dir = lspconfig_util.root_pattern("dprint.json"),
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "json",
            "jsonc",
            "markdown",
            "python",
            "toml",
            "rust",
            "roslyn",
            "css",
            "scss",
            "less",
            "sass",
          },
        },

        tailwindcss = {
          mason = false,
          filetypes = {
            "html",
            "css",
            "scss",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "svelte",
            "vue",
            "blade",
            "phtml",
          },

          settings = {
            tailwindCSS = {
              experimental = {
                classRegex = {
                  {
                    "tv\\(([^)]*)\\)",
                    "{?\\s?[\\w].*:\\s*?[\"'`]([^\"'`]*).*?,?\\s?}?",
                  },
                  -- @see {@link https://github.com/heroui-inc/tailwind-variants/issues/127#issuecomment-2317166696}
                  -- {
                  --   "tv\\(\\{([^]+?)\\}\\)",
                  --   "(?:\"([^\"]*?)\")|(?:'([^']*?)')|(?:`[^`]*?`)",
                  -- },

                  -- {
                  --   "([\"'`][^\"'`]*.*?[\"'`])",
                  --   "[\"'`]([^\"'`]*).*?[\"'`]",
                  -- },

                  -- -- @see {https://github.com/heroui-inc/tailwind-variants/issues/229#issuecomment-2573665682}
                  -- {
                  --   "tv\\(\\{([\\s\\S]*?)\\}\\)",
                  --   "(['\"`])(.*?)\\1",
                  -- },
                },
              },
            },
          },
        },

        yamlls = {
          settings = {
            yaml = {
              schemaStore = {
                -- You must disable built-in schemaStore support if you want to use
                -- this plugin and its advanced options like `ignore`.
                enable = false,
                -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
                url = "",
              },
              schemas = require("schemastore").yaml.schemas(),
            },
          },
        },

        jsonls = {
          settings = {
            json = {
              schemas = require("schemastore").json.schemas(),
              validate = { enable = true },
            },
          },
          filetypes = { "json", "jsonc", "json5" },
        },

        -- cssmodules_ls = {},

        -- cssls = {},

        -- css_variables = {},

        html = {
          init_options = {
            provideFormatter = false,
          },
        },

        phpactor = {
          filetypes = {
            "php",
            "phtml",
            "blade",
          },
        },

        intelephense = {
          filetypes = {
            "php",
            "phtml",
            "blade",
          },
        },

        gopls = {},

        rust_analyzer = {},

        typos_lsp = {},

        gh_actions_ls = {
          filetypes = { "yaml.github" },
          init_options = {
            sessionToken = (function()
              local Job = require("plenary.job")
              local result, err = Job:new({
                command = "gh",
                args = { "auth", "token" },
              }):sync()

              if err ~= 0 then
                vim.notify("Failed to get GitHub token: " .. err, vim.log.levels.ERROR)
                return nil
              end

              return result[1]
            end)(),
          },
        },
      }

      -- vim.lsp.config でセットアップ
      for server_name, server in pairs(servers) do
        server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
        vim.lsp.config(server_name, server)
        vim.lsp.enable(server_name)
      end

      local ensure_installed = vim.tbl_keys(servers or {})
      ensure_installed = vim.tbl_filter(function(value)
        return value ~= "gh_actions_ls"
      end, ensure_installed)

      vim.list_extend(ensure_installed, { "stylua" })

      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    end,
  },
}
