-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- config starts
config.color_scheme = 'Dracula'
 -- = wezterm.font('JetBrainsMono Nerd Font Mono', { italic = false })
config.font = wezterm.font_with_fallback({
  -- /usr/share/fonts/TTF/JetBrainsMonoNerdFontMono-Regular.ttf, FontConfig
  -- AKA: "JetBrainsMono NFM"
  "JetBrainsMono Nerd Font Mono",

  -- /usr/share/fonts/TTF/JetBrainsMono-Regular.ttf, FontConfig
  "JetBrains Mono",

  -- /usr/share/fonts/noto/NotoColorEmoji.ttf, FontConfig
  -- Assumed to have Emoji Presentation
  -- Pixel sizes: [128]
  "Noto Color Emoji",

})
config.font_size = 13
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "NONE"
-- Spawn a fish shell in login mode
config.default_prog = { 'tmux' }

-- annoying bell on xorg
config.audible_bell = "Disabled"

config.default_cursor_style = 'SteadyBlock'
config.hide_mouse_cursor_when_typing = true

config.window_padding = {
    left = '4px',
    right = '4px',
    top = '4px',
    bottom = '4px'
}

config.initial_rows = 25
config.initial_cols = 95


-- keybindings

config.default_cwd = "/home/default"
local act = wezterm.action

config.leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 }

config.enable_wayland = false

return config
