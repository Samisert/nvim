local nvim_lsp = require("lspconfig")

nvim_lsp.clangd.setup({
	cmd = {
		"clangd",
	},
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
		"proto",
	},
	single_file_support = true,
})
