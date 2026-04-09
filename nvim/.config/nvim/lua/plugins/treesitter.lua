-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        ensure_installed = { "lua", "vim", "markdown", "markdown_inline", "bash", "java", "latex", "bibtex", },
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
