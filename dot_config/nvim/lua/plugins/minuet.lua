---@module "lazy"

---@type LazySpec[]
return {
  {
    "milanglacier/minuet-ai.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
      "Davidyz/VectorCode",
    },
    config = function()
      -- local has_vc, vectorcode_config = pcall(require, "vectorcode.config")
      -- local vectorcode_cacher = nil
      -- if has_vc then
      --   vectorcode_cacher = vectorcode_config.get_cacher_backend()
      -- end

      require("minuet").setup({
        provider = "openai_fim_compatible",
        n_completions = 1, -- recommend for local model for resource saving
        -- I recommend beginning with a small context window size and incrementally
        -- expanding it, depending on your local computing power. A context window
        -- of 512, serves as an good starting point to estimate your computing
        -- power. Once you have a reliable estimate of your local computing power,
        -- you should adjust the context window to a larger value.
        context_window = 512,
        throttle = 400,
        debounce = 100,
        cmp = {
          enable_auto_complete = false,
        },
        provider_options = {
          openai_fim_compatible = {
            api_key = "TERM",
            name = "Ollama",
            end_point = "http://localhost:11434/v1/completions",
            -- model = "deepseek-coder-v2:16b",
            model = "qwen2.5-coder:7b",
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },

            -- for vectorcode
            -- template = {
            --   prompt = function(pref, suff)
            --     local prompt_message = ""
            --     if has_vc then
            --       for _, file in ipairs(vectorcode_cacher.query_from_cache(0)) do
            --         prompt_message = prompt_message .. "<|file_sep|>" .. file.path .. "\n" .. file.document
            --       end
            --     end
            --     return prompt_message .. "<|fim_prefix|>" .. pref .. "<|fim_suffix|>" .. suff .. "<|fim_middle|>"
            --   end,
            --   suffix = false,
            -- },
          },
        },
      })
    end,
  },
}
