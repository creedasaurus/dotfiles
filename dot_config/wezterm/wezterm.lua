
local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font('JetBrains Mono')
config.color_scheme = 'Operator Mono Dark'
config.window_frame = {
	font = wezterm.font { family = 'JetBrains Mono SemiBold' }
}

return config


