return {
  'akinsho/bufferline.nvim',
  enabled = false,
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    vim.opt.termguicolors = true
    require("bufferline").setup{}
  end
}

