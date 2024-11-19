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
    local integration = minimap.gen_integration.diff(hl_groups)

    minimap.setup({
      integrations = { integration }
    })
    minimap.open()
  end
} 
