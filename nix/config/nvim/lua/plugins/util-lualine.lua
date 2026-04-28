
return {
  'nvim-lualine/lualine.nvim',
  event = "VeryLazy",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      bg       = '#3C3F41',
      bg_dark  = '#2B2B2B',
      fg       = '#A9B7C6',
      orange   = '#CC7832',
      blue     = '#6897BB',
      green    = '#6A8759',
      yellow   = '#FFC66D',
      red      = '#FF5370',
      grey     = '#4E5254',
    }

    local darcula_theme = {
      normal = {
        a = { fg = colors.bg_dark, bg = colors.orange, gui = 'bold' },
        b = { fg = colors.fg,      bg = colors.grey },
        c = { fg = colors.fg,      bg = colors.bg },
      },
      insert  = { a = { fg = colors.bg_dark, bg = colors.blue,   gui = 'bold' } },
      visual  = { a = { fg = colors.bg_dark, bg = colors.green,  gui = 'bold' } },
      replace = { a = { fg = colors.bg_dark, bg = colors.red,    gui = 'bold' } },
      command = { a = { fg = colors.bg_dark, bg = colors.yellow, gui = 'bold' } },
      inactive = {
        a = { fg = colors.fg, bg = colors.bg_dark },
        b = { fg = colors.fg, bg = colors.bg_dark },
        c = { fg = colors.fg, bg = colors.bg_dark },
      },
    }

    local lualine = require('lualine')
    
    -- フルパスを表示するカスタムコンポーネント
    local function fullpath()
      return vim.fn.expand('%:p')
    end
    
    local config = {
      options = {
        theme = darcula_theme,
        component_separators = '',
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
        lualine_b = { fullpath, 'branch' },
        lualine_c = { 'diff', 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat' },
        lualine_y = { 'filetype' },
        lualine_z = { { 'location', separator = { right = '' }, left_padding = 2 } },
      },
      inactive_sections = {
        lualine_a = { fullpath },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { 'location' },
      },
    }
    lualine.setup(config)
  end
}

