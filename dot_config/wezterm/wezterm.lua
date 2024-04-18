local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- Font type
-- config.font = wezterm.font("MonaspiceNe Nerd Font Propo")
config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono Nerd Font Mono",
		-- family = "JetBrains Mono",
		harfbuzz_features = { "ss01", "ss02", "ss03", "ss06", "ss07", "ss08", "calt", "dlig" },
	},
	"FiraCode Nerd Font Mono",
})
config.font_size = 14.0

-- Colors
config.color_scheme = "GruvboxDarkHard"

-- Window frame font style
config.window_frame = {
	font = wezterm.font({ family = "JetBrainsMonoNL Nerd Font Propo" }),
}

config.scrollback_lines = 13000
config.initial_rows = 64
config.initial_cols = 160

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

config.mouse_bindings = {
	-- Cmd-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
