local setBg = function(bg)
		-- making the background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = bg })

		-- making the normal float color same as the background
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = bg })

		vim.api.nvim_set_hl(0, "StatusLine", { bg = bg })

		-- removing the signColumn background
		vim.api.nvim_set_hl(0, "signColumn", { bg = bg })
end

local grub_box_normal = {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,

	config = function()
		-- using the color theme.
		local color = "gruvbox"

		vim.g.gruvbox_contrast_dark = "hard"

		vim.cmd.colorscheme(color)

		-- making the background transparent
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

		-- removing the signColumn background
		vim.api.nvim_set_hl(0, "signColumn", { bg = "none" })
	end,
}

local sonokai = {
	"sainnhe/sonokai",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.sonokai_enable_italic = true
    vim.g.sonokai_style = "maia"
		vim.cmd.colorscheme("sonokai")
    setBg("none")
	end,
}

local grub_box_material = {
	"sainnhe/gruvbox-material",
	lazy = false,
	priority = 1000,

	config = function()
		-- using the color theme.
		local color = "gruvbox-material"

		vim.g.gruvbox_material_enable_italic = true
		vim.g.gruvbox_material_enable_bold = true
		vim.g.gruvbox_material_transparent_background = true
		vim.g.gruvbox_material_diagnostic_line_highlight = true
		vim.g.gruvbox_contrast_dark = "hard"

		vim.cmd.colorscheme(color)
    setBg("none")
	end,
}
local configuredThemes = {
	grub_box_normal,
	grub_box_material,
  sonokai,
}

return configuredThemes[2]
