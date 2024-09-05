return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,

	config = function()
		-- using the color theme.
		local color = "gruvbox"

		require("gruvbox").setup({
			overrides = {
				CursorLine = { bg = "#222222" },
			},
		})
		vim.g.gruvbox_contrast_dark = "hard"

		vim.cmd.colorscheme(color)

		-- making the background transparent
		-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		-- --
		-- -- -- removing the signColumn background
		-- vim.api.nvim_set_hl(0, "signColumn", { bg = "none" })
		-- --
		-- -- -- removing the transparent window
		-- vim.api.nvim_win_set_option(0, "winblend", 0)
	end,
}
