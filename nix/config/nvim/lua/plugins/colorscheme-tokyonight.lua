return {
  "folke/tokyonight.nvim",
  name = "tokyonight",
  priority = 1000,
  -- enabled = false,
  config = function()
    require("tokyonight").setup({
      theme = "tokyonight",
    })
    vim.cmd.colorscheme("tokyonight-night")
  end
}
