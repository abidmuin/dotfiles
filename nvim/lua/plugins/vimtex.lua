-- lua/plugins/vimtex.lua

return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_view_forward_search_on_start = 0
		vim.g.vimtex_quickfix_mode = 0

		-- Map <Space>ll to compile
		vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<cr>", { desc = "VimTex Compile" })

		-- Map <Space>lv to view/forward search
		vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<cr>", { desc = "VimTex View" })
	end,
}
