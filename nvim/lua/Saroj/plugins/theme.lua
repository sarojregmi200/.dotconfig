return {
	--    "catppuccin/nvim",
	--   name = "catppuccin",
	"morhetz/gruvbox",
	name = "gruvbox",
	priority = 1000,

	config = function()
		-- using the color theme.
		local color = "gruvbox"
		vim.cmd.colorscheme(color)
		-- making the background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end,
}
