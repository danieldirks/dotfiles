-- load wezterm api
local wezterm = require 'wezterm'

-- initialize config map
local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- color theme
config.color_scheme = 'Catppuccin Mocha'

-- font settings
config.font = wezterm.font 'CaskaydiaCove Nerd Font Mono'
config.font_size = 12.0
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.underline_position = -3

-- window settings
config.initial_rows = 42
config.initial_cols = 180
config.enable_scroll_bar = false
--config.window_decorations = 'TITLE'
--config.window_padding = {
--  left = 0,
--  right = 0,
--  top = 0,
--  bottom = 0,
--}

-- tabs
config.hide_tab_bar_if_only_one_tab = true

-- default command
config.default_prog = { 'wsl.exe', '--cd', '~', '/bin/zsh', '-l' }

-- disable confirmation when closing
config.window_close_confirmation = 'NeverPrompt'

-- notifications
config.audible_bell = 'Disabled'

return config
