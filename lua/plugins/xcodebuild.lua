return {
	"wojciech-kulik/xcodebuild.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim", -- optional
		"nvim-tree/nvim-tree.lua", -- optional
		"stevearc/oil.nvim", -- optional
		"nvim-treesitter/nvim-treesitter", -- optional
	},
	config = function()
		require("xcodebuild").setup({})

		-- Keybindings
		vim.keymap.set("n", "<leader>X", "<cmd>XcodebuildPicker<cr>", { desc = "[XC] Show Xcodebuild Actions" })
		vim.keymap.set(
			"n",
			"<leader>xf",
			"<cmd>XcodebuildProjectManager<cr>",
			{ desc = "[XC] Show Project Manager Actions" }
		)

		vim.keymap.set("n", "<leader>xb", "<cmd>XcodebuildBuild<cr>", { desc = "[XC] Build Project" })
		vim.keymap.set("n", "<leader>xB", "<cmd>XcodebuildBuildForTesting<cr>", { desc = "[XC] Build For Testing" })
		vim.keymap.set("n", "<leader>xr", "<cmd>XcodebuildBuildRun<cr>", { desc = "[XC] Build & Run Project" })

		vim.keymap.set("n", "<leader>xt", "<cmd>XcodebuildTest<cr>", { desc = "[XC] Run Tests" })
		vim.keymap.set("v", "<leader>xt", "<cmd>XcodebuildTestSelected<cr>", { desc = "[XC] Run Selected Tests" })
		vim.keymap.set("n", "<leader>xT", "<cmd>XcodebuildTestClass<cr>", { desc = "[XC] Run Current Test Class" })
		vim.keymap.set("n", "<leader>x.", "<cmd>XcodebuildTestRepeat<cr>", { desc = "[XC] Repeat Last Test Run" })

		vim.keymap.set("n", "<leader>xl", "<cmd>XcodebuildToggleLogs<cr>", { desc = "[XC] Toggle Xcodebuild Logs" })
		vim.keymap.set(
			"n",
			"<leader>xc",
			"<cmd>XcodebuildToggleCodeCoverage<cr>",
			{ desc = "[XC] Toggle Code Coverage" }
		)
		vim.keymap.set(
			"n",
			"<leader>xC",
			"<cmd>XcodebuildShowCodeCoverageReport<cr>",
			{ desc = "[XC] Show Code Coverage Report" }
		)
		vim.keymap.set(
			"n",
			"<leader>xe",
			"<cmd>XcodebuildTestExplorerToggle<cr>",
			{ desc = "[XC] Toggle Test Explorer" }
		)
		vim.keymap.set(
			"n",
			"<leader>xs",
			"<cmd>XcodebuildFailingSnapshots<cr>",
			{ desc = "[XC] Show Failing Snapshots" }
		)

		vim.keymap.set(
			"n",
			"<leader>xp",
			"<cmd>XcodebuildPreviewGenerateAndShow<cr>",
			{ desc = "[XC] Generate Preview" }
		)
		vim.keymap.set("n", "<leader>x<cr>", "<cmd>XcodebuildPreviewToggle<cr>", { desc = "[XC] Toggle Preview" })
		vim.keymap.set("n", "<leader>xd", "<cmd>XcodebuildSelectDevice<cr>", { desc = "[XC] Select Device" })
	end,
}
