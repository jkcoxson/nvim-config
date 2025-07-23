return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"wojciech-kulik/xcodebuild.nvim",
		"rcarriga/nvim-dap-ui",
	},
	keys = {
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "DAP Continue",
		},
		{
			"<F10>",
			function()
				require("dap").step_over()
			end,
			desc = "DAP Step Over",
		},
		{
			"<F11>",
			function()
				require("dap").step_into()
			end,
			desc = "DAP Step Into",
		},
		{
			"<F12>",
			function()
				require("dap").step_out()
			end,
			desc = "DAP Step Out",
		},
		{
			"<Leader>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "DAP Toggle Breakpoint",
		},
	},
	config = function()
		local xcodebuild = require("xcodebuild.integrations.dap")
		-- SAMPLE PATH, change it to your local codelldb path
		local codelldbPath = os.getenv("HOME") .. "/code/codelldb/extension/adapter/codelldb"

		xcodebuild.setup(codelldbPath)

		vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
		vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
		vim.keymap.set("n", "<leader>b", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>B", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
		vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
	end,
}
