return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- パーサーのインストール先を明示的に指定（Nix環境等での権限問題を回避して永続化）
    local parser_install_dir = vim.fn.stdpath("data") .. "/treesitter"
    vim.opt.runtimepath:prepend(parser_install_dir)

    require("nvim-treesitter.configs").setup({
      parser_install_dir = parser_install_dir,
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
      sync_install = true,
      auto_install = true,
      
      highlight = {
        enable = true, -- ハイライトを有効化
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
