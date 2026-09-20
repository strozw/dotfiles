local lspconfig_util = require("lspconfig.util")

local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require('lsp-file-operations').default_capabilities()
)

capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

-- disable diagnostic virtual text for tiny-inline-diagnostic
vim.diagnostic.config({ virtual_text = false })

-- enable inline completion
vim.lsp.inline_completion.enable();

local completion_trigger_group = vim.api.nvim_create_augroup('lsp-completion-trigger', { clear = true })

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

    if client == nil then
      return
    end

    vim.lsp.inlay_hint.enable(false)

    vim.lsp.document_color.enable(true)

    -- enable lsp completion
    if client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
      if client.name ~= "tsc" then
        local triggersChars = {}

        for i = 32, 126 do table.insert(triggersChars, string.char(i)) end
        client.server_capabilities.completionProvider.triggerCharacters = triggersChars
      else
        -- tsc validates `context.triggerCharacter` and panics on anything it did not
        -- advertise, so the list above cannot be widened for it. Request completion on
        -- the same character set from here instead: `get()` sends an `Invoked` request,
        -- which carries no character.
        vim.api.nvim_clear_autocmds({ group = completion_trigger_group, buffer = event.buf })
        vim.api.nvim_create_autocmd('InsertCharPre', {
          group = completion_trigger_group,
          buffer = event.buf,
          desc = 'Trigger LSP completion on any printable character',
          callback = function()
            local byte = vim.v.char:byte()

            if not byte or byte < 32 or byte > 126 then
              return
            end

            -- InsertCharPre fires before the character lands in the buffer.
            vim.schedule(function()
              vim.lsp.completion.get()
            end)
          end,
        })
      end

      vim.lsp.completion.enable(
        true,
        client.id,
        event.buf,
        {
          autotrigger = true,
        }
      )
    end

    -- auto highlight
    if client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

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
        group = vim.api.nvim_create_augroup("lsp-detach", { clear = false }),
        callback = function(detach_event)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds({
            group = highlight_augroup,
            buffer = detach_event.buf
          })
        end,
      })
    end

    if client.name == "kakehashi" then
      require("kakehashi").inherit_nvim_lsp_config(
        client,
        vim.tbl_keys(vim.lsp._enabled_configs),
        "keep"
      )
    end

    -- if client then
    -- if client.name == "kakehashi" then
    --   require("kakehashi").inherit_nvim_lsp_config(
    --     client,
    --     servers,
    --     "keep"
    --   )
    -- end
    -- end
  end
})

-- vim.api.nvim_create_autocmd("LspProgress", {
--   ---@param ev {data: {client_id: integer, params: lsp.ProgressParams}}
--   callback = function(ev)
--     local spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
--     vim.notify(vim.lsp.status(), vim.log.levels.INFO, {
--       id = "lsp_progress",
--       title = "LSP Progress",
--       opts = function(notif)
--         notif.icon = ev.data.params.value.kind == "end" and " "
--             or spinner[math.floor(vim.uv.hrtime() / (1e6 * 80)) % #spinner + 1]
--       end,
--     })
--   end,
-- })

-- lua_ls
vim.lsp.config('lua_ls', {
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '${3rd}/luv/library',
        },
      },
      telemetry = { enable = false },
    },
  },
})
vim.lsp.enable('lua_ls')

-- TypeScript: ts_ls wraps the project's own tsserver, which TypeScript 7 no longer
-- ships. Pick one server per project by whether node_modules/.bin/tsserver exists.
local function has_local_tsserver(root)
  return vim.fn.executable(vim.fs.joinpath(root, 'node_modules/.bin/tsserver')) == 1
end

-- Wraps the upstream root_dir (keeping its deno / monorepo handling) so the server
-- only attaches when the local tsserver's presence matches `want`.
local function require_local_tsserver(root_dir, want)
  return function(bufnr, on_dir)
    root_dir(bufnr, function(root)
      if has_local_tsserver(root) == want then
        on_dir(root)
      end
    end)
  end
end

-- Capture before overriding, otherwise the wrappers below recurse into themselves.
local ts_ls_root_dir = vim.lsp.config.ts_ls.root_dir
local tsc_root_dir = vim.lsp.config.tsc.root_dir

