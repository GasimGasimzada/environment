local wezterm = require('wezterm')
local config = wezterm.config_builder()

local cattpuccin = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]

config.font = wezterm.font("CaskaydiaCove Nerd Font Mono", { weight = "DemiBold" })
config.color_scheme = "Catppuccin Mocha"
config.use_fancy_tab_bar = true
config.window_decorations = "RESIZE"
config.font_size = 16
config.window_frame = {
    font = config.font,
    font_size = 14,
    active_titlebar_bg = cattpuccin.tab_bar.background
}

config.colors = {
    tab_bar = cattpuccin.tab_bar
}

return config
