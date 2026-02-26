-- lua/plugins/treesitter.lua

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	branch = "master",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"c",
				"cpp",
				"java",
				"python",
				"php",
				"c_sharp",
				"go",
				"html",
				"css",
				"javascript",
			},
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
