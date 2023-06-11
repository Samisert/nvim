require("lspsaga").setup({})

local keymap = vim.keymap.set

-- 跳转到声明
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true, noremap = true })
-- 跳转到定义
keymap("n", "gD", "<cmd>lua vim.lsp.buf.definition()<CR>", { silent = true, noremap = true })
-- 显示注释文档
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true, noremap = true })
-- 跳转到实现
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", { silent = true, noremap = true })
-- 跳转到引用位置
keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true, noremap = true })
-- 以浮窗形式显示错误
keymap("n", "go", "<cmd>lua vim.diagnostic.open_float()<CR>", { silent = true, noremap = true })

keymap("n", "gp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { silent = true, noremap = true })
keymap("n", "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", { silent = true, noremap = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_cursor_diagnostics<CR>", { silent = true, noremap = true })
keymap("n", "<leader>cd", "<cmd>Lspsaga show_line_diagnostics<CR>", { silent = true, noremap = true })
keymap("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
keymap("v", "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true, noremap = true })
