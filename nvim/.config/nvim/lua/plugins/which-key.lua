-- ~/.config/nvim/lua/plugins/which-key.lua

return {
	"folke/which-key.nvim",
	event = "VeryLazy",

	config = function()
		local wk = require("which-key")

		vim.o.timeout = true
		vim.o.timeoutlen = 500

		wk.setup({
			preset = "modern",
			delay = 500,

			icons = {
				mappings = true,
				keys = true,
			},
		})

		wk.add({
			{ "<leader>f", group = "Find / Telescope" },
			{ "<leader>h", group = "Git Hunks" },
			{ "<leader>m", group = "Format" },

			{ "]", group = "Next" },
			{ "[", group = "Previous" },
			{ "g", group = "Go To" },
		})
	end,
}
