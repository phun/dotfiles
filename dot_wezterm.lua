local wezterm = require("wezterm")

-- wezterm.gui is not available to the mux server, so take care to
-- do something reasonable when this config is evaluated by the mux
function get_appearance()
  if wezterm.gui then
    return wezterm.gui.get_appearance()
  end
  return 'Dark'
end

function base_config()
  local config = wezterm.config_builder()
  -- Font
  config.font = wezterm.font("MesloLGS Nerd Font Mono")
  config.font_size = 10
  
  -- Window and tab bar 
  config.hide_tab_bar_if_only_one_tab = true
  -- config.enable_tab_bar = false
  config.window_decorations = "RESIZE" 
  
  -- Window Size
  config.initial_rows = 80
  config.initial_cols = 200
  
  -- Window background
  config.window_background_opacity = 0.97
  config.macos_window_background_blur = 1
  
  config.keys = {
    -- Switch to the previous tab with Cmd + Left Arrow
    {key="LeftArrow", mods="CMD", action=wezterm.action{ActivateTabRelative=-1}},
      
    -- Switch to the next tab with Cmd + Right Arrow
    {key="RightArrow", mods="CMD", action=wezterm.action{ActivateTabRelative=1}},
  }
  return config
end

function generate_config()
  local appearance = get_appearance()
  local config = base_config()

  if appearance:find 'Dark' then
    config.color_scheme = 'tokyonight_night'
    -- config.color_scheme = "Aci (Gogh)"
    -- config.color_scheme = "Andromeda"
    config.colors = {
      foreground = "#CBE0F0",
      background = "#0E1116"
    }
  else
    config.color_scheme = 'tokyonight_day'
  end

  return config
end

return generate_config()
