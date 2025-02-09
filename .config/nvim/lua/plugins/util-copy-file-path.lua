return {
  "mogulla3/copy-file-path.nvim",
  event = { "BufReadPost", "BufNewFile" },
  config = function ()
    vim.keymap.set("n", "<Leader>cp", "<Cmd>CopyFilePath<CR>", { noremap = true, silent = true })
  end
}
