return {
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
