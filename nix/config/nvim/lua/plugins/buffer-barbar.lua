return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  lazy = false,
  -- init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  keys = {
    {mode = "n", "<C-b>a", "<cmd>BufferCloseAllButCurrent<CR>", desc = "開いているbuffer以外を閉じる"},
    {mode = "n", "<C-b>c", "<cmd>BufferClose<CR>", desc = "bufferを閉じる"},
    {mode = "n", "<C-b>s", "<cmd>BufferOrderByDirectory<CR>", desc = "bufferをソートする"},
    {mode = "n", "<C-h>", "<cmd>BufferPrevious<CR>", desc = "1つ前のbuffer選択"},
    {mode = "n", "<C-l>", "<cmd>BufferNext<CR>", desc = "1つ次のbuffer選択"},
  },
}
