return {
  "petertriho/nvim-scrollbar",
  -- enabled = false,
  config = function()
    require("scrollbar.handlers.search").setup({
        -- hlslens config overrides
    })
  end
}
