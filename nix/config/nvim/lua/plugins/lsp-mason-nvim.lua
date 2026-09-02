return {
  "mason-org/mason.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("mason").setup()
  end,
}
