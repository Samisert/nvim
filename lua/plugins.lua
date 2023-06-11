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
	{
		"glepnir/lspsaga.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			--Please make sure you install markdown and markdown_inline parser
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- dap stuffs
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
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
		event = "VeryLazy",
		config = function()
			require("neodev").setup({
				library = { plugins = { "nvim-dap-ui" }, types = true },
			})
		end,
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
		event = "VeryLazy",
		cmd = { "NvimTreeToggle" },
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- sessions
	{
		"folke/persistence.nvim",
		event = "BufReadPre", -- this will only start session saving when an actual file was opened
		config = function()
			require("persistence").setup()
		end,
	},

	-- bufferline
	{
		"akinsho/bufferline.nvim",
		event = "VeryLazy",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- eyeliner
	{
		"jinh0/eyeliner.nvim",
		event = "VeryLazy",
		config = function()
			require("eyeliner").setup({
				highlight_on_key = true, -- show highlights only after keypress
				dim = false, -- dim all other characters if set to true (recommended!)
			})
		end,
	},

	-- nvim-surround
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- which-key.nvim
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- comment
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		config = function()
			require("Comment").setup()
		end,
	},
}
