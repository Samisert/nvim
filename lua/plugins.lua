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
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
	},
	{
		"tpope/vim-rhubarb",
		event = "VeryLazy",
	},
	{
		"rhysd/conflict-marker.vim",
		event = "VeryLazy",
		config = function()
			vim.cmd([[
        " disable the default highlight group
        let g:conflict_marker_highlight_group = ''

        " Include text after begin and end markers
        let g:conflict_marker_begin = '^<<<<<<< .*$'
        let g:conflict_marker_end   = '^>>>>>>> .*$'

        highlight ConflictMarkerBegin guibg=#2f7366
        highlight ConflictMarkerOurs guibg=#2e5049
        highlight ConflictMarkerTheirs guibg=#344f69
        highlight ConflictMarkerEnd guibg=#2f628e
        highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
      ]])
		end,
	},

	-- lsp stuffs
	{
		"williamboman/mason.nvim",
		event = "VeryLazy",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{
		"williamboman/mason-lspconfig.nvim",
		event = "VeryLazy",
	},
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
	},

	-- dap stuffs
	{
		"mfussenegger/nvim-dap",
	},
	{
		"rcarriga/nvim-dap-ui",
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		tag = "0.1.1",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- cmp
	{
		"hrsh7th/nvim-cmp",
		event = "VeryLazy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
		},
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
	},
	{
		"folke/neodev.nvim",
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},

	-- nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		cmd = { "NvimTreeToggle" },
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},

	-- sessions
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("persistence").setup()
		end,
	},
}
