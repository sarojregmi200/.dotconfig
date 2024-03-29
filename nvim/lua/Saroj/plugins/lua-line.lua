return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "codedark",
			},
			sections = {
				lualine_y = { "" },
				lualine_x = {
					"encoding",
					"filetype",
				},
			},
		})
	end,
}
