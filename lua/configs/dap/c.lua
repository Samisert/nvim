local dap = require("dap")

dap.adapters.cppdbg = {
  -- *** using in Linux
  -- id = "cppdbg",
  -- type = "executable",
  -- command =
  -- "/absolute/path/to/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
  -- *** using in Windows
  id = "cppdbg",
  type = "executable",
  command =
  "D:\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
  options = {
    detached = false
  },
}

dap.configurations.c = {
  {
    name = "Launch file",
    type = "cppdbg",
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
    -- *** using in Linux
    -- name = "Attach to gdbserver :1234",
    -- type = "cppdbg",
    -- request = "launch",
    -- MIMode = "gdb",
    -- miDebuggerServerAddress = "localhost:1234",
    -- miDebuggerPath = "/usr/bin/gdb",
    -- cwd = "${workspaceFolder}",
    -- program = function()
    --   return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    -- end,
    -- setupCommands = {
    --   {
    --     text = "-enable-pretty-printing",
    --     description = "enable pretty printing",
    --     ignoreFailures = false
    --   },
    -- },
    -- *** using in Windows
    name = "Attach to gdbserver :1234",
    type = "cppdbg",
    request = "launch",
    MIMode = "gdb",
    miDebuggerServerAddress = "localhost:1234",
    miDebuggerPath = "D:\\Environment\\Cygwin\\v2_926\\bin\\gdb.exe",
    cwd = "${workspaceFolder}",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    setupCommands = {
      {
        text = "-enable-pretty-printing",
        description = "enable pretty printing",
        ignoreFailures = false
      },
    },
  }
}
