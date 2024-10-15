local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- terminal essentials
config.audible_bell = "Disabled" --beep sound

-- setting the color theme
config.enable_tab_bar = false
config.colors = {
	background = "#040F0F",
}

--turning off some overlapping keybinds
config.keys = {
	{
		key = "Enter",
		mods = "ALT",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

-- font configuration
config.font_size = 16

-- window configuration
config.window_background_opacity = 1

return config
