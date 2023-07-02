local nvim_lsp = require("lspconfig")

nvim_lsp.clangd.setup({
  cmd = {
    "clangd",
    "--query-driver=D:\\Environment\\msys64\\mingw64\\bin\\gcc.exe, D:\\Environment\\msys64\\mingw64\\bin\\g++.exe"
  },
  filetypes = {
    "c", "cpp", "objc", "objcpp", "cuda", "proto"
  },
  single_file_support = true,
})
