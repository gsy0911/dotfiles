return {
  "nvim-treesitter/nvim-treesitter",
  -- mainブランチはNeovim 0.12+対応（masterブランチは0.11までしかサポートしない）
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    -- パーサーのインストール先を明示的に指定（Nix環境等での権限問題を回避して永続化）
    -- mainブランチではinstall_dirオプションを使用
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- よく使う言語のパーサーをインストール（未インストールの場合のみ実行）
    require("nvim-treesitter").install({
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
    })
  end,
}
