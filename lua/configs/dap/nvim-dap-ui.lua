local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close({})
  -- dapui.repl.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close({})
  -- dap.repl.close()
end
