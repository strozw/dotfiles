local wezterm = require 'wezterm';

return {
	-- font = wezterm.font("HackGen Console NFJ"),
	-- font = wezterm.font("PlemolJP Console NF"),
	-- font = wezterm.font("UDEV Gothic NFLG"),
	font = wezterm.font("UDEV Gothic NF"),
	use_ime = true,
	font_size = 16.0,
	color_scheme = "wezterm_tokyonight_night",
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	hyperlink_rules = {
		-- Linkify things that look like URLs and the host has a TLD name.
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = '\\b\\w+://[\\w.-]+\\.[a-z]{2,15}\\S*\\b',
			format = '$0',
		},

		-- linkify email addresses
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = [[\b\w+@[\w-]+(\.[\w-]+)+\b]],
			format = 'mailto:$0',
		},

		-- file:// URI
		-- Compiled-in default. Used if you don't specify any hyperlink_rules.
		{
			regex = [[\bfile://\S*\b]],
			format = '$0',
		},

		-- Linkify things that look like URLs with numeric addresses as hosts.
		-- E.g. http://127.0.0.1:8000 for a local development server,
		-- or http://192.168.1.1 for the web interface of many routers.
		{
			regex = [[\b\w+://(?:[\d]{1,3}\.){3}[\d]{1,3}\S*\b]],
			format = '$0',
		},

		-- Make task numbers clickable
		-- The first matched regex group is captured in $1.
		{
			regex = [[\b[tT](\d+)\b]],
			format = 'https://example.com/tasks/?t=$1',
		},

		-- Make username/project paths clickable. This implies paths like the following are for GitHub.
		-- ( "nvim-treesitter/nvim-treesitter" | wbthomason/packer.nvim | wez/wezterm | "wez/wezterm.git" )
		-- As long as a full URL hyperlink regex exists above this it should not match a full URL to
		-- GitHub or GitLab / BitBucket (i.e. https://gitlab.com/user/project.git is still a whole clickable URL)
		{
			regex = [[["]?([\w\d]{1}[-\w\d]+)(/){1}([-\w\d\.]+)["]?]],
			format = 'https://www.github.com/$1/$3',
		},
	},
	mouse_bindings = {
		-- Ctrl-click will open the link under the mouse cursor
		{
			event = { Up = { streak = 1, button = 'Left' } },
			mods = 'CTRL',
			action = wezterm.action.OpenLinkAtMouseCursor,
		},
	},

	-- keys = {
	-- 	-- {key="-", mods="CTRL", action="Nop"},
	-- 	-- {key="=", mods="CTRL", action="Nop"},
	-- 	-- { key = "-", mods = "CTRL", action = "DisableDefaultAssignment" },
	-- 	-- { key = "=", mods = "CTRL", action = "DisableDefaultAssignment" },
	-- }
}
