local wezterm = require("wezterm")
local act = wezterm.action

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
		-- harfbuzz_features = { "ss01", "ss02", "ss03", "ss06", "ss07", "ss08", "calt", "dlig" },
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
config.window_background_opacity = 0.95
config.macos_window_background_blur = 30

config.hide_tab_bar_if_only_one_tab = true

config.mouse_bindings = {
	-- Cmd-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CMD",
		action = act.OpenLinkAtMouseCursor,
	},
}

config.keys = {
	-- This will create a new split and run your default program inside it
	{
		key = "d",
		mods = "CMD",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	-- This will create a new split and run your default program inside it
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "LeftArrow",
		mods = "CMD|OPT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD|OPT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD|OPT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD|OPT",
		action = act.ActivatePaneDirection("Down"),
	},

	-- Rebind OPT-Left, OPT-Right as ALT-b, ALT-f respectively to match Terminal.app behavior
	{
		key = "LeftArrow",
		mods = "OPT",
		action = act.SendKey({
			key = "b",
			mods = "ALT",
		}),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = act.SendKey({ key = "f", mods = "ALT" }),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = act.SendKey({ key = "e", mods = "CTRL" }),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = act.SendKey({ key = "a", mods = "CTRL" }),
	},
}

return config
