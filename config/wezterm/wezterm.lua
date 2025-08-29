local wezterm = require("wezterm")

return {
	bidi_enabled = true,

	-- Font with better spacing options
	font = wezterm.font_with_fallback({
		"JetBrains Mono",
		"SF Mono", -- Often better Hebrew spacing on macOS
	}),
	font_size = 16,

	-- Font rendering options
	freetype_load_target = "Normal",
	freetype_render_target = "Normal",

	-- Remove harfbuzz features that might affect spacing
	-- harfbuzz_features = { "calt=0", "clig=0", "liga=0" },

	-- Try adjusting cell width
	cell_width = 1.0,
	line_height = 1.0,

	color_scheme = "Gruvbox Material (Gogh)",
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,

	keys = {
		{
			key = "l",
			mods = "CMD",
			action = wezterm.action.TogglePaneZoomState,
		},
	},

	use_ime = true,
}
