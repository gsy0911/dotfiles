return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        delay = 0,
      },
      line_num = {
        enable = true,
        style = "#806d9c",
      },
      indent = {
        enable = true,
        chars = {
          "│",
        },
        style = {
          vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
        },
        -- style = {
        --   "#FF0000",
        --   "#FF7F00",
        --   "#FFFF00",
        --   "#00FF00",
        --   "#00FFFF",
        --   "#0000FF",
        --   "#8B00FF",
        -- },
      }
    })
  end
}
