return {

  -- colorscheme
    require("colorscheme"),

  -- git stuffs
  {
		"tpope/vim-fugitive",
		event = "VeryLazy",
		cmd = "Git",
		config = function()
			-- convert
			vim.cmd.cnoreabbrev([[git Git]])
			vim.cmd.cnoreabbrev([[gp Git push]])
		end
	},
  {
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end
	},
  
  -- lsp stuffs
  {
		"williamboman/mason.nvim",
		event = "VeryLazy",
		build = ":MasonUpdate" -- :MasonUpdate updates registry contents
	},
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy"
  },
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy"
  },

}
