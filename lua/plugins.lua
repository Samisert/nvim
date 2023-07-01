return {

  --[[ * UI ]]
  -- colorscheme
  require("colorscheme"),
  -- bufferline: tab window
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
  },
  -- lualine: statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
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
  -- github browser
  {
    "tpope/vim-rhubarb",
    event = "VeryLazy",
  },
  -- conflict-marker better view
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

  --[[ * LSP ]]
  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
  },
  -- mason: LSP config-tools
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
  },
  -- mason-lspconfig: pipe for mason and lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = "VeryLazy",
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
  -- clangd_extensions
  -- {
  --   "p00f/clangd_extensions.nvim",
  -- },
  -- extensions = {
  --   -- defaults:
  --   -- Automatically set inlay hints (type hints)
  --   autoSetHints = true,
  --   -- These apply to the default ClangdSetInlayHints command
  --   inlay_hints = {
  --     inline = vim.fn.has("nvim-0.10") == 1,
  --     -- Only show inlay hints for the current line
  --     only_current_line = false,
  --     -- Event which triggers a refersh of the inlay hints.
  --     -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
  --     -- not that this may cause  higher CPU usage.
  --     -- This option is only respected when only_current_line and
  --     -- autoSetHints both are true.
  --     only_current_line_autocmd = "CursorHold",
  --     -- whether to show parameter hints with the inlay hints or not
  --     show_parameter_hints = true,
  --     -- prefix for parameter hints
  --     parameter_hints_prefix = "← ",
  --     -- prefix for all the other hints (type, chaining)
  --     other_hints_prefix = "⟹  ",
  --     -- whether to align to the length of the longest line in the file
  --     max_len_align = false,
  --     -- padding from the left if max_len_align is true
  --     max_len_align_padding = 1,
  --     -- whether to align to the extreme right or not
  --     right_align = false,
  --     -- padding from the right if right_align is true
  --     right_align_padding = 7,
  --     -- The color of the hints
  --     highlight = "Comment",
  --     -- The highlight group priority for extmark
  --     priority = 100,
  --   },
  --   ast = {
  --     -- These are unicode, should be available in any font
  --     role_icons = {
  --       type = "🄣",
  --       declaration = "🄓",
  --       expression = "🄔",
  --       statement = ";",
  --       specifier = "🄢",
  --       ["template argument"] = "🆃",
  --     },
  --     kind_icons = {
  --       Compound = "🄲",
  --       Recovery = "🅁",
  --       TranslationUnit = "🅄",
  --       PackExpansion = "🄿",
  --       TemplateTypeParm = "🅃",
  --       TemplateTemplateParm = "🅃",
  --       TemplateParamObject = "🅃",
  --     },
  --     --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
  --           role_icons = {
  --               type = "",
  --               declaration = "",
  --               expression = "",
  --               specifier = "",
  --               statement = "",
  --               ["template argument"] = "",
  --           },
  --
  --           kind_icons = {
  --               Compound = "",
  --               Recovery = "",
  --               TranslationUnit = "",
  --               PackExpansion = "",
  --               TemplateTypeParm = "",
  --               TemplateTemplateParm = "",
  --               TemplateParamObject = "",
  --           }, ]]
  --
  --     highlights = {
  --       detail = "Comment",
  --     },
  --   },
  --   memory_usage = {
  --     border = "none",
  --   },
  --   symbol_info = {
  --     border = "none",
  --   },
  -- },

  --[[ * DAP ]]
  -- nvim-dap
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
  },
  -- nvim-dap-ui: for better debug
  {
    "rcarriga/nvim-dap-ui",
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
    config = function()
      require("neodev").setup({
        library = { plugins = { "nvim-dap-ui" }, types = true },
      })
    end,
  },
  -- autopairs
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  -- textobjects: more textobjects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  -- eyeliner
  {
    "jinh0/eyeliner.nvim",
    event = "VeryLazy",
    config = function()
      require("eyeliner").setup({
        highlight_on_key = true, -- show highlights only after keypress
        dim = false,             -- dim all other characters if set to true (recommended!)
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
  -- comment
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
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
    opts = {
      -- refer to the configuration section below
    },
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
