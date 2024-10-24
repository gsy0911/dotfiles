-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action
local mux = wezterm.mux

-- This table will hold the configuration.
local config = wezterm.config_builder()

config.use_ime = true

----------------------------------------------------
-- Window
----------------------------------------------------

config.color_scheme = 'Wombat'
-- config.color_scheme = 'Tokyo Night'
-- config.color_scheme = 'Breeze'

-- 背景の非透過率（1なら完全に透過させない）
config.window_background_opacity = 0.70
config.macos_window_background_blur = 20

config.default_cursor_style = 'BlinkingBar'
config.cursor_blink_rate = 1000
config.cursor_blink_ease_in = "Linear"
config.cursor_blink_ease_out = "Linear"

config.enable_scroll_bar = true

config.font = wezterm.font('Cica', { weight = 'Bold' })
-- config.font = wezterm.font('JetBrains Mono', { weight = 'Bold' })
config.font_size = 16.0
config.command_palette_font_size = 18.0
config.command_palette_bg_color = '#4D07FF'

config.window_frame = {
	font = wezterm.font('JetBrains Mono', { weight = 'Bold' }),
	font_size = 14,
}

-- 最初からフルスクリーンで起動
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)


----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- タブが一つしかない時に非表示
-- config.hide_tab_bar_if_only_one_tab = true
-- タブを下に表示（デフォルトでは上にある）
-- config.tab_bar_at_bottom = true
-- nightlyのみ使用可能
-- タブの閉じるボタンを非表示
-- config.show_close_tab_button_in_tabs = false

-- タブ同士の境界線を非表示
config.colors = {
  tab_bar = {
    inactive_tab_edge = "none",
  },
}


function split(str, ts)
  -- 引数がないときは空tableを返す
  if ts == nil then return {} end

  local t = {} ;
  i=1
  for s in string.gmatch(str, "([^"..ts.."]+)") do
    t[i] = s
    i = i + 1
  end

  return t
end

-- 各タブの「ディレクトリ名」を記憶しておくテーブル
local title_cache = {}

wezterm.on('update-status', function(window, pane)
  local pane_id = pane:pane_id()
  title_cache[pane_id] = "-"
  local process_info = pane:get_foreground_process_info()

--   local success, stdout, stderr = wezterm.run_child_process({ 'printenv', '|', 'grep', 'CDK_VERSION' })
--   if success then
--     title_cache[pane_id] = stdout
--   end
  if process_info then
    local cwd = process_info.cwd
    local rm_home = string.gsub(cwd, os.getenv 'HOME', '')
    local prj = string.gsub(rm_home, '/Development/Projects', '')
    local dirs = split(prj, '/')
    local root_dir = dirs[1]
    title_cache[pane_id] = root_dir
  end
end)


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
  local pane = tab.active_pane
  local pane_id = pane.pane_id

  local cwd = "none"
  if title_cache[pane_id] then
    cwd = title_cache[pane_id]
  else
    cwd = "-"
  end

  local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " [ " .. cwd .. " ] "
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

config.keys = {
    -- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
    {
        key = "w",
        mods = "CMD",
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    -- ⌘ Ctrl ,で下方向にペイン分割
--     {
--         key = ",",
--         mods = "CMD|CTRL",
--         action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
--     },
--     -- ⌘ Ctrl .で右方向にペイン分割
--     {
--         key = ".",
--         mods = "CMD|CTRL",
--         action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
--     },
    -- ⌘ Ctrl oでペインの中身を入れ替える
    {
        key = "o",
        mods = "CMD|CTRL",
        action = wezterm.action.RotatePanes 'Clockwise'
    },
    -- ⌘ Ctrl hjklでペインの移動
--     {
--         key = 'h',
--         mods = 'CMD|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Left',
--     },
--     {
--         key = 'j',
--         mods = 'CMD|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Down',
--     },
--     {
--         key = 'k',
--         mods = 'CMD|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Up',
--     },
--     {
--         key = 'l',
--         mods = 'CMD|CTRL',
--         action = wezterm.action.ActivatePaneDirection 'Right',
--     },
    -- ⌘ Enterで最大化・縮小化のトグル
    {
        key = 'Enter',
        mods = 'CMD',
        action = act.ToggleFullScreen
    },
    -- ⌘ Ctrl [] でタブの移動
    -- ⌘ Ctrl hl でタブの移動
    -- ⌘ Shift hl でタブの移動
    -- defaultは⌘ Shift []
    {
        key = '[',
        mods = 'CMD|CTRL',
        action = act.ActivateTabRelative(-1)
    },
    {
        key = ']',
        mods = 'CMD|CTRL',
        action = act.ActivateTabRelative(1)
    },
    {
        key = 'h',
        mods = 'CMD|CTRL',
        action = act.ActivateTabRelative(-1)
    },
    {
        key = 'l',
        mods = 'CMD|CTRL',
        action = act.ActivateTabRelative(1)
    },
    {
        key = 'h',
        mods = 'CMD|SHIFT',
        action = act.ActivateTabRelative(-1)
    },
    {
        key = 'l',
        mods = 'CMD|SHIFT',
        action = act.ActivateTabRelative(1)
    },
    {
        key = '{',
        mods = 'SHIFT|CTRL',
        action = act.MoveTabRelative(-1)
    },
    {
        key = '}',
        mods = 'SHIFT|CTRL',
        action = act.MoveTabRelative(1)
    },
    {
        key = 'h',
        mods = 'SHIFT|CTRL',
        action = act.MoveTabRelative(-1)
    },
    {
        key = 'l',
        mods = 'SHIFT|CTRL',
        action = act.MoveTabRelative(1)
    },
    -- Create new workspace
    {
        key = 'S',
        mods = 'CMD|SHIFT',
        action = act.PromptInputLine {
          description = "(wezterm) Create new workspace:",
          action = wezterm.action_callback(function(window, pane, line)
            if line then
              window:perform_action(
                act.SwitchToWorkspace {
                  name = line,
                },
                pane
              )
            end
          end),
        },
  },
}



----------------------------------------------------
-- Command Palette
----------------------------------------------------


wezterm.on('augment-command-palette', function(window, pane)
  return {
    { brief = "Git | Open Lazygit", action = wezterm.action.SendString('lazygit'), icon = "dev_git" },
    { brief = "Git | Close Lazygit", action = wezterm.action.SendString('q'), icon = "dev_git" },
    { brief = "Custom: manual", action = wezterm.action.SendString('mm'), icon = "md_card_text_outline" },
    { brief = "Custom: Ollama up", action = wezterm.action.SendString('docker compose -f ~/.compose/compose.yaml up --build'), icon = "dev_docker" },
    { brief = "Custom: Ollama in", action = wezterm.action.SendString('docker exec -it ollama ollama run ollama3'), icon = "dev_docker" },
  }
end)

return config
