-- ~/.config/nvim/lua/plugins/dap.lua
return {
	-- dap-ui
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle({})
				end,
				desc = "Dap UI",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup({
				layouts = {
					{
						elements = {
							{ id = "console", size = 0.5 },
							{ id = "repl", size = 0.5 },
						},
						position = "left",
						size = 50,
					},
					{
						elements = {
							{ id = "scopes", size = 0.50 },
							{ id = "breakpoints", size = 0.20 },
							{ id = "stacks", size = 0.15 },
							{ id = "watches", size = 0.15 },
						},
						position = "bottom",
						size = 15,
					},
				},
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open({})
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close({})
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close({})
			end
		end,
	},

	-- dap-virtual-text (separate entry!)
	{
		"theHamsta/nvim-dap-virtual-text",
		config = true,
	},
}
