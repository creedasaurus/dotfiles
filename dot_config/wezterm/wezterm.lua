local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font type 
config.font = wezterm.font('JetBrains Mono')
config.font_size = 12.2

-- Colors
config.color_scheme = 'Operator Mono Dark'

-- Window frame font style
config.window_frame = {
	font = wezterm.font { family = 'JetBrains Mono SemiBold' }
}

return config


