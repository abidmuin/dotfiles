-- ~/.config/nvim/lua/plugins/formatter.lua

return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				json = { "prettier" },
				jsonc = { "prettier" },
				-- c = { "clang-format" },
				-- cpp = { "clang-format" },
				-- go = { "goimports" },
				-- java = { "google-java-format" },
				-- python = { "isort", "black" },
				-- php = { "php_cs_fixer" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
