return {
  "keaising/im-select.nvim",
  enabled = false,
  config = function()
    require("im_select").setup({
      -- デフォルトのIME
      default_im_select  = "com.apple.keylayout.ABC",

      -- 以下のイベント時に、デフォルトのIMEになる
      set_default_events = {"VimEnter", "InsertEnter", "InsertLeave"},

      -- 以下のイベント時に、前回使われていたIMEになる（無効にしている）
      set_previous_events = {},
    })
  end,
}
