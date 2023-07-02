local nvim_lsp = require("lspconfig")

nvim_lsp.cmake.setup({
  cmd = {
    "cmake-language-server"
  },
  filetypes = { "cmake" },
  init_options = {
    buildDirectory = "cmake-build-debug"
  },
  single_file_support = true
})
