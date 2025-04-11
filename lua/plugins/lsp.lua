return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ruff_lsp = {
					mason = true,
				},
			},
		},
		-- config = function()
		-- 	local lspconfig = require("lspconfig")
		-- 	local keys = require("lazyvim.plugins.lsp.keymaps").get()
		--
		-- 	lspconfig.sourcekit.setup({})
		-- 	keys[#keys + 1] = {
		-- 		"<leader>cr",
		-- 		function()
		-- 			local inc_rename = require("inc_rename")
		-- 			return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
		-- 		end,
		-- 		expr = true,
		-- 		desc = "Rename (inc-rename.nvim)",
		-- 		has = "rename",
		-- 	}
		-- end,
	},
}
