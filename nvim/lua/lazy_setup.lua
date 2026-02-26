-- lua/lazy_setup.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	spec = {
		{ import = "plugins.theme" },
		{ import = "plugins.lsp" },
		{ import = "plugins.autocomplete" },
		{ import = "plugins.formatter" },
		{ import = "plugins.treesitter" },
		{ import = "plugins.telescope" },
		{ import = "plugins.git" },
		{ import = "plugins.nvim-tree" },
		{ import = "plugins.nvim-autopair" },
		{ import = "plugins.nvim-lualine" },
		{ import = "plugins.comment" },
		{ import = "plugins.indent-blankline" },
		{ import = "plugins.which-key" },
		{ import = "plugins.render-markdown" },
		{ import = "plugins.vimtex" },
	},
})
