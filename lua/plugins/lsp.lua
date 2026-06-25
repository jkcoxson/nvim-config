local servers = {
	ruff_lsp = { mason = true },
	clangd = {},
	sourcekit = {
		filetypes = { "swift", "objc", "objcpp" },
	},
}

if vim.fn.has("win32") == 1 then
	-- Stop Mason from trying to install an LSP whose toolchain isn't on PATH; the
	-- install fails and spams the hit-enter prompt on every startup. Dynamic: once
	-- the toolchain (e.g. Go) is installed and nvim restarted, Mason installs it
	-- again automatically. The server config is left intact either way.
	local needs = {
		gopls = "go",
		pyright = "npm",
		svelte = "npm",
		jsonls = "npm",
		vtsls = "npm",
		yamlls = "npm",
		ruff = "python",
	}
	for server, tool in pairs(needs) do
		if vim.fn.executable(tool) == 0 then
			servers[server] = { mason = false }
		end
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = servers,
		},
	},
}
