-- ~/.config/nvim/lua/plugins/latex.lua

return {
  {
    "lervag/vimtex",
    lazy = false, -- Recommended by the author to not lazy-load
    init = function()
      -- Minimal config: use Zathura (which you have) as the PDF viewer
      vim.g.vimtex_view_method = 'zathura'
      -- Set the variant to 'lualatex' or 'pdflatex'
      vim.g.vimtex_compiler_method = 'latexmk'
    end
  }
}
