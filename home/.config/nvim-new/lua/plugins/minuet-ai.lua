---@module "lazy"

return {
  {
    "milanglacier/minuet-ai.nvim",
    enabled = false,
    config = function()
      -- This uses the async cache to accelerate the prompt construction.
      -- There's also the require('vectorcode').query API, which provides
      -- more up-to-date information, but at the cost of blocking the main UI.
      local vectorcode_cacher = require("vectorcode.config").get_cacher_backend()
      require("minuet").setup({
        add_single_line_entry = true,
        n_completions = 1,
        -- I recommend you start with a small context window firstly, and gradually
        -- increase it based on your local computing power.
        context_window = 4096,
        after_cursor_filter_length = 30,
        notify = "debug",
        provider = "openai_fim_compatible",
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM",
            name = "Ollama",
            stream = true,
            end_point = "http://127.0.0.1:11434/v1/completions",
            model = "qwen2.5-coder:7b-base-q4_1",
            template = {
              prompt = function(pref, suff)
                local prompt_message = ""
                for _, file in ipairs(vectorcode_cacher.query_from_cache(0)) do
                  prompt_message = prompt_message .. "<|file_sep|>" .. file.path .. "\n" .. file.document
                end
                return prompt_message .. "<|fim_prefix|>" .. pref .. "<|fim_suffix|>" .. suff .. "<|fim_middle|>"
              end,
              suffix = false,
            },
          },
        },
      })
    end,
  },
}
