return {
	"numToStr/Comment.nvim",
	-- for todo and notes comments and fixed comment highlighing
	config = function()
		local ft = require("Comment.ft")
		local options = {
			opleader = {
				line = "sc",
				block = "sb",
			},
			toggler = {
				line = "sc",
				block = "sb",
			},
			extra = {
				above = "<leader>gk",
				below = "<leader>gj",
				eol = "<leader>gl",
			},
			mappings = {
				extra = true,
			},
		}
		ft.set("javascriptreact", { "{/*%s*/}", "{/*%s*/}" })
		ft.set("typescriptreact", { "{/*%s*/}", "{/*%s*/}" })

		require("Comment").setup(options)
	end,
}
