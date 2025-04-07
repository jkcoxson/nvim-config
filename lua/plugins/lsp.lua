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
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.sourcekit.setup({})
		end,
	},
}
