return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = { "rafamadriz/friendly-snippets" },

	version = "1.*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			preset = "default",
			["<C-p>"] = {},
			["<C-n>"] = {},
			["<C-j>"] = { "select_next" },
			["<C-k>"] = { "select_prev" },
			["<C-e>"] = { "hide" },
			["<C-c>"] = { "hide" },
		},

		appearance = {
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			documentation = {
				auto_show = true,
			},
			list = {
				selection = {
          auto_insert = false,
          preselect = true,
				},
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},

		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = { enabled = true },
	},
	opts_extend = { "sources.default" },
}
