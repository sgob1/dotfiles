-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.default_prog = {'/usr/bin/zsh'}
config.enable_wayland = true;

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

config.font = wezterm.font('IBM Plex Mono', { weight = 'Medium', italic = false })
-- config.font.font_antialias = "Subpixel"

config.font_size = 10.8
config.cell_width = 0.8

config.inactive_pane_hsb = {
  saturation = 0.90,
  brightness = 0.92,
}


config.window_background_opacity = 1.0
config.window_decorations = "RESIZE"
config.initial_rows = 24
config.initial_cols = 108
config.enable_tab_bar = false
config.tab_bar_at_bottom = true
config.scrollback_lines = 10000
config.enable_scroll_bar = false
config.check_for_updates = false

config.keys = {
  {
    key = 'd',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitVertical {domain="CurrentPaneDomain"},
  },

  {
    key = 'r',
    mods = 'CTRL|ALT',
    action = wezterm.action.SplitHorizontal {domain="CurrentPaneDomain"},
  },
  {
    key = 'k',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection "Up",
  },
  {
    key = 'j',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection "Down",
  },
  {
    key = 'h',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection "Left",
  },
  {
    key = 'l',
    mods = 'ALT',
    action = wezterm.action.ActivatePaneDirection "Right",
  },
  {
    key = 'k',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Up", 1 }
  },
  {
    key = 'j',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Down", 1 }
  },
  {
    key = 'h',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Left", 2 }
  },
  {
    key = 'l',
    mods = 'CTRL|ALT|SHIFT',
    action = wezterm.action.AdjustPaneSize { "Right", 2 }
  },
}

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    --return "Catppuccin Latte"
    return "Catppuccin Mocha"
  end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())


-- and finally, return the configuration to wezterm
return config
