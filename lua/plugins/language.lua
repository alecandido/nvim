local parent = ...

local formatter = require(parent .. ".formatter")
local lsp_zero = require(parent .. ".lsp-zero")
local nvim_cmp = require(parent .. ".nvim-cmp")
local treesitter = require(parent .. ".treesitter")
local trouble = require(parent .. ".trouble")

return {
  -- Symbols & related
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
    opts = treesitter.opts,
  },
  'simrat39/symbols-outline.nvim',

  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },
    },
  },

  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
      -- LSP Support
      'neovim/nvim-lspconfig',

      -- Autocompletion
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',

      -- Autoformat
      'lukas-reineke/lsp-format.nvim',

      -- Additional lua configuration for nvim
      'folke/neodev.nvim',
    },
    opts = {
      servers = { 'nil_ls', 'lua_ls', 'tsserver', 'eslint', 'pyright' },
    },
    config = lsp_zero.config,
  },

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',

      -- Further completion sources,
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'petertriho/cmp-git',
      'hrsh7th/cmp-emoji',
      'hrsh7th/cmp-calc',
      'uga-rosa/cmp-dictionary',
      'hrsh7th/cmp-cmdline',
    },
    config = nvim_cmp.config,
  },

  -- Formatting, complementary to the LSP (when not available)
  {
    "mhartington/formatter.nvim",
    opts = formatter.opts,
    init = formatter.init,
  },

  -- Debug
  {
    'mfussenegger/nvim-dap',
    keys = {},
  },
  {
    "rcarriga/nvim-dap-ui",
    requires = { "mfussenegger/nvim-dap" }
  },

  -- Diagnostics
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = trouble.keys,
  },

  {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
  },

  -- Bunch of syntaxes for those languages which I do not bother installing a language
  -- server for
  "sheerun/vim-polyglot",

  -- Neovim specific
  {
    'folke/neodev.nvim',
    opts = {
      library = { plugins = { "nvim-dap-ui" }, types = true }
    },
  }
}
