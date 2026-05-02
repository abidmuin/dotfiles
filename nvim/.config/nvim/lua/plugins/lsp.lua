-- ~/.config/nvim/lua/plugins/lsp.lua

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    require("mason").setup()

    local servers = {
      "html",
      "texlab",
      "lua_ls",
      "dockerls",
      "docker_compose_language_service",
      "yamlls",
    }

    require("mason-lspconfig").setup({
      ensure_installed = servers,
    })

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("*", {
      capabilities = capabilities,
    })

    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim", "Snacks" } },
          workspace = { checkThirdParty = false },
        },
      },
    })

    for _, server in ipairs(servers) do
      vim.lsp.enable(server)
    end

    vim.diagnostic.config({
      float = { border = "rounded" },
    })

    vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
      end,
    })
  end,
}
