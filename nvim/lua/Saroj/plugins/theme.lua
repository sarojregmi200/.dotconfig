return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,

	config = function()
		-- using the color theme.
		local color = "gruvbox"

		require("gruvbox").setup({
			italic = {
				strings = false,
				transparent_mode = true,
			},
			overrides = {
				CursorLine = { bg = "#222222" },
			},
		})
		vim.cmd.colorscheme(color)

		-- making the background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

		-- removing the signColumn background
		vim.api.nvim_set_hl(0, "signColumn", { bg = "none" })

		-- trying to make the popup opaque
		vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "white" })
		vim.api.nvim_set_hl(0, "Float", { bg = "white" })
		vim.api.nvim_set_hl(0, "NvimFloat", { bg = "white" })
		vim.api.nvim_set_hl(0, "DiagnosticFloatingError", { bg = "white" })
		vim.api.nvim_set_hl(0, "CocDiagnosticError", { bg = "white" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "white" })
	end,
}
