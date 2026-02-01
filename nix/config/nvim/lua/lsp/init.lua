
-- サーバー設定リスト
-- 設定ファイルがあるものはrequireし、ないものは空テーブル
local servers = {
  lua_ls = require('lsp.lua_ls'),
  pyright = require('lsp.pyright'),
  ts_ls = require('lsp.ts_ls'),
  dockerls = require('lsp.dockerls'),
  docker_compose_language_service = require('lsp.docker_compose'),
  intelephense = require('lsp.intelephense'),
  ruff = {},
  html = {},
  yamlls = {},
  jsonls = {},
  taplo = {},
  tinymist = {},
  typos_lsp = {},
}

-- capabilitiesの取得 (cmp-nvim-lspが必要)
local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  has_cmp and cmp_nvim_lsp.default_capabilities() or {}
)

-- LspAttach設定 (キーマップなど)
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(ev)
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gt", "<C-t>", bufopts) 
    vim.keymap.set("n", "gf", vim.lsp.buf.format, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, bufopts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
    -- 診断情報をquickfixリストで表示
    vim.keymap.set("n", "qq", function()
      vim.diagnostic.setqflist({ open = true })
    end, bufopts)
  end,
})

-- 各サーバーのセットアップ
for server_name, config in pairs(servers) do
  config.capabilities = vim.tbl_deep_extend("force", capabilities, config.capabilities or {})
  vim.lsp.config(server_name, config)
  vim.lsp.enable(server_name)
end
