-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "gb", "<C-o>", { desc = "Go back to previous location" })
vim.keymap.set("n", "gf", "<C-i>", { desc = "Go forward in jumplist" })

vim.o.clipboard = "unnamedplus"
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
		-- Over SSH there's no native clipboard provider, so bounce yanks to the
		-- host (via tmux/terminal) with OSC52. On local machines (e.g. Mac)
		-- unnamedplus already syncs natively, so we skip OSC52 entirely.
		if vim.env.SSH_TTY then
			local osc52 = require("vim.ui.clipboard.osc52")
			osc52.copy("+")(vim.v.event.regcontents)
			osc52.copy("*")(vim.v.event.regcontents)
		end
	end,
})
