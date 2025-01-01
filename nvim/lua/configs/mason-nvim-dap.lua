local mason_dap = require("mason-nvim-dap")

mason_dap.setup({
  ensure_installed = { "python", "cppdbg", "lldb" },
  automatic_installation = true,
})
