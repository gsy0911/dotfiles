-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = wezterm.config_builder()

config.color_scheme = 'Wombat'
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Breeze'

-- フォントサイズ
config.font_size = 13.0
-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.95

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


-- Key Bindings
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