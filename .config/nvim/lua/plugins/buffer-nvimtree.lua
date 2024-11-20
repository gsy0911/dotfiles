-- open File Tree when open
local function open_nvim_tree()
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    {mode = "n", "<C-n>t", "<cmd>NvimTreeToggle<CR>", desc = "NvimTreeをトグルする"},
    {mode = "n", "<C-n>f", "<cmd>NvimTreeFocus<CR>", desc = "NvimTreeにフォーカス"},
    {mode = "n", "<C-n>s", "<cmd>NvimTreeFindFile<CR>", desc = "開いているファイルをNvimTreeで表示"},
    {mode = "n", "<C-n>c", "<cmd>NvimTreeCollapse<CR>", desc = "NvimTreeのフォルダを閉じる"},
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        git_ignored = false,
        custom = {
         "^\\.git",
         "^node_modules",
         "^\\.venv",
         "^\\.idea",
         "\\.ipynb_checkpoints",
         "\\.pytest_cache",
         "\\.DS_Store",
         "cdk.out",
         "__pycache__",
        },
      },
      git = {
        enable = true,
        ignore = true,
      },
      renderer = {
       root_folder_label = false, 
      },
    }

  end,
}
