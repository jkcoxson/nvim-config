return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ruff_lsp = { mason = true },
				clangd = {},
				sourcekit = {
					filetypes = { "swift", "objc", "objcpp" },
				},
			},
		},
	},
}
