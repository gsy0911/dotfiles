return {
  "williamboman/mason-lspconfig.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls" },
    }
  end,
}
