local lspconfig = require("lspconfig")
local capabilities = lspconfig.default_capabilities()
lspconfig.clangd.setup({
  capabilities = capabilities
})
