vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- use jj to exit insert mode
local keymap = vim.keymap;
keymap.set("i", "jj", "<Esc>");

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

augroup("setCsharpIndent", { clear = true })
autocmd("Filetype", {
  group = "setCsharpIndent",
  pattern = { "cs" },
  command = "setlocal expandtab tabstop=4 shiftwidth=4"
})
