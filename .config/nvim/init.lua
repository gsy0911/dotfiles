-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'
vim.wo.number = true
vim.opt.swapfile = false
vim.g.have_nerd_font = true

-- モード切り替えと保存
vim.keymap.set("i", "jj", "<esc><cmd>w<CR>")
vim.keymap.set("i", "<C-g>", "<esc><cmd>w<CR>")
vim.keymap.set("i", "kk", "<esc><cmd>w<CR>")
-- ファイル切り替え
-- vim.keymap.set("n", "<C-h>", "<cmd>bprev<CR>")
-- vim.keymap.set("n", "<C-l>", "<cmd>bnext<CR>")
-- タブ切り替え
vim.keymap.set("n", "<C-t>", "<cmd>tabNext<CR>")
-- クリップボードへコピー
vim.keymap.set("n", "<space>d", '"*dd')
vim.keymap.set("v", "<space>d", '"*dd')
vim.keymap.set("n", "<space>y", '"*yy')
vim.keymap.set("v", "<space>y", '"*yy')
vim.keymap.set("n", "<space>p", '"*p')
vim.keymap.set("v", "<space>p", '"*p')
-- cursor
vim.opt.guicursor = "n-i:ver25"
-- say
vim.keymap.set("n", "<space>say", function()
  local current_word = vim.fn.expand("<cword>")
  vim.api.nvim_feedkeys(":!say -v Ava " .. current_word .. "\n", "n", false)
end, { desc = "say command" })

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = { { import = "plugins" } },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

local function copy_current_file_path()
  local path = vim.fn.expand "%:."
  vim.fn.setreg("*", path)
  vim.api.nvim_echo({ { "Copied: " .. path, "None" } }, true, {})
end
-- Keymap("<Leader>yp", copy_current_file_path)

vim.keymap.set("n", "<Leader>y", copy_current_file_path, { noremap = true, silent = true })

