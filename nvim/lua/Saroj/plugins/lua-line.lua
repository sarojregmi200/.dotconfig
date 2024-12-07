return {
	"nvim-lualine/lualine.nvim",

	dependencies = { "letieu/harpoon-lualine" },
	config = function()
		local function mode()
			return vim.api.nvim_get_mode().mode
		end

		require("lualine").setup({
			options = {
				section_separators = "",
				component_separators = "",
				theme = "codedark",
			},

			sections = {
				lualine_a = { mode },
				lualine_b = { "filename" },
				lualine_c = {},

				lualine_x = {
					{
						"harpoon2",
						indicators = { "h", "j", "k", "l" },
						active_indicators = { "H", "J", "K", "L" },
					},
				},

				lualine_y = {
					"filetype",
				},
				lualine_z = {},
			},
		})
	end,
}
