return {
  {
    "neovim/nvim-lspconfig",
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
    -- opts = {
    --   servers = {
    --     vtsls = {
    --       settings = {
    --         vtsls = {
    --           experimental = {
    --             completion = {
    --               enableServerSideFuzzyMatch = true,
    --               entriesLimit = 50,
    --             },
    --           },
    --         },
    --         typescript = {
    --           tsserver = {
    --             maxTsServerMemory = 20480,
    --             enableProjectDiagnostics = true,
    --           },
    --           inlayHints = {
    --             enumMemberValues = { enabled = false },
    --             functionLikeReturnTypes = { enabled = false },
    --             parameterNames = { enabled = false },
    --             parameterTypes = { enabled = false },
    --             propertyDeclarationTypes = { enabled = false },
    --             variableTypes = { enabled = false },
    --           },
    --           preferences = {
    --             includePackageJsonAutoImports = "off",
    --           },
    --           workspaceSymbols = {
    --             excludeLibrarySymbols = true,
    --             -- scope = "currentProject"
    --           },
    --         },
    --       },
    --     },
    --     tailwindcss = {
    --       filetypes = {
    --         "html",
    --         "css",
    --         "scss",
    --         "javascript",
    --         "javascriptreact",
    --         "typescript",
    --         "typescriptreact",
    --         "svelte",
    --         "vue",
    --         "blade",
    --         "phtml",
    --       },
    --     },
    --     html = {
    --       init_options = {
    --         provideFormatter = false,
    --       },
    --     },
    --     phpactor = {
    --       filetypes = {
    --         "php",
    --         "phtml",
    --       },
    --     },
    --   },
    --   setup = {
    --     dprint = function()
    --       local lspconfig_util = require("lspconfig.util")
    --       local lspconfig = require("lspconfig")
    --
    --       lspconfig.dprint.setup({
    --         root_dir = lspconfig_util.root_pattern("dprint.json"),
    --         filetypes = {
    --           "javascript",
    --           "javascriptreact",
    --           "typescript",
    --           "typescriptreact",
    --           "json",
    --           "jsonc",
    --           "markdown",
    --           "python",
    --           "toml",
    --           "rust",
    --           "roslyn",
    --           "css",
    --           "scss",
    --           "less",
    --           "sass",
    --         },
    --       })
    --     end,
    --
    --     biome = function()
    --       local lspconfig_util = require("lspconfig.util")
    --       local lspconfig = require("lspconfig")
    --
    --       lspconfig.biome.setup({
    --         root_dir = lspconfig_util.root_pattern("biome.json", "biome.jsonc"),
    --       })
    --     end,
    --   },
    -- },
  },
}
