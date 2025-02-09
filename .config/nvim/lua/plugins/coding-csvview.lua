return {
  'hat0uma/csvview.nvim',
  ft = { "csv" },
  config = function()
    require('csvview').setup()
    local csvview = require('csvview')
    vim.keymap.set('n', '<leader>ct', csvview.toggle, { desc = 'toggle CsvView' })
    vim.keymap.set('n', '<leader>ww', '<cmd>set wrap<CR>', { desc = 'set wrap' })
    vim.keymap.set('n', '<leader>wn', '<cmd>set nowrap<CR>', { desc = 'set nowrap' })
  end
}
