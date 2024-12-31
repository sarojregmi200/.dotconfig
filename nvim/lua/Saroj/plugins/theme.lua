return {
	"rebelot/kanagawa.nvim",
	priority = 1000,

	config = function()
		-- making the background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

		-- making the normal float color same as the background
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

		-- removing the signColumn background
		vim.api.nvim_set_hl(0, "signColumn", { bg = "none" })
	end,
}
