-- Pull in the wezterm API
local wezterm = require "wezterm"

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- COLOR SCHEME ----------------------------------
config.color_scheme = "GruvboxDark"

-- FONT ------------------------------------------
config.font = wezterm.font("SauceCodePro Nerd Font", {weight = "Regular"})
config.font_size = 15
config.foreground_text_hsb = {
  hue = 1.0,
  saturation = 1.0,
  brightness = 1.1,
}
config.freetype_load_target = "Light"
config.freetype_render_target = "VerticalLcd"

config.line_height = 1.0

-- KEY BINDINGS ----------------------------------
config.keys = {
  {key="0", mods="CTRL", action=wezterm.action.DisableDefaultAssignment},
}

-- WINDOW ----------------------------------------
config.use_fancy_tab_bar = true
-- config.window_decorations = "INTEGRATED_BUTTONS | RESIZE"
config.window_decorations = "RESIZE"
config.window_frame = {
  font_size = 14
}

-- and finally, return the configuration to wezterm
return config
