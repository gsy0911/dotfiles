local pickers = require "telescope.pickers" -- picker 作成用の API
local finders = require "telescope.finders" -- finder 作成用の API
local entry_display = require "telescope.pickers.entry_display"
local conf = require("telescope.config").values -- ユーザーの init.lua を反映した設定内容

local displayer = entry_display.create {
  separator = " ",
  items = {
    { width = 10 },
    { width = 2 },
    { remaining = true },
  },
}

-- entry の表示を作成する関数
-- EntryMaker の返り値の display 以外のフィールドが埋まったものが渡される。
local make_display = function (entry)
  -- local metadata = entry.value
  return displayer {
    -- 1つ目のフィールドに slug を表示
    -- TelescopeResultsIdentifier は highlight group
    { entry, "TelescopeResultsIdentifier" },
    "emoji",
    "title",
  }
end


local plugins_picker = function(opts)
  opts = opts or {}
  opts.entry_maker = function (entry) -- EntryMaker: 入力は finder の返す文字列
    -- local metadata = vim.json.decode(entry) -- json を Lua のテーブルに変換
    return {
      -- value = metadata, -- あとから displayer などで使うためフルの情報を渡しておく
      -- ordinal = metadata.slug .. " " .. metadata.title, -- 検索対象として使われる文字列
      -- display = metadata.slug .. " " .. metadata.title, -- 画面上に表示される文字列
      -- path = "articles/" .. metadata.slug .. ".md", -- 選択したときに開くファイルのパス
      value = entry,
      -- display = make_display,
      display = entry,
      ordinal = entry,
      path = envtry,
    }
  end
  local cmd = { "find", "./.config/nvim/lua/plugins", "-name", "*.lua" } -- 検索対象としたい項目を集めてくるコマンド
  pickers.new(opts, {
    prompt_title = "plugins", -- 入力プロンプト上部に表示されるタイトル
    finder = finders.new_oneshot_job(cmd, opts), -- cmd をシェルで実行し結果を検索対象として返す。
    sorter = conf.generic_sorter(opts), -- ユーザー設定の sorter を使う。
    previewer = conf.file_previewer(opts),
  }):find()
end

plugins_picker()

