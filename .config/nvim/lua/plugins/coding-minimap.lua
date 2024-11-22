return { 
  'echasnovski/mini.nvim',
  version = false,
  -- enabled = false,
  lazy = false,
  config = function()
   require('mini.diff').setup()
   local minimap = require('mini.map')
    -- :h MiniMap.gen_integration
    -- local hl_groups = {
    --   add = "GitSignsAdd",       -- 追加された行に対するハイライトグループ
    --   change = "GitSignsChange", -- 変更された行に対するハイライトグループ
    --   delete = "GitSignsDelete", -- 削除された行に対するハイライトグループ
    -- }
    -- local gitsing_integration = minimap.gen_integration.gitsigns(hl_groups)
    
    local hl_groups = {
      add = "MiniDiffSignAdd",       -- 追加された行に対するハイライトグループ
      change = "MiniDiffSignChange", -- 変更された行に対するハイライトグループ
      delete = "MiniDiffDelete", -- 削除された行に対するハイライトグループ
    }
    local diff_integration = minimap.gen_integration.diff(hl_groups)

    local search_integration = minimap.gen_integration.builtin_search()
    local diagnostic_integration = minimap.gen_integration.diagnostic({
      error = 'DiagnosticFloatingError',
      warn  = 'DiagnosticFloatingWarn',
      info  = 'DiagnosticFloatingInfo',
      hint  = 'DiagnosticFloatingHint',
    })

    minimap.setup({
      integrations = { diff_integration, search_integration, diagnostic_integration }
    })
    minimap.open()
    vim.keymap.set('n', '<C-m>o', minimap.open, { desc = 'open minimap' })
    vim.keymap.set('n', '<C-m>c', minimap.close, { desc = 'close minimap' })
  end
} 
