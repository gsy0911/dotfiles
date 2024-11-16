return {
  "4513ECHO/nvim-keycastr",
  config = function()
    local keycastr = require("keycastr")
    keycastr.config.set {
      ignore_mouse = true,
      position = "SE",
      win_config = {
        border = "rounded",
      }
    }
    keycastr.enable()
  end,
  enabled = false,
}

