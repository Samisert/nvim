return {
	event = "VeryLazy",
	"tpope/vim-fugitive",
	cmd = "Git",
	config = function()
		-- convert
		vim.cmd.cnoreabbrev([[git Git]])
		vim.cmd.cnoreabbrev([[gp Git push]])
	end,
}
