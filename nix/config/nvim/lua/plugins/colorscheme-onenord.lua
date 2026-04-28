return {
  "rmehri01/onenord.nvim",
  enabled = false,
  config = function()
    require("onenord").setup({
      disable = {
        background = false
      }
    })
    
  end
}
