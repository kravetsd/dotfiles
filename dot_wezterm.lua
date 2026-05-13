local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Font — requires JetBrainsMono Nerd Font installed on Windows.
-- assume_emoji_presentation=false prevents Noto Color Emoji (built-in fallback)
-- from intercepting Nerd Font PUA codepoints and rendering them as orange boxes.
config.font = wezterm.font_with_fallback({
  { family = 'JetBrainsMono Nerd Font', assume_emoji_presentation = false },
})
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

-- Ctrl+V pastes from Windows clipboard (Shift+Insert also works)
config.keys = {
  { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
}

-- Default shell: Git Bash
config.default_prog = { 'C:\\Program Files\\Git\\bin\\bash.exe', '--login', '-i' }

return config
