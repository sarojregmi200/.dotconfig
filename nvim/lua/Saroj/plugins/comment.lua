return {
	"numToStr/Comment.nvim",
	-- for todo and notes comments and fixed comment highlighing
	config = function()
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
		require("Comment").setup(options)
	end,
}
