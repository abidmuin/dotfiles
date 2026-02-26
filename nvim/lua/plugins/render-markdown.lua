-- lua/plugins/render-markdown.lua

return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	ft = { "markdown" },
	config = function()
		require("render-markdown").setup({
			heading = {
				enabled = true,
				sign = true,
				icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
			},
			code = {
				enabled = true,
				style = "full",
			},
			bullet = {
				enabled = true,
				icons = { "●", "○", "◆", "◇" },
			},
			checkbox = {
				enabled = true,
				position = "inline",
				unchecked = {
					icon = "󰄱 ",
				},
				checked = {
					icon = "󰱒 ",
				},
			},
		})
	end,
}
