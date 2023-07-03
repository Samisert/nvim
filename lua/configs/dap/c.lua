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
  -- "/home/archlinux/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
  -- },
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
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false
      },
    },
  },
  {
    name = "Attach to gdbserver :1234",
    type = "cdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    -- using in Windows
    miDebuggerPath = "D:\\Environment\\msys64\\mingw64\\bin\\gdb.exe",
    -- using in Linux
    -- miDebuggerPath = "/usr/bin/gdb",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
  }
}
