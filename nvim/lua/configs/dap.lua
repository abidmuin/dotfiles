local dap = require("dap")
local dapui = require("dapui")

-- Setup dap-ui
dapui.setup()

-- Open/close dap-ui automatically with DAP
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Python configuration
dap.adapters.python = {
  type = "executable",
  command = "python",
  args = { "-m", "debugpy.adapter" },
}
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    pythonPath = function()
      return vim.fn.input("Python path: ", vim.fn.exepath("python"), "file")
    end,
  },
}

-- C/C++ configuration
local cppdbg_path = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7"
if vim.fn.executable(cppdbg_path) == 0 then
  vim.notify("cppdbg adapter not found! Install it via Mason.", vim.log.levels.ERROR)
end

dap.adapters.cppdbg = {
  id = "cppdbg",
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
}
dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
	setupCommands = {
		{
		  text = "-enable-pretty-printing",
		  description = "Enable pretty printing",
		  ignoreFailures = false,
		},
	  },  
  },
}
dap.configurations.c = dap.configurations.cpp
