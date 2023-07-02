return {

  --[[ * UI ]]
  -- colorscheme
  {
    "RRethy/nvim-base16",
    event = "VeryLazy",
  },
  -- lualine: statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
  },
  -- bufferline: tab window
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  -- lspsaga: better lsp views
  {
    "glepnir/lspsaga.nvim",
    event = "VeryLazy",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" },
    },
  },
  -- nvim-dap-ui: for better debug
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
  },

  --[[ * VSC ]]
  -- git-tools
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
  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    config = function()
      require("gitsigns").setup()
    end,
  },
  -- conflict-marker better view
  {
    "rhysd/conflict-marker.vim",
    event = "VeryLazy",
    config = function()
      vim.cmd([[
        " disable the default highlight group
        let g:conflict_marker_highlight_group = ""

        " Include text after begin and end markers
        let g:conflict_marker_begin = "^<<<<<<< .*$"
        let g:conflict_marker_end   = "^>>>>>>> .*$"

        highlight ConflictMarkerBegin guibg=#2f7366
        highlight ConflictMarkerOurs guibg=#2e5049
        highlight ConflictMarkerTheirs guibg=#344f69
        highlight ConflictMarkerEnd guibg=#2f628e
        highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81
      ]])
    end,
  },
  -- github browser
  {
    "tpope/vim-rhubarb",
    event = "VeryLazy",
  },

  --[[ * LSP ]]
  -- mason: LSP config-tools
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  },
  -- mason-lspconfig: pipe for mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
  },
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
  },

  --[[ * DAP ]]
  -- nvim-dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
  },

  --[[ * Edit ]]
  -- cmp: complete the code
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
  -- null-ls: code lint and formatter
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
  },
  -- neodev: for help document
  {
    "folke/neodev.nvim",
    event = "VeryLazy",
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
  },
  -- textobjects: more textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  -- nvim-surround
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
  },
  -- comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
  },
  -- eyeliner
  {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
  },

  --[[ * UITLS ]]
  -- nvim-tree
  {
    "nvim-tree/nvim-tree.lua",
    event = "VeryLazy",
    cmd = { "NvimTreeToggle" },
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  -- telescope
  {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    cmd = "Telescope",
    tag = "0.1.1",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- which-key.nvim: show keymaps
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
  },
  -- sessions
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
  },
}
