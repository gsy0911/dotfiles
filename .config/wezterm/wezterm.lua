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

-- config.color_scheme = 'Wombat'
config.color_scheme = 'OneDark (base16)'
config.window_padding = {
  left = "0.5cell",
  right = "0.5cell",
  top = "1.0cell",
  bottom = "0.5cell",
}
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
	font = wezterm.font('Cica', { weight = 'Bold' }),
	font_size = 16,
}
config.tab_max_width = 24

-- 最初からフルスクリーンで起動
wezterm.on("gui-startup", function(cmd)
    local tab, pane, window = mux.spawn_window(cmd or {})
    window:gui_window():toggle_fullscreen()
end)


----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "TITLE | RESIZE"
-- config.enable_tab_bar = true
-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- タブが一つしかない時に非表示
-- config.hide_tab_bar_if_only_one_tab = true
-- タブを下に表示（デフォルトでは上にある）
config.tab_bar_at_bottom = true
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


-- タブのアイコン
local TAB_ICON_DOCKER = wezterm.nerdfonts.md_docker
local TAB_ICON_PYTHON = wezterm.nerdfonts.dev_python
local TAB_ICON_NEOVIM = wezterm.nerdfonts.linux_neovim
local TAB_ICON_ZSH = wezterm.nerdfonts.dev_terminal
local TAB_ICON_TASK = wezterm.nerdfonts.cod_server_process
local TAB_ICON_NODE = wezterm.nerdfonts.md_language_typescript
local TAB_ICON_FALLBACK = wezterm.nerdfonts.md_console_network
-- タブのアイコン色
local TAB_ICON_COLOR_DOCKER = "#4169e1"
local TAB_ICON_COLOR_PYTHON = "#ffd700"
local TAB_ICON_COLOR_NEOVIM = "#32cd32"
local TAB_ICON_COLOR_ZSH = "#808080"
local TAB_ICON_COLOR_TASK = "#ff7f50"
local TAB_ICON_COLOR_NODE = "#1e90ff"
local TAB_ICON_COLOR_FALLBACK = "#ae8b2d"
local TAB_FOREGROUND_DEFAULT = "#FFFFFF"
local TAB_BACKGROUND_DEFAULT = "#5c6d74"
local TAB_FOREGROUND_ACTIVE = "#FFFFFF"
local TAB_BACKGROUND_ACTIVE = "#ae8b2d"
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_LEFT_CIRCLE = wezterm.nerdfonts.ple_left_half_circle_thick
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle
local SOLID_RIGHT_CIRCLE = wezterm.nerdfonts.ple_right_half_circle_thick

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local background = TAB_BACKGROUND_DEFAULT
  local foreground = TAB_FOREGROUND_DEFAULT
  if tab.is_active then
    background = TAB_BACKGROUND_ACTIVE
    foreground = TAB_FOREGROUND_ACTIVE
  end
  local edge_background = "none"
  local edge_foreground = background

  local icon = TAB_ICON_FALLBACK
  local icon_foreground = TAB_ICON_COLOR_FALLBACK
  if tab.active_pane.title == "nvim" then
    icon = TAB_ICON_NEOVIM
    icon_foreground = TAB_ICON_COLOR_NEOVIM
  elseif tab.active_pane.title == "zsh" then
    icon = TAB_ICON_ZSH
    icon_foreground = TAB_ICON_COLOR_ZSH
  elseif tab.active_pane.title == "Python" or string.find(tab.active_pane.title, "python") then
    icon = TAB_ICON_PYTHON
    icon_foreground = TAB_ICON_COLOR_PYTHON
  elseif tab.active_pane.title == "node" or string.find(tab.active_pane.title, "node") then
    icon = TAB_ICON_NODE
    icon_foreground = TAB_ICON_COLOR_NODE
  elseif tab.active_pane.title == "docker" or string.find(tab.active_pane.title, "docker") then
    icon = TAB_ICON_DOCKER
    icon_foreground = TAB_ICON_COLOR_DOCKER
  elseif tab.active_pane.title == "task" or string.find(tab.active_pane.title, "task") then
    icon = TAB_ICON_TASK
    icon_foreground = TAB_ICON_COLOR_TASK
  end

  local pane = tab.active_pane
  local pane_id = pane.pane_id
  local cwd = "none"
  if title_cache[pane_id] then
    cwd = title_cache[pane_id]
  else
    cwd = "-"
  end
  
  -- local title = " " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. " [ " .. cwd .. " ] "
  -- local wholeTitle = tab.active_pane.title .. " @ " .. cwd .. ""
  local wholeTitle = cwd 
  local workspace = wezterm.truncate_right(mux.get_active_workspace(), 3)
  local title = wezterm.truncate_right(wholeTitle, max_width - 1)
  local display_name = " " .. workspace .. ": " .. title .. " "
  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = icon_foreground } },
    { Text = icon },
    { Text = " " },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_CIRCLE },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = display_name },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_CIRCLE },
  }
end)

----------------------------------------------------
-- Key Bindings
----------------------------------------------------

config.keys = {
    -- ¥ではなく、バックスラッシュを入力する。おそらくMac固有
    {
        key = "¥",
        action = wezterm.action.SendKey { key = '\\' }
    },
    -- Altを押した場合はバックスラッシュではなく¥を入力する。おそらくMac固有
    {
        key = "¥",
        mods = "ALT",
        action = wezterm.action.SendKey { key = '¥' }
    },
    -- {
    --     key = 't',
    --     mods = 'CTRL',
    --     action = act.SpawnTab 'CurrentPaneDomain',
    -- },
    -- ⌘ w でペインを閉じる（デフォルトではタブが閉じる）
    {
        key = "w",
        mods = "CMD",
        action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
        key = 'v',
        mods = 'CTRL',
        action = act.PasteFrom 'Clipboard'
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
    -- command + nで新規タブの作成 command + tと同じ挙動
    -- command + nはデフォルトだと新しいウィンドウを作成する
    {
        key = "n",
        mods = "SUPER",
        action = act.SpawnTab 'CurrentPaneDomain'
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
    -- ⌘ Ctrl yo でワークスペースの移動
    -- ⌘ Shift yo でワークスペースの移動
    {
        key = 'y',
        mods = 'CMD|CTRL',
        action = act.SwitchWorkspaceRelative(-1)
    },
    {
        key = 'o',
        mods = 'CMD|CTRL',
        action = act.SwitchWorkspaceRelative(1)
    },
    {
        key = 'y',
        mods = 'CMD|SHIFT',
        action = act.SwitchWorkspaceRelative(-1)
    },
    {
        key = 'o',
        mods = 'CMD|SHIFT',
        action = act.SwitchWorkspaceRelative(1)
    },
    -- スクロールアップ
    {
      key = 'k',
      mods = 'CMD',
      action = wezterm.action.ScrollByPage(-1), -- 1ページ上にスクロール
    },
    -- スクロールダウン
    {
      key = 'j',
      mods = 'CMD',
      action = wezterm.action.ScrollByPage(1), -- 1ページ下にスクロール
    },
    -- スクロールアップ
    {
      key = 'k',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ScrollByLine(-5), -- 5行上にスクロール
    },
    -- スクロールダウン
    {
      key = 'j',
      mods = 'CMD|SHIFT',
      action = wezterm.action.ScrollByLine(5), -- 5行下にスクロール
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
