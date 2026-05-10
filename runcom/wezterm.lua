local wezterm = require("wezterm")

local config = wezterm.config_builder()

-- Keep TERM on a widely-installed entry. `wezterm` requires matching terminfo;
-- when missing, zsh/readline-style redraw can corrupt interactive input.
config.term = "xterm-256color"
config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 14
config.color_scheme = "tokyonight"

config.hide_tab_bar_if_only_one_tab = true

config.keys = {
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.DisableDefaultAssignment,
	},
}

return config
