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

			vim.api.nvim_create_autocmd("LspAttach", {
				desc = "LSP Actions",
				callback = function(args)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true, silent = true })
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true })
				end,
			})
		end,
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
