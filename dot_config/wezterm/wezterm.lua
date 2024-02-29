local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font type
config.font = wezterm.font("MonaspiceNe Nerd Font Propo")
config.font_size = 14.0

-- Colors
config.color_scheme = "GruvboxDarkHard"

-- Window frame font style
config.window_frame = {
	font = wezterm.font({ family = "MonaspiceNe Nerd Font Propo" }),
}

config.scrollback_lines = 13000

config.window_decorations = "RESIZE"

config.window_padding = {
	left = "1cell",
	right = "1cell",
	top = "0.2cell",
	bottom = "0.2cell",
}
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20

config.hide_tab_bar_if_only_one_tab = true

return config