-- ts_ls (TypeScript 6 and older)
-- vim.lsp.config('ts_ls', {
--   capabilities = capabilities,
--   workspace_required = true,
--   root_dir = require_local_tsserver(ts_ls_root_dir, true),
--   on_attach = function(client, buffer_number)
--     client.server_capabilities.documentFormattingProvider = false
--     client.server_capabilities.documentRangeFormattingProvider = false
--
--     require("twoslash-queries").attach(client, buffer_number)
--   end,
--   init_options = {
--     maxTsServerMemory = 4096,
--     plugins = {},
--   },
--   settings = {
--     javascript = {
--       format = false,
--     },
--     typescript = {
--       format = false,
--     },
--   }
-- })
-- vim.lsp.enable('ts_ls')

-- tsc (native TypeScript 7+; its own root_dir already requires a `--lsp` capable binary)
vim.lsp.config('tsc', {
  capabilities = capabilities,
  workspace_required = true,
  -- root_dir = require_local_tsserver(tsc_root_dir, false),
  on_attach = function(client, buffer_number)
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false

    require("twoslash-queries").attach(client, buffer_number)
  end,
  settings = {
    javascript = {
      format = false,
    },
    typescript = {
      format = false,
    },
  }
})
vim.lsp.enable('tsc')

vim.lsp.config('oxlint', {
  flags = {
    allow_incremental_sync = true,
    debounce_text_changes = 1000,
  },
  settings = {
    typeAware = false,
  },
})
vim.lsp.enable('oxlint', true)

vim.lsp.enable('oxfmt', true)

vim.lsp.config("eslint", {
  flags = {
    allow_incremental_sync = false,
    debounce_text_changes = 1000
  }
})
vim.lsp.enable('eslint', false)

vim.lsp.config('stylelint_lsp', {})
vim.lsp.enable('stylelint_lsp', false)

vim.lsp.config('biome', {})
vim.lsp.enable('biome', false)

vim.lsp.config('dprint', {
  workspace_required = true,
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
vim.lsp.enable('dprint', false)

vim.lsp.config("emmet_language_server", {
  filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "pug", "typescriptreact" },
  init_options = {
    includeLanguages = {},
    excludeLanguages = {},
    extensionsPath = {},
    preferences = {},
    showAbbreviationSuggestions = true,
    showExpandedAbbreviation = "always",
    showSuggestionsAsSnippets = false,
    syntaxProfiles = {},
    variables = {},
  },
})
vim.lsp.enable("emmet_language_server")

vim.lsp.config("tailwindcss", {
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
        },
      },
    },
  },
})
vim.lsp.enable("tailwindcss")

vim.lsp.config("yamlls", {
  settings = {
    yaml = {
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require("schemastore").yaml.schemas(),
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = false },
    },
  },
  filetypes = { "json", "jsonc", "json5" },
})
vim.lsp.enable("jsonls")

vim.lsp.enable("cssls", true)
vim.lsp.enable("css_variables", true)

vim.lsp.config("html", {
  init_options = {
    provideFormatter = false,
  },
})
vim.lsp.enable("html", true)

vim.lsp.config("phpactor", {
  workspace_required = true,

  filetypes = {
    "php",
    "phtml",
    "blade",
  },

  init_options = {}
})
vim.lsp.enable("phpactor", true)

vim.lsp.config("phpantom_lsp", {
  workspace_required = true,

  filetypes = {
    "php",
    "phtml",
    "blade",
  },

  init_options = {}
})
vim.lsp.enable("phpantom_lsp", false)

vim.lsp.config("gopls", {})
vim.lsp.enable("gopls", false)

vim.lsp.config("cspell_ls", {
  workspace_required = true,
})
vim.lsp.enable("cspell_ls", false)

vim.lsp.config("typos_lsp", {
  workspace_required = true,
})
vim.lsp.enable("typos_lsp", false)

vim.lsp.config("astro", {})
vim.lsp.enable("astro", false)

-- copilot
vim.lsp.config('copilot', {
  settings = {
    telemetry = {
      telemetryLevel = "off",
    },
  }
})
vim.lsp.enable('copilot')

vim.lsp.config('actionsls', { root_markers = { '.github' } })
vim.lsp.enable('actionsls')
