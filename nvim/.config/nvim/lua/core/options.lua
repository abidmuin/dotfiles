-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt

-- SYSTEM
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 300

-- LINE NUMBER
opt.number = true
opt.relativenumber = true

-- INDENTATION
-- tabs converted to spaces
opt.expandtab = true
opt.autoindent = true
-- shift indentation size
opt.shiftwidth = 2
-- 1 tab = 2 spaces
opt.tabstop = 2

-- SEARCH
opt.ignorecase = true
-- override ignore case settings if a capital letter is included
opt.smartcase = true

-- APPEARANCE
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"

-- Centralized location for Java Language Server data
vim.fn.mkdir(vim.fn.stdpath("cache") .. "/jdtls-workspace", "p")
