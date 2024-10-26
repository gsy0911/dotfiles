return {
  "sindrets/diffview.nvim",
  keys = {
    {mode = "n", "<leader>hh", "<cmd>DiffviewOpen HEAD~1<CR>", desc = "1つ前とのdiff"},
    {mode = "n", "<leader>hf", "<cmd>DiffviewFileHistory %<CR>", desc = "ファイルの変更履歴"},
    {mode = "n", "<leader>hc", "<cmd>DiffviewClose<CR>", desc = "diffの画面閉じる"},
  },
}
