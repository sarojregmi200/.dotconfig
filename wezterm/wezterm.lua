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
	background = "#141617",
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
config.font_size = 12
config.font = wezterm.font("GeistMono NFP")

config.enable_wayland = false

-- window configuration
config.window_background_opacity = 1
config.macos_window_background_blur = 200

-- window titlebar
config.window_decorations = "RESIZE"

return config
