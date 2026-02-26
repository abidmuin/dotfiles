-- lua/core/keymaps.lua

-- KEYBINDINGS
-- leader key, `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- syntax: mode, keys, command
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")

-- START_GO
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.keymap.set("n", "<leader>gr", ":!go run %<CR>", { buffer = true, desc = "Go Run" })
	end,
})

-- END_GO
