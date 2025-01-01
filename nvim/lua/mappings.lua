require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- DAP
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- DAP keymaps
map("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
map("n", "<F10>", ":lua require'dap'.step_over()<CR>", opts)
map("n", "<F11>", ":lua require'dap'.step_into()<CR>", opts)
map("n", "<F12>", ":lua require'dap'.step_out()<CR>", opts)
map("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
map("n", "<Leader>dr", ":lua require'dap'.repl.open()<CR>", opts)
map("n", "<Leader>dl", ":lua require'dap'.run_last()<CR>", opts)

local function compile_and_run_cpp()
	-- Get the current file name and directory
	local file = vim.fn.expand("%:p")
	local output = vim.fn.expand("%:r") -- Use the same name without extension for the output
  
	-- Compile and run the file
	local compile_cmd = string.format("g++ -g %s -o %s && ./%s", file, output, output)
	vim.cmd(string.format(":!%s", compile_cmd))
  end
  
  -- Create a keymap for compiling and running
  vim.keymap.set("n", "<leader>cr", compile_and_run_cpp, { desc = "Compile and Run C++ File" })
  