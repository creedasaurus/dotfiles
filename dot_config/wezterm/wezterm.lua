local wezterm = require 'wezterm'
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font type 
config.font = wezterm.font('JetBrains Mono')
config.font_size = 13.0

-- Colors
config.color_scheme = 'Catppuccin Mocha'

-- Window frame font style
config.window_frame = {
	font = wezterm.font { family = 'JetBrains Mono SemiBold' }
}

config.window_padding = {
  left = '0.25cell',
  right = '0.25cell',
  top = '0.25cell',
  bottom = '0.25cell',
}

config.hide_tab_bar_if_only_one_tab = true

return config


