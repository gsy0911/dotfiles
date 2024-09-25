-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = wezterm.config_builder()


----------------------------------------------------
-- Window
----------------------------------------------------

config.color_scheme = 'Wombat'
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Breeze'

-- フォントサイズ
config.font_size = 13.0
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.70
config.macos_window_background_blur = 20

config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 1000
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

config.enable_scroll_bar = true

config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.font_size = 14.0
config.command_palette_font_size = 14.0
config.command_palette_bg_color = '#4D07FF'

config.window_frame = {
	font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
	font_size = 12,
}


----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- タブが一つしかない時に非表示
config.hide_tab_bar_if_only_one_tab = true
-- nightlyのみ使用可能
-- タブの閉じるボタンを非表示
-- config.show_close_tab_button_in_tabs = false

-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}


-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = "#5c6d74"
  local foreground = "#FFFFFF"
  local edge_background = "none"
  if tab.is_active then
    background = "#ae8b2d"
    foreground = "#FFFFFF"
  end
  local edge_foreground = background
  local title = "  " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "(" .. tab.active_pane.pane_id .. ")  "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

----------------------------------------------------
-- Key Bindings
----------------------------------------------------

local act = wezterm.action

config.keys = {
    -- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
    {
        key = "w",
        mods = "CMD",
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    -- ⌘ Ctrl ,で下方向にペイン分割
    {
        key = ",",
        mods = "CMD|CTRL",
        action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
    },
    -- ⌘ Ctrl .で右方向にペイン分割
    {
        key = ".",
        mods = "CMD|CTRL",
        action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
    },
    -- ⌘ Ctrl oでペインの中身を入れ替える
    {
        key = "o",
        mods = "CMD|CTRL",
        action = wezterm.action.RotatePanes 'Clockwise'
    },
    -- ⌘ Ctrl hjklでペインの移動
    {
        key = 'h',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
        key = 'j',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
        key = 'k',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
        key = 'l',
        mods = 'CMD|CTRL',
        action = wezterm.action.ActivatePaneDirection 'Right',
    },
    -- ⌘ Enterで最大化・縮小化のトグル
    {
        key = 'Enter',
        mods = 'CMD',
        action = act.ToggleFullScreen
    },
}

-- 最初からフルスクリーンで起動
local mux = wezterm.mux
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)

-- タブを下に表示（デフォルトでは上にある）
config.tab_bar_at_bottom = true

return config