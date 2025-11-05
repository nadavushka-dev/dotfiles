local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.bidi_enabled = true

-- Font with better spacing options
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"SF Mono", -- Often better Hebrew spacing on macOS
})
config.font_size = 16

-- Font rendering options
config.freetype_load_target = "Normal"
config.freetype_render_target = "Normal"

-- Try adjusting cell width
config.cell_width = 1.0
config.line_height = 1.0

config.color_scheme = "Gruvbox Material (Gogh)"

config.colors = {
	cursor_bg = "#a190b0", -- Muted Lavender
	cursor_fg = "#282828", -- Gruvbox Background
	cursor_border = "#a190b0",
}

config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{
		key = "l",
		mods = "CMD",
		action = wezterm.action.TogglePaneZoomState,
	},
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
}

config.use_ime = true

return config
