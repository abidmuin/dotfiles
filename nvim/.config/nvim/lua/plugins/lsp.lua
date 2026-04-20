-- ~/.config/nvim/lua/plugins/lsp.lua

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		require("mason").setup()

		local servers = {
			-- "clangd",
			-- "gopls",
			-- "pyright",
			-- "intelephense",
			-- "omnisharp",
			"html",
			"jdtls",
			"texlab",
			"lua_ls",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_enable = false,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities() or {}
		local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

		if status_ok then
			local cmp_caps = cmp_nvim_lsp.default_capabilities()
			if cmp_caps then
				capabilities = vim.tbl_deep_extend("force", capabilities, cmp_caps)
			end
		end

		vim.lsp.config("*", {
			capabilities = capabilities,
		})

		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})

		vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local opts = { buffer = ev.buf }
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
			end,
		})
	end,
}
