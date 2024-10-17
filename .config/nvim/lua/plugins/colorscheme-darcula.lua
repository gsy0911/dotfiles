return {
  "xiantang/darcula-dark.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  name = "darcula",
  -- enabled = false,
  config = function()
    require("darcula").setup({
    })
    vim.cmd.colorscheme("darcula-dark")
  end
}

