-- ~/.config/nvim/lua/plugins/java.lua

return {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = { "neovim/nvim-lspconfig" },
		ft = { "java" },
	},
}
