return { 
  'echasnovski/mini.nvim',
  version = false,
  -- enabled = false,
  lazy = false,
  config = function()
    require('mini.map').setup()
    local minimap = require('mini.map')
    minimap.open()
  end
} 
