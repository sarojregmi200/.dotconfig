local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- setting the color theme
config.color_scheme = "Catppuccin Mocha (Gogh)"

-- making the background transparent
config.window_background_opacity = 0.95
config.enable_tab_bar = false

return config
