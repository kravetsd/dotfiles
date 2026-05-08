local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font — requires JetBrainsMono Nerd Font installed on Windows
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 12.0

-- Color scheme
config.color_scheme = 'Tokyo Night'

-- Window padding
config.window_padding = { left = 4, right = 4, top = 4, bottom = 4 }

-- One tab per remote VM; tab bar always visible
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false

-- OSC 52 clipboard passthrough is enabled by default in WezTerm.
-- No extra config needed — copy in remote Neovim lands in the local Windows clipboard.

-- Default shell: Git Bash
config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '--login', '-i' }

return config
