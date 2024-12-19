return {
	-- debugger
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
			"leoluz/nvim-dap-go",
			"mxsdev/nvim-dap-vscode-js",
			"nvim-treesitter/nvim-treesitter",
			"jbyuki/one-small-step-for-vimkind",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			vim.fn.sign_define("DapBreakpoint", { text = "⛔", texthl = "", linehl = "", numhl = "" })
			vim.fn.sign_define("DapStopped", { text = "👉", texthl = "", linehl = "", numhl = "" })

			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "watches",     size = 0.20 },
							{ id = "stacks",      size = 0.20 },
							{ id = "breakpoints", size = 0.20 },
							{ id = "scopes",      size = 0.40 },
						},
						size = 64,
						position = "right",
					},
					{
						elements = {
							"repl",
							"console",
						},
						size = 0.20,
						position = "bottom",
					},
				},
			})

			require("dap-go").setup()

			-- require("dap-vscode-js").setup({
			-- 	debugger_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vscode-js-debug", -- Path to vscode-js-debug installation.
			-- 	adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			-- })

			dap.configurations.lua = {
				{
					type = "nlua",
					request = "attach",
					name = "Attach to running Neovim instance",
				},
			}

			dap.adapters.nlua = function(callback, config)
				callback({ type = "server", host = config.host or "127.0.0.1", port = config.port or 8086 })
			end

			dap.adapters.codelldb = {
				type = 'server',
				port = "${port}",
				executable = {
					-- CHANGE THIS to your path!
					command = vim.fn.stdpath('data') .. '/mason/packages/codelldb/extension/adapter/codelldb',
					args = { "--port", "${port}" },
					-- On windows you may have to uncomment this:
					-- detached = false,
				}
			}

			dap.adapters.node2 = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/ghq/github.com/microsoft/vscode-node-debug2/out/src/nodeDebug.js" },
			}

			dap.adapters.chrome = {
				type = "executable",
				command = "node",
				args = { os.getenv("HOME") .. "/ghq/github.com/microsoft/vscode-chrome-debug/out/src/chromeDebug.js" }, -- TODO adjust
			}

			dap.configurations.cpp = {
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
				cwd = '${workspaceFolder}',
				stopOnEntry = false,
			}

			dap.configurations.c = dap.configurations.cpp
			dap.configurations.rust = dap.configurations.cpp

			dap.configurations.javascript = {
				{
					type = "pwa-node",
					request = "launch",
					name = "Launch file",
					program = "${file}",
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Attach",
					processId = require("dap.utils").pick_process,
					cwd = "${workspaceFolder}",
				},
				{
					type = "pwa-node",
					request = "launch",
					name = "Debug Jest Tests",
					trace = true, -- include debugger info
					runtimeExecutable = "node",
					runtimeArgs = {
						"./node_modules/jest/bin/jest.js",
						"--runInBand",
					},
					rootPath = "${workspaceFolder}",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
				},
			}

			dap.configurations.javascriptreact = dap.configurations.javascript
			dap.configurations.typescript = dap.configurations.javascript
			dap.configurations.typescriptreact = dap.configurations.javascript

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			local function map(mode, lhs, rhs, opts)
				local options = { noremap = true }
				if opts then
					options = vim.tbl_extend("force", options, opts)
				end
				vim.api.nvim_set_keymap(mode, lhs, rhs, options)
			end

			map("n", "<leader>d", ":lua require'dapui'.toggle()<CR>", { silent = true })
			map("n", "<leader><leader>df", ":lua require'dapui'.eval()<CR>", { silent = true })
			map("n", "<F5>", ":lua require'dap'.continue()<CR>", { silent = true })
			map("n", "<F10>", ":lua require'dap'.step_over()<CR>", { silent = true })
			map("n", "<F11>", ":lua require'dap'.step_into()<CR>", { silent = true })
			map("n", "<F12>", ":lua require'dap'.step_out()<CR>", { silent = true })
			map("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", { silent = true })
			map(
				"n",
				"<leader>bc",
				":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
				{ silent = true }
			)
			map(
				"n",
				"<leader>l",
				":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>",
				{ silent = true }
			)
		end,
	},
}
