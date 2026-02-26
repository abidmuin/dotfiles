-- lua/plugins/lsp.lua

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		require("mason").setup()

		local servers = {
			"clangd",
			"gopls",
			"pyright",
			"intelephense",
			"omnisharp",
			"jdtls",
			"texlab",
		}

		require("mason-lspconfig").setup({
			ensure_installed = servers,
			automatic_enable = false,
			-- automatic_installation = false,
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities() or {}
		local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

		if status_ok then
			local cmp_caps = cmp_nvim_lsp.default_capabilities()
			if cmp_caps then
				capabilities = vim.tbl_deep_extend("force", capabilities, cmp_caps)
			end
		end

		for _, server in ipairs(servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
			})
		end

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = { globals = { "vim" } },
				},
			},
		})
	end,
}
