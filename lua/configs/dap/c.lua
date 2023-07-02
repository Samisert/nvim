local dap = require("dap")

dap.adapters.cdbg = {
  id = "cdbg",
  type = "executable",
  -- using in Windows
  command =
  "C:\\Users\\93583\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
  options = {
    detached = false
  },
  -- using in Linux
  -- command =
  -- "C:\\Users\\93583\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7",
  setupCommands = {
    {
      text = "-enable-pretty-printing",
      description = "enable pretty printing",
      ignoreFailures = false
    },
  },
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "cdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtEntry = true,
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "D:\\Environment\\msys64\\mingw64\\bin\\gdb.exe",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
  }
}
