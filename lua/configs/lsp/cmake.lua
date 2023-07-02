local nvim_lsp = require("lspconfig")

nvim_lsp.cmake.setup({
	cmd = {
		"cmake-language-server",
	},
	filetypes = { "cmake" },
	init_options = {
		buildDirectory = "build",
	},
	root_dir = nvim_lsp.util.root_pattern("CMakePresets.json", "CTestConfig.cmake", ".git", "build", "cmake"),
	single_file_support = true,
})
