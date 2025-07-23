-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.keymap.set("n", "gb", "<C-o>", { desc = "Go back to previous location" })
vim.keymap.set("n", "gf", "<C-i>", { desc = "Go forward in jumplist" })
