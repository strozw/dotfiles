vim.pack.add({
  "https://github.com/milanglacier/minuet-ai.nvim"
})

require("minuet").setup({
  cmp = {
    enable_auto_complete = false,
  },
  blink = {
    enable_auto_complete = false,
  },
  lsp = {
    -- the LSP server is only started for these filetypes; without this the
    -- FileType autocmd is never created and minuet never attaches
    enabled_ft = { '*' },
    completion = {
      enable = false,
    },
    inline_completion = {
      enable = false,
      -- filetypes that request a suggestion automatically while typing
      enabled_auto_trigger_ft = { '*' },
    }
  },
  provider = 'openai_fim_compatible',
  n_completions = 1, -- recommend for local model for resource saving
  -- I recommend beginning with a small context window size and incrementally
  -- expanding it, depending on your local computing power. A context window
  -- of 512, serves as an good starting point to estimate your computing
  -- power. Once you have a reliable estimate of your local computing power,
  -- you should adjust the context window to a larger value.
  context_window = 512,
  provider_options = {
    openai_fim_compatible = {
      -- For Windows users, TERM may not be present in environment variables.
      -- Consider using APPDATA instead.
      api_key = 'TERM',
      name = 'Ollama',
      end_point = 'http://localhost:11434/v1/completions',
      model = 'qwen2.5-coder:7b',
      optional = {
        max_tokens = 56,
        top_p = 0.9,
      },
    },
  },
})
