local dap = require("dap")

-- DAP keymaps
vim.keymap.set("n", "<F5>", function()
  require("dap").continue()
end, { desc = "DAP: Start/Continue debugging" })

vim.keymap.set("n", "<F10>", function()
  require("dap").step_over()
end, { desc = "DAP: Step over" })

vim.keymap.set("n", "<F11>", function()
  require("dap").step_into()
end, { desc = "DAP: Step into" })

vim.keymap.set("n", "<F12>", function()
  require("dap").step_out()
end, { desc = "DAP: Step out" })

vim.keymap.set("n", "<leader>b", function()
  require("dap").toggle_breakpoint()
end, { desc = "DAP: Toggle breakpoint" })

vim.keymap.set("n", "<leader>B", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "DAP: Set conditional breakpoint" })

vim.keymap.set("n", "<leader>dr", function()
  require("dap").repl.open()
end, { desc = "DAP: Open REPL" })

vim.keymap.set("n", "<leader>dl", function()
  require("dap").run_last()
end, { desc = "DAP: Run last" })

vim.keymap.set("n", "<leader>dt", function()
  require("dap").terminate()
end, { desc = "DAP: Terminate" })

-- DAP UI integration keymaps
vim.keymap.set("n", "<leader>du", function()
  require("dapui").toggle()
end, { desc = "DAP: Toggle UI" })

vim.keymap.set({ "n", "v" }, "<leader>de", function()
  require("dapui").eval()
end, { desc = "DAP: Evaluate expression" })

-- Customize DAP signs
vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "DiagnosticError", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointCondition", { text = "🟡", texthl = "DiagnosticWarn", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⚫", texthl = "DiagnosticInfo", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "▶️", texthl = "DiagnosticOk", linehl = "DapStoppedLine", numhl = "" })
vim.fn.sign_define("DapLogPoint", { text = "📝", texthl = "DiagnosticInfo", linehl = "", numhl = "" })

-- Highlight the line where debugger is stopped
vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })
