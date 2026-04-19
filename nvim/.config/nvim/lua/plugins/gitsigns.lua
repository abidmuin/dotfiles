-- ~/.config/nvim/lua/plugins/gitsigns.lua

return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},

			on_attach = function(bufnr)
				local gs = package.loaded.gitsigns

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				map("n", "]h", gs.next_hunk, { desc = "Next Git Hunk" })
				map("n", "[h", gs.prev_hunk, { desc = "Previous Git Hunk" })

				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview Git Hunk" })
			end,
		})
	end,
}
