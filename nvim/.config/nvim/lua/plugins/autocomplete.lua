-- ~/.config/nvim/lua/plugins/autocomplete.lua

return {
	{
		"saghen/blink.cmp",
		version = "*",

		dependencies = {
			"rafamadriz/friendly-snippets",
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("luasnip.loaders.from_vscode").lazy_load()
				end,
			},
		},

		opts = {
			keymap = {
				preset = "default",
				["<Tab>"] = { "snippet_forward", "fallback" },
				["<S-Tab>"] = { "snippet_backward", "fallback" },
				["<C-y>"] = { "select_and_accept" },
				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			completion = {
				ghost_text = { enabled = true },
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
				menu = {
					draw = {
						columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind" } },
					},
				},
			},

			snippets = { preset = "luasnip" },
		},
		opts_extend = { "sources.default" },
	},
}
