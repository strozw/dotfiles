return {
	{
		"David-Kunz/gen.nvim",
		config = function()
			local gen = require("gen")

			gen.setup({
				model = "codegemma:7b", -- The default model to use.
				quit_map = "q",     -- set keymap for close the response window
				retry_map = "<c-r>", -- set keymap to re-send the current prompt
				accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
				host = "localhost", -- The host running the Ollama service.
				port = "11434",     -- The port on which the Ollama service is listening.
				display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
				show_prompt = false, -- Shows the prompt submitted to Ollama.
				show_model = false, -- Displays which model you are using at the beginning of your chat session.
				no_auto_close = false, -- Never closes the window automatically.
				hidden = false,     -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
				init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
				-- Function to initialize Ollama
				command = function(options)
					local body = { model = options.model, stream = true }
					return "curl --silent --no-buffer -X POST http://" ..
							options.host .. ":" .. options.port .. "/api/chat -d $body"
				end,
				-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
				-- This can also be a command string.
				-- The executed command must return a JSON object with { response, context }
				-- (context property is optional).
				-- list_models = '<omitted lua function>', -- Retrieves a list of model names
				debug = false -- Prints errors and the command which is run.
			})

			local message = "あなたは日本語を話す優秀なプログラマーです。"

			gen.prompts["Chat"] = { prompt = message .. "$input" }
			gen.prompts["Summarize"] = { prompt = message .. "Summarize the following text:\n$text" }
			gen.prompts["Ask"] = { prompt = message .. "Regarding the following text, $input:\n$text" }
		end
	},
	{
		"zbirenbaum/copilot.lua",
		cmd = {
			"Copilot",
		},
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				filetypes = {
					yaml = false,
					markdown = false,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
					["*"] = function()
						if string.match(vim.api.nvim_buf_get_name(0), 'github.com/strozw') then
							return true
						end

						return false
					end
				},
				server_opts_overrides = {
				},
			})
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		branch = "canary",
		dependencies = {
			{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
			{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
		},
		opts = {
			debug = false, -- Enable debugging
			-- language = "English"
			language = "Japanese"
			-- See Configuration section for rest
		},
		-- See Commands section for default commands if you want to lazy load on them
	},

}
