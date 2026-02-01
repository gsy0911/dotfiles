return {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    local servers = {
      "lua_ls",
      "pyright",
      "ruff",
      "ts_ls",
      "html",
      "yamlls",
      "jsonls",
      "dockerls",
      "docker_compose_language_service",
      "taplo",
      "intelephense",
      "tinymist",
      "typos_lsp",
    }

    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    -- LSP設定の読み込み (lua/lsp/init.lua)
    -- Neovim 0.11+ style: vim.lsp.config & vim.lsp.enable
    require("lsp")
  end,
}
