return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- よく使う言語のパーサーをインストール
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "query",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "html",
        "css",
        "json",
        "yaml",
        "toml",
        "dockerfile",
        "php",
        "bash",
        "markdown",
        "markdown_inline",
        "git_config",
        "gitignore",
      },
      sync_install = false,
      auto_install = true,
      
      highlight = {
        enable = true, -- ハイライトを有効化
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
