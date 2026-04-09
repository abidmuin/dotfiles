-- ~/.config/nvim/lua/core/keymaps.lua

-- KEYBINDINGS
-- leader key, `:help mapleader`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

-- GENERAL
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- WINDOW MANAGEMENT
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>sx", ":close<CR>", { desc = "Close current split" })

-- FAST MOVEMENT BETWEEN SPLITS (Ctrl+hjkl)
keymap.set("n", "<C-h>", "<C-w>h")
keymap.set("n", "<C-j>", "<C-w>j")
keymap.set("n", "<C-k>", "<C-w>k")
keymap.set("n", "<C-l>", "<C-w>l")

-- WRITE
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>")

-- START_GO
vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		vim.keymap.set("n", "<leader>gr", ":!go run %<CR>", { buffer = true, desc = "Go Run" })
	end,
})
-- END_GO

