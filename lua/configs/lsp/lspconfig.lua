-- Global mappings.
-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "clangd", "pyright" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig").lua_ls.setup({
	capabilities = capabilities,
})
require("lspconfig").clangd.setup({
	capabilities = capabilities,
})
-- require("lspconfig").cmake.setup({
-- 	capabilities = capabilities,
-- })
require("lspconfig").pyright.setup({
	capabilities = capabilities,
})
