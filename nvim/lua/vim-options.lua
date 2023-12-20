vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

augroup("setCsharpIndent", { clear = true })
autocmd("Filetype", {
  group = "setCsharpIndent",
  pattern = { "cs" },
  command = "setlocal autoindent noexpandtab tabstop=4 shiftwidth=4"
})

--local os = vim.loop.os_uname().sysname
-- if (os == "Windows_NT")
--end
