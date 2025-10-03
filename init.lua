-- [[ lazy.nvim setup ]]
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- [[ Basic Keymaps ]]
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("n", "<leader>qq", ":qa<CR>", { desc = "Quit all windows" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Save buffer" })
vim.keymap.set("n", "<S-l>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { desc = "Close current buffer" })
vim.keymap.set("n", "<leader>bo", ":%bd|e#<CR>", { desc = "Close all other buffers" })
vim.keymap.set("n", "<leader>l", ":Lazy<CR>", { desc = "Open Lazy" })
vim.keymap.set("n", "<leader>rr", ":LspRestart<CR>", { desc = "Restart LSP" })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
vim.keymap.set("n", "<leader>wd", ":close<CR>", { desc = "Close window" })
vim.keymap.set("n", "<leader>sl", ":vsplit<CR>", { desc = "Split window right" })
vim.keymap.set("n", "<leader>sh", ":leftabove vsplit<CR>", { desc = "Split window left" })
vim.keymap.set("n", "<leader>sj", ":split<CR>", { desc = "Split window below" })
vim.keymap.set("n", "<leader>sk", ":topleft split<CR>", { desc = "Split window above" })

-- persistence.nvim
vim.keymap.set("n", "<leader>qs", function()
  require("persistence").load()
end, { desc = "Restore last session for current directory" })
vim.keymap.set("n", "<leader>ql", function()
  require("persistence").load()
end, { desc = "Restore last session" })
vim.keymap.set("n", "<leader>qd", function()
  require("persistence").stop()
end, { desc = "Don't save current session" })

-- [[ Basic Options ]]
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"
vim.opt.breakindent = true
vim.opt.updatetime = 250
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.diagnostic.config({ virtual_text = true })
vim.opt.splitright = true
vim.opt.splitbelow = true

-- [[ Basic Autocmds ]]
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Set indentation for lua files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

-- Set indentation for cs files
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cs",
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.shiftwidth = 4
  end,
})

-- [[ lazy.nvim plugins ]]
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- configure any options here
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
