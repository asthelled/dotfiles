local wezterm = require("wezterm")
local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez") -- Tabline.wez plugin
local config = wezterm.config_builder()
local act = wezterm.action

-- The main config
config.initial_cols = 120
config.initial_rows = 32
config.font = wezterm.font("JetBrains Mono")
config.font_size = 10
config.color_scheme = "Everforest Dark (Gogh)"
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.window_padding = {
	left = "0",
	right = "0",
	top = "0",
	bottom = "0",
}
config.colors = {
	tab_bar = {
		background = "#2d353b",
		new_tab_hover = {
			bg_color = "#4b565c",
			fg_color = "#909090",
		},
	},
}

-- Keybindings
config.leader = { key = "`", mods = "CTRL" }
config.keys = {
	{ key = "Backspace", mods = "CTRL", action = act.SendKey({ key = "w", mods = "CTRL" }) }, -- Makes Ctrl + Backspace delete a word

	-- Keybindings activated by a Leader
	{
		key = "q",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "resize_pane",
			one_shot = false,
		}),
	},
	{
		key = "e",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "activate_pane",
		}),
	},
	{
		key = "a",
		mods = "LEADER",
		action = act.ActivateKeyTable({
			name = "split_pane",
		}),
	},
}
-- Key tables
config.key_tables = {
	resize_pane = {
		{ key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
		{ key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },

		{ key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
		{ key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },

		{ key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
		{ key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },

		{ key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
		{ key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },

		{ key = "Escape", action = "PopKeyTable" },
	},

	activate_pane = {
		{ key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
		{ key = "h", action = act.ActivatePaneDirection("Left") },

		{ key = "RightArrow", action = act.ActivatePaneDirection("Right") },
		{ key = "l", action = act.ActivatePaneDirection("Right") },

		{ key = "UpArrow", action = act.ActivatePaneDirection("Up") },
		{ key = "k", action = act.ActivatePaneDirection("Up") },

		{ key = "DownArrow", action = act.ActivatePaneDirection("Down") },
		{ key = "j", action = act.ActivatePaneDirection("Down") },

		{ key = "Escape", action = "PopKeyTable" },
	},
	split_pane = {
		{ key = "LeftArrow", action = act.SplitPane({ direction = "Left" }) },
		{ key = "a", action = act.SplitPane({ direction = "Left" }) },

		{ key = "RightArrow", action = act.SplitPane({ direction = "Right" }) },
		{ key = "d", action = act.SplitPane({ direction = "Right" }) },

		{ key = "UpArrow", action = act.SplitPane({ direction = "Up" }) },
		{ key = "w", action = act.SplitPane({ direction = "Up" }) },

		{ key = "DownArrow", action = act.SplitPane({ direction = "Down" }) },
		{ key = "s", action = act.SplitPane({ direction = "Down" }) },
	},
}

-- Plugin
tabline.setup({
	options = {
		icons_enabled = true,
		theme = "Everforest Dark (Gogh)",
		tabs_enabled = true,
		theme_overrides = {},
		section_separators = {},
		component_separators = {},
		tab_separators = {
			left = wezterm.nerdfonts.ple_right_half_circle_thick,
			right = wezterm.nerdfonts.ple_left_half_circle_thick,
		},
	},
	sections = {
		tabline_a = {},
		tabline_b = {},
		tabline_c = {},
		tab_active = { "process", padding = { left = 0, right = 1 } },
		tab_inactive = { "process", padding = { left = 0, right = 1 } },
		tabline_x = {},
		tabline_y = {},
		tabline_z = {},
	},
	extensions = {},
})

tabline.get_config()
return config
