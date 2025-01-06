return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>a", "", desc = "avente" },
      { "<leader>c", "", desc = "CSV-related" },
      { "<leader>f", "", desc = "fuzzy finder" },
      { "<leader>g", "", desc = "Git-related" },
      { "<leader>l", "", desc = "lazygit" },
      { "<leader>m", "", desc = "minimap" },
      { "<leader>w", "", desc = "wrap content" },
    })
  end,
  keys = {
    {
      "<leader>?",
      function()
        local wk = require("which-key")
        wk.show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
