vim.pack.add({
  "https://github.com/huggingface/llm.nvim"
})

-- llm.nvim (language_server.lua:117) still calls `vim.lsp.util.make_position_params()`
-- with no arguments. Nvim 0.13 requires the position encoding and errors out on nil,
-- so supply the encoding of the client attached to that window's buffer.
if not vim.g.llm_position_params_patched then
  vim.g.llm_position_params_patched = true

  local make_position_params = vim.lsp.util.make_position_params

  ---@diagnostic disable-next-line: duplicate-set-field
  vim.lsp.util.make_position_params = function (win, position_encoding, ...)
    if position_encoding == nil then
      local winid = (win == nil or win == 0) and vim.api.nvim_get_current_win() or win
      local client = vim.lsp.get_clients({ bufnr = vim.api.nvim_win_get_buf(winid) })[1]

      position_encoding = client and client.offset_encoding or 'utf-16'
    end

    return make_position_params(win, position_encoding, ...)
  end
end

require('llm').setup({
  lsp = {
    bin_path = vim.api.nvim_call_function("stdpath", { "data" }) .. "/mason/bin/llm-ls"
  },
  backend = "ollama",
  model = "qwen2.5-coder:7b",
  -- model = "gpt-oss:20b",
  url = "http://localhost:11434", -- llm-ls uses "/api/generate"
  -- cf https://github.com/ollama/ollama/blob/main/docs/api.md#parameters
  request_body = {
    -- Modelfile options for the model you use
    options = {
      temperature = 0.2,
      top_p = 0.95
    }
  }
})
