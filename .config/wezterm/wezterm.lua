local wezterm = require("wezterm")

return {
	-- front_end = "WebGpu",
	-- webgpu_power_preference = "HighPerformance",

	default_prog = { "/opt/homebrew/bin/zsh", "-l" },

	-- font = wezterm.font("HackGen Console NFJ"),
	-- font = wezterm.font("PlemolJP Console NF"),
	-- font = wezterm.font("UDEV Gothic NF"),
	font = wezterm.font("UDEV Gothic NFLG"),
	-- font = wezterm.font("Moralerspace Neon"),
	use_ime = true,
	font_size = 16.0,
	line_height = 1.3,
	cell_width = 1.05,
	color_scheme = "tokyonight_night",
	colors = {
		-- tab_bar = {
		-- 	active_tab = {
		-- 		bg_color = "#1a1b26",
		-- 		fg_color = "#c0c0c0",
		-- 	},
		-- 	inactive_tab = {
		-- 		bg_color = "#0f0f14",
		-- 		fg_color = "#808080",
		-- 	},
		-- 	inactive_tab_hover = {
		-- 		bg_color = "#24283b",
		-- 		fg_color = "#909090",
		-- 		italic = true,
		-- 	},
		-- },
	},
	use_fancy_tab_bar = false,
	window_background_opacity = 1,
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},
	window_decorations = "RESIZE | MACOS_FORCE_ENABLE_SHADOW",
	window_frame = {
		active_titlebar_bg = "#0f0f14",
	},
	macos_window_background_blur = 9,
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	bypass_mouse_reporting_modifiers = "ALT",
	keys = {
		-- { key = "_", mods = "CTRL", action = "Nop" },
		-- { key = "_", mods = "CTRL", action = "Nop" },
		-- { key = "-", mods = "CTRL", action = "Nop" },
		{ key = "_", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
		{ key = "_", mods = "CTRL|SHIFT", action = wezterm.action.DisableDefaultAssignment },
		{ key = "@", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
		-- Command + '='
		{ key = "-", mods = "SUPER|SHIFT", action = wezterm.action.IncreaseFontSize },
	},
	-- IME での補完中に `ctrl+H` などを可能にする
	-- macos_forward_to_ime_modifier_mask = "SHIFT|CTRL",
	-- debug_key_events = true,
}
