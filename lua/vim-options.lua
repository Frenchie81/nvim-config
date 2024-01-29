vim.g.mapleader = " "
vim.opt.timeoutlen = 1000
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 999
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.virtualedit = "block"

if (os == "Windows_NT")
then
  vim.opt.shellslash = true
end


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
