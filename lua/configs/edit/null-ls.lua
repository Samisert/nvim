local null_ls = require("null-ls")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	sources = {
		-- lua
		null_ls.builtins.formatting.stylua,
		-- c, c++
		-- null_ls.builtins.diagnostics.clang_check,
		null_ls.builtins.formatting.clang_format,
		-- cmake
		-- null_ls.builtins.diagnostics.cmake_lint,
		-- null_ls.builtins.formatting.cmake_format,
		-- python
		null_ls.builtins.diagnostics.pylint,
		null_ls.builtins.formatting.black,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})
