-- Ctrlキーのダブルタップを検知する設定
local double_press = require("ctrlDoublePress")

-- WezTermを表示または非表示に切り替える関数
local open_wezterm = function()
    local bundleID = "com.github.wez.wezterm" -- WezTermのBundle ID
    local app = hs.application.get(bundleID)

    if app == nil or app:isHidden() then
        hs.application.launchOrFocusByBundleID(bundleID)
    else
        app:hide()
    end
end

-- ダブルタップの動作を設定
double_press.timeFrame = 0.5  -- ダブルタップの間隔（秒）
double_press.action = open_wezterm

