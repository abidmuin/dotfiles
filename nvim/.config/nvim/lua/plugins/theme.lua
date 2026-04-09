-- ~/.config/nvim/lua/plugins/theme.lua

-- GRUVBOX NVIM
return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			-- background = "light",
			terminal_colors = true,
			undercurl = true,
			underline = true,
			bold = true,
			italic = {
				strings = true,
				emphasis = true,
				comments = true,
				operators = false,
				folds = true,
			},
			strikethrough = true,
			invert_selection = false,
			invert_signs = false,
			invert_tabline = false,
			invert_intend_guides = false,
			inverse = true,
			contrast = "hard",
			palette_overrides = {},
			overrides = {},
			dim_inactive = false,
			transparent_mode = true,
		})

		-- vim.o.background = "light"
		vim.cmd.colorscheme("gruvbox")
	end,
}

-- TOKYO NIGHT

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "storm",
-- 			transparent = true,
-- 			dim_inactive = true,
-- 			styles = {
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = { italic = true },
-- 				variables = {},
-- 				sidebars = "dark",
-- 				floats = "dark",
-- 			},
-- 			plugins = {
-- 				all = true,
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }

