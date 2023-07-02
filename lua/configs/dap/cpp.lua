local dap = require("dap")

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	-- using in Windows
	command = "C:\\Users\\93583\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe",
	options = {
		detached = false,
	},
	-- using in Linux
	-- command =
	-- "C:\\Users\\93583\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7",
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
		stopAtEntry = true,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "D:\\Environment\\msys64\\mingw64\\bin\\gdb.exe",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		setupCommands = {
			{
				text = "-enable-pretty-printing",
				description = "enable pretty printing",
				ignoreFailures = false,
			},
		},
	},
}
