return {
  "sindrets/diffview.nvim",
  config = function ()
    require("diffview").setup()
  end,
  lazy = false,
  keys = {
    {mode = "n", "<leader>gh", "<cmd>DiffviewOpen HEAD~1<CR>", desc = "1つ前とのdiff(head)"},
    {mode = "n", "<leader>gf", "<cmd>DiffviewFileHistory %<CR>", desc = "ファイルの変更履歴(file-history)"},
    {mode = "n", "<leader>gc", "<cmd>DiffviewClose<CR>", desc = "diffの画面閉じる(close)"},
    {mode = "n", "<leader>gd", "<cmd>Diffview<CR>", desc = "コンフリクト解消画面表示(diff-view)"},
  },
}
