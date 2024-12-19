return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
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
      },
      setup = {
        dprint = function()
          local lspconfig_util = require("lspconfig.util")
          local lspconfig = require("lspconfig")

          lspconfig.dprint.setup({
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
          })
        end,
        ["biome"] = function()
          local lspconfig_util = require("lspconfig.util")
          local lspconfig = require("lspconfig")

          lspconfig.biome.setup({
            root_dir = lspconfig_util.root_pattern("biome.json", "biome.jsonc"),
          })
        end,
      },
    },
  },
}
