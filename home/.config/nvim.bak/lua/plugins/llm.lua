return {
	{
		"yetone/avante.nvim",
		event = "VeryLazy",
		lazy = false,
		build = ":AvanteBuild source=false",
		dependencies = {
			"stevearc/dressing.nvim",
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			--- The below dependencies are optional,
			"nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
			"zbirenbaum/copilot.lua",   -- for providers='copilot'
			'MeanderingProgrammer/render-markdown.nvim',
			"zbirenbaum/copilot.lua",
			{
				-- support for image pasting
				"HakonHarnes/img-clip.nvim",
				event = "VeryLazy",
				opts = {
					-- recommended settings
					default = {
						embed_image_as_base64 = false,
						prompt_for_file_name = false,
						drag_and_drop = {
							insert_mode = true,
						},
						-- required for Windows users
						use_absolute_path = true,
					},
				},
			},
		},
		keys = {
			{ "<leader>aa", function() require("avante.api").ask() end,     desc = "avante: ask",    mode = { "n", "v" } },
			{ "<leader>ar", function() require("avante.api").refresh() end, desc = "avante: refresh" },
			{ "<leader>ae", function() require("avante.api").edit() end,    desc = "avante: edit",   mode = "v" },
		},
		opts = {
			---@alias Provider "claude" | "openai" | "azure" | "gemini" | "cohere" | "copilot" | string
			provider = "ollama",
			vendors = {
				---@type AvanteProvider
				ollama = {
					["local"] = true,
					endpoint = "localhost:11434/v1",
					model = "codegemma:7b",
					-- model = "codellama:7b",
					parse_curl_args = function(opts, code_opts)
						return {
							url = opts.endpoint .. "/chat/completions",
							headers = {
								["Accept"] = "application/json",
								["Content-Type"] = "application/json",
							},
							body = {
								model = opts.model,
								messages = require("avante.providers").copilot.parse_message(code_opts), -- you can make your own message, but this is very advanced
								max_tokens = 2048,
								stream = true,
							},
						}
					end,
					parse_response_data = function(data_stream, event_state, opts)
						require("avante.providers").openai.parse_response(data_stream, event_state, opts)
					end,
				},
			},
		},
	},

	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/nvim-cmp",                   -- Optional: For using slash commands and variables in the chat buffer
			"nvim-telescope/telescope.nvim",      -- Optional: For using slash commands
			{ "stevearc/dressing.nvim", opts = {} }, -- Optional: Improves `vim.ui.select`
		},
		config = true
	},

	-- {
	-- 	"David-Kunz/gen.nvim",
	-- 	config = function()
	-- 		local gen = require("gen")

	-- 		gen.setup({
	-- 			-- model = "codegemma:7b", -- The default model to use.
	-- 			model = "codellama:7b",
	-- 			quit_map = "q",     -- set keymap for close the response window
	-- 			retry_map = "<c-r>", -- set keymap to re-send the current prompt
	-- 			accept_map = "<c-cr>", -- set keymap to replace the previous selection with the last result
	-- 			host = "localhost", -- The host running the Ollama service.
	-- 			port = "11434",     -- The port on which the Ollama service is listening.
	-- 			display_mode = "split", -- The display mode. Can be "float" or "split" or "horizontal-split".
	-- 			show_prompt = false, -- Shows the prompt submitted to Ollama.
	-- 			show_model = false, -- Displays which model you are using at the beginning of your chat session.
	-- 			no_auto_close = false, -- Never closes the window automatically.
	-- 			hidden = false,     -- Hide the generation window (if true, will implicitly set `prompt.replace = true`), requires Neovim >= 0.10
	-- 			init = function(options) pcall(io.popen, "ollama serve > /dev/null 2>&1 &") end,
	-- 			-- Function to initialize Ollama
	-- 			command = function(options)
	-- 				local body = { model = options.model, stream = true }
	-- 				return "curl --silent --no-buffer -X POST http://" ..
	-- 						options.host .. ":" .. options.port .. "/api/chat -d $body"
	-- 			end,
	-- 			-- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
	-- 			-- This can also be a command string.
	-- 			-- The executed command must return a JSON object with { response, context }
	-- 			-- (context property is optional).
	-- 			-- list_models = '<omitted lua function>', -- Retrieves a list of model names
	-- 			debug = false -- Prints errors and the command which is run.
	-- 		})

	-- 		local message = "あなたは日本語を話す優秀なプログラマーです。"

	-- 		gen.prompts["Chat"] = { prompt = message .. "$input" }
	-- 		gen.prompts["Summarize"] = { prompt = message .. "Summarize the following text:\n$text" }
	-- 		gen.prompts["Ask"] = { prompt = message .. "Regarding the following text, $input:\n$text" }
	-- 	end
	-- },
	{
		"zbirenbaum/copilot.lua",
		cmd = {
			"Copilot",
		},
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				filetypes = {
					-- yaml = false,
					-- markdown = false,
					-- help = false,
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
