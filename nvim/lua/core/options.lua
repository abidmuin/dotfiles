-- lua/core/options.lua

-- SYNC CLIPBOARD
vim.opt.clipboard = "unnamedplus"

-- LINE NUMBER
vim.opt.number = true
vim.opt.relativenumber = true

-- INDENTATION
-- tabs converted to spaces
vim.opt.expandtab = true
-- shift indentation size
vim.opt.shiftwidth = 2
-- 1 tab = 2 spaces
vim.opt.tabstop = 2

-- SEARCH
vim.opt.ignorecase = true
-- override ignore case settings if a capital letter is included
vim.opt.smartcase = true
