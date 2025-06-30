-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()


config.initial_cols = 120
config.initial_rows = 28

config.font = wezterm.font 'JetBrains Mono Font'
config.font_size = 10
config.color_scheme = 'Everforest Dark (Gogh)'

return config
