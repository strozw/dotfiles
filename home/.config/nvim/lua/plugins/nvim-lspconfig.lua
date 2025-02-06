return {
  {
    "neovim/nvim-lspconfig",
    priority = 1,
    opts = function(_, opts)
      local lspconfig_util = require("lspconfig.util")

      opts.servers = vim.tbl_deep_extend("force", opts.servers, {
        vtsls = {
          settings = {
            vtsls = {
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = true,
                  entriesLimit = 50,
                },
              },
            },
            typescript = {
              tsserver = {
                maxTsServerMemory = 20480,
                enableProjectDiagnostics = true,
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
              },
              workspaceSymbols = {
                excludeLibrarySymbols = true,
                -- scope = "currentProject"
              },
            },
          },
        },
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
      })
    end,
  },
}
