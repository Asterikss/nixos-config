-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- wezterm --config debug_key_events=true wezterm will log information about key presses

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'zenburn' -- 'zenbones_dark'
-- config.color_scheme = 'zenburn (terminal.sexy)'
-- config.color_scheme = 'Wild Cherry (Gogh)'
-- config.color_scheme = 'Woodland (base16)'
-- config.color_scheme = 'Wzoreck (Gogh)'
-- config.color_scheme = 'Vacuous 2 (terminal.sexy)'
  -- config.color_scheme = 'Vaughn'
  -- config.color_scheme = 'Vaughn (Gogh)'
  config.color_scheme = 'Vesper'
  -- config.color_scheme = 'VisiBlue (terminal.sexy)'
-- config.color_scheme = 'vulcan (base16)'
-- config.color_scheme = 'VWbug (terminal.sexy)'

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = true

-- config.enable_tab_bar = false
-- config.font_size = 19.0

local act = wezterm.action

config.keys = {
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },
  {
    key = 'c',
    mods = 'CTRL',
    action = wezterm.action_callback(function(window, pane)
      selection_text = window:get_selection_text_for_pane(pane)
      is_selection_active = string.len(selection_text) ~= 0
      if is_selection_active then
        window:perform_action(wezterm.action.CopyTo('ClipboardAndPrimarySelection'), pane)
      else
        window:perform_action(wezterm.action.SendKey{ key='c', mods='CTRL' }, pane)
      end
    end),
  },
  -- create new tab one to the right https://github.com/wez/wezterm/discussions/2691
  {
    key='n', mods='ALT', action = wezterm.action_callback(function(window, pane)
      local mux_window = window:mux_window()

      -- determine the index of the current tab
      -- https://wezfurlong.org/wezterm/config/lua/mux-window/tabs_with_info.html
      local tabs = mux_window:tabs_with_info()
      local current_index = 0
      for _, tab_info in ipairs(tabs) do
        if tab_info.is_active then
          current_index = tab_info.index
          break
        end
      end

      -- spawn a new tab; it will be made active
      -- https://wezfurlong.org/wezterm/config/lua/mux-window/spawn_tab.html
      mux_window:spawn_tab{}

      -- Move the new active tab to the right of the previously active tab
      window:perform_action(act.MoveTab(current_index+1), pane)
    end)
  },
  -- { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' }, paste from the primary selection
}

config.window_background_opacity = 0.8
-- config.text_background_opacity = 1 -- see no effect

config.default_cwd = "cave/"

config.enable_wayland = false

-- and finally, return the configuration to wezterm
return config
