-- ~/.config/nvim/lua/core/lazy.lua

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- This imports everything from lua/plugins/*.lua automatically
    { import = "plugins" },
  },
  checker = { enabled = true }, -- Automatically check for plugin updates
})
