return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,

	config = function()
		-- using the color theme.
		local color = "gruvbox"

		vim.g.gruvbox_contrast_dark = "hard"

		vim.cmd.colorscheme(color)

		-- making the background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

		-- making the normal float color same as the background
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

		vim.api.nvim_set_hl(0, "StatusLine", { bg = "none" })

		-- removing the signColumn background
		vim.api.nvim_set_hl(0, "signColumn", { bg = "none" })
	end,
}
